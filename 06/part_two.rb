require_relative 'clean_input'

# input = "abc,a b c,ab ac,a a a a,b"
# # input = "abc,abc,abac,aaaa,b"

groups = INPUT.split(',')

result = groups.map do |groups_answers|
    groups_answers
      .split(' ')
      .map { |persons_answers| persons_answers.split('') }
      .reduce(&:&)
      .size
end

puts result.sum
