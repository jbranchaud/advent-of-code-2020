# vibrant purple: shiny lavender, mirrored gray, muted bronze

file = File.open("./clean_input.txt")

parsedLines = file.map do |line|
  src, unparsedDest = line.strip.split(": ")
  dests = unparsedDest.split(", ")
  [src, dests]
end

# require 'pry'; binding.pry;

# { "vibrant purple": ["shiny lavendar", "mirrored gray", "muted bronze"] }
# { "spotted black": [] }
traversal_hash =
  parsedLines.reduce({}) do |accum, line|
    src, dests = line

    if dests == ["none"]
      accum[src] = []
    else
      accum[src] = dests
    end

    accum
  end

def traverse_bags(current_bag, traversal_hash)
  return true if current_bag == "shiny gold"

  traversal_hash[current_bag].any? do |dest_bag|
    traverse_bags(dest_bag, traversal_hash)
  end
end

initial_bags = traversal_hash.keys

puts initial_bags

bag_results = initial_bags.map do |bag|
  if bag == "shiny gold"
    false
  else
    traverse_bags(bag, traversal_hash)
  end
end

# puts bag_results
puts bag_results.filter { |val| val }.size

# puts results
