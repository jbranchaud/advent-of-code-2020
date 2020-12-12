input = <<~INPUT
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
INPUT

require_relative './input2.rb'

numbers = INPUT.split(/\n/).map(&:to_i)

invalid_number = 1504371145
# invalid_number = 127

result =
  catch(:answer_found) do
    numbers.each_with_index do |number, x|
      running_total = number

      catch(:next_number) do
        ((x+1)..(numbers.size - 1)).each do |y|
          running_total += numbers[y]

          throw(:next_number) if running_total > invalid_number
          if running_total == invalid_number
            range = numbers.slice(x,y-x)
            throw(:answer_found, [range.min, range.max])
          end
        end
      end
    end

    raise StandardError, "No answer found"
  end

puts result
low, high = result
puts low + high
