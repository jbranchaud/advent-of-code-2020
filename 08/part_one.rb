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

def follow_instructions(position, accumulator, visited_positions, instructions_by_position) # rubocop:disable Metrics/MethodLength
  current = instructions_by_position[position]
  instruction, value = current

  return accumulator if visited_positions.include?(position)

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

puts follow_instructions(0, 0, [], instructions_by_position)
