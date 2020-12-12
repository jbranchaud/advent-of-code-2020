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

# traverse the map and look for trees
x = 0
rows_with_tree_collisions =
  terrain.filter do |row|
    encountered_tree = row[x % row.size] == '#'
    x += 3
    encountered_tree
  end

puts rows_with_tree_collisions.size
