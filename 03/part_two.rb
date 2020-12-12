require_relative 'input'

#  ..##.......
#  #...#...#..
#  .#....#..#.
#  ..#.#...#.#
#  .#...##..#.
#  ..#.##.....
#  .#.#.#....#
#  .#........#
#  #.##...#...
#  #...##....#
#  .#..#...#.#

# parse the input map into array of data
terrain = INPUT.map { |line| line.split('') }

# Right 1, down 1.
#   Right 3, down 1. (This is the slope you already checked.) 193
# Right 5, down 1.
#   Right 7, down 1.
#   Right 1, down 2.

slopes = [
  { x: 1, y: 1 },
  { x: 3, y: 1 },
  { x: 5, y: 1 },
  { x: 7, y: 1 },
  { x: 1, y: 2 },
]

# traverse the map and look for trees
tree_counts_for_each_slope =
  slopes.map do |slope|
    running_x_pos = 0
    rows_to_check = terrain.each.with_index.filter do |_row, index|
      (index % slope[:y]).zero?
    end.map { |row, _index| row }

    raise StandardError if rows_to_check.size < 150

    filtered_rows =
      rows_to_check.filter do |row|
        encountered_tree = row[running_x_pos % row.size] == '#'
        running_x_pos += slope[:x]
        encountered_tree
      end

    filtered_rows.size
  end

puts tree_counts_for_each_slope.reduce(&:*)
