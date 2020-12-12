# vibrant purple: 3 shiny lavender, 1 mirrored gray, 4 muted bronze

# shiny gold: 2 dark red
# dark red: 2 dark orange
# dark orange: 2 dark yellow
# dark yellow: 2 dark green
# dark green: 2 dark blue
# dark blue: 2 dark violet
# dark violet: none
# (1 * 2) + (2 * 2) + (4 * 2) + (8 * 2)

file = File.open("./clean_input.txt")

BagRule = Struct.new(:name, :count)

parsedLines = file.map do |line|
  src, unparsedDest = line.strip.split(": ")
  dests = unparsedDest.split(", ")

  bag_rules =
    if dests == ["none"]
      []
    else
      dests.map do |dest|
        count, name = dest.match(/(\d+) (.*)/).captures
        BagRule.new(name, count.to_i)
      end
    end
  [src, bag_rules]
end

# { "vibrant purple": ["shiny lavendar", "mirrored gray", "muted bronze"] }
# { "spotted black": [] }
traversal_hash =
  parsedLines.reduce({}) do |accum, line|
    src, dests = line

    accum[src] = dests

    accum
  end

def traverse_bags(total, bags_above, current_bag, traversal_hash)
  return total if traversal_hash[current_bag.name] == []

  total + traversal_hash[current_bag.name].sum do |dest_bag|
    new_bags_above = bags_above * dest_bag.count
    bags_of_bags = bags_above * dest_bag.count
    traverse_bags(bags_of_bags, new_bags_above, dest_bag, traversal_hash)
  end
end

shiny_gold = BagRule.new("shiny gold", 1)

puts traverse_bags(0, 1, shiny_gold, traversal_hash)

# initial_bags = traversal_hash.keys

# puts initial_bags

# bag_results = initial_bags.map do |bag|
#   if bag == "shiny gold"
#     false
#   else
#     traverse_bags(bag, traversal_hash)
#   end
# end

# # puts bag_results
# puts bag_results.filter { |val| val }.size

# puts results
