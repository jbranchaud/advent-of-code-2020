# Day 12: Rain Risk
#
#      N
#      ^
#      |
# W <- x -> E
#      |
#      v
#      S
#
#  Action N means to move north by the given value.
#  Action S means to move south by the given value.
#  Action E means to move east by the given value.
#  Action W means to move west by the given value.
#  Action L means to turn left the given number of degrees.
#  Action R means to turn right the given number of degrees.
#  Action F means to move forward by the given value in the direction the ship is currently facing.

# Assumes starting heading of 0,0,90
class Ship
  def initialize(x_pos, y_pos, heading)
    @x_pos = x_pos
    @y_pos = y_pos
    @heading = heading
  end

  def manhattan_distance
    # assuming starting at 0,0
    @x_pos.abs + @y_pos.abs
  end

  # HEADINGS = [:north, :south, :east, :west]

  def process_instruction(instruction)
    direction, value = instruction

    case direction
    when 'N'
      advance_with_heading(:north, value)
    when 'S'
      advance_with_heading(:south, value)
    when 'E'
      advance_with_heading(:east, value)
    when 'W'
      advance_with_heading(:west, value)
    when 'F'
      advance_with_heading(@heading, value)
    when 'R'
      @heading = compute_new_heading('R', value)
    when 'L'
      @heading = compute_new_heading('L', value)
    end
  end

  private

  def compute_new_heading(turn_direction, value)
    value = -value if turn_direction == 'L'

    headings_to_degrees = {
      north: 0,
      east: 90,
      south: 180,
      west: 270
    }

    current_degrees = headings_to_degrees[@heading]

    new_degrees = (current_degrees + value) % 360

    degrees_to_heading = {
      0 => :north,
      90 => :east,
      180 => :south,
      270 => :west
    }

    degrees_to_heading[new_degrees]
  end

  def advance_with_heading(heading, value)
    case heading
    when :north
      @y_pos += value
    when :south
      @y_pos -= value
    when :east
      @x_pos += value
    when :west
      @x_pos -= value
    end
  end
end

file = File.read('input.txt')
instructions =
  file
  .split(/\n/)
  .map { |line| line.match(/\A([NSEWFLR])(\d+)\z/).captures }
  .map { |heading, value| [heading, value.to_i] }

# require 'pry'; binding.pry;
ship = Ship.new(0,0,:east)

instructions.each do |instruction|
  ship.process_instruction(instruction)
end

puts ship.manhattan_distance
