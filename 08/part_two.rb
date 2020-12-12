file = File.open('./input.txt')

# nop +0
# acc +1
# jmp +4
# acc +3
# jmp -3
# acc -99
# acc +1
# jmp -4
# acc +6

instructions =
  file
  .map { |line| line.strip.split }
  .map { |instruction, value| [instruction, value.to_i] }

instructions_by_position =
  (0..instructions.size - 1).zip(instructions).to_h

class InfiniteLoopError < StandardError; end

def follow_instructions(position, accumulator, visited_positions, instructions_by_position) # rubocop:disable Metrics/MethodLength
  return accumulator if position == instructions_by_position.size

  current = instructions_by_position[position]
  instruction, value = current

  raise InfiniteLoopError, 'Infinite Loop Detected' if visited_positions.include?(position)

  case instruction
  when 'acc'
    follow_instructions(position + 1, accumulator + value, visited_positions << position, instructions_by_position)
  when 'nop'
    follow_instructions(position + 1, accumulator, visited_positions << position, instructions_by_position)
  when 'jmp'
    follow_instructions(position + value, accumulator, visited_positions << position, instructions_by_position)
  else
    raise StandardError, "Instruction #{instruction} not recognized"
  end
end

answer = catch do |catch_obj|
  instructions_by_position.each do |position, instruction_tuple|
    instruction, value = instruction_tuple

    result = begin
      next if instruction == 'acc'

      if instruction == 'nop'
        temp_instruction_set = instructions_by_position.clone
        temp_instruction_set[position] = ['jmp', value]
        follow_instructions(0, 0, [], temp_instruction_set)
      elsif instruction == 'jmp'
        temp_instruction_set = instructions_by_position.clone
        temp_instruction_set[position] = ['nop', value]
        follow_instructions(0, 0, [], temp_instruction_set)
      else
        raise StandardError, "We shouldn't be here"
      end
    rescue InfiniteLoopError
      next
    end

    throw(catch_obj, result) if !!result
  end
end

puts answer

# puts follow_instructions(0, 0, [], instructions_by_position)
