file = File.read('differences2.csv')

differences = file.split(/\n/).map(&:to_i)

tribs = [1, 1, 2, 4, 7, 13, 24, 44, 81, 149, 274]

result = differences.join.gsub(/3+/, ',').split(',').map(&:size).map { |len| tribs[len] }.reduce(:*)

puts result
