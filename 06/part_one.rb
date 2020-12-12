require_relative 'clean_input'

# input = "abc,a b c,ab ac,a a a a,b"
# input = "abc,abc,abac,aaaa,b"

groups = INPUT.split(',')

puts groups
  .map { |answers| answers.split('').uniq.size }
  .sum
