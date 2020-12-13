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

Waypoint = Struct.new(:x, :y)

# Assumes starting heading of 0,0,90
class Ship
  def initialize(x_pos, y_pos, heading)
    @x_pos = x_pos
    @y_pos = y_pos
    @heading = heading
    @waypoint = Waypoint.new(10, 1)
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
      adjust_waypoint(:north, value)
    when 'S'
      adjust_waypoint(:south, value)
    when 'E'
      adjust_waypoint(:east, value)
    when 'W'
      adjust_waypoint(:west, value)
    when 'F'
      advance_with_heading(value)
    when 'R'
      rotate_waypoint('R', value)
    when 'L'
      rotate_waypoint('L', value)
    end
  end

  private

  def adjust_waypoint(heading, value)
    case heading
    when :north
      @waypoint.y += value
    when :south
      @waypoint.y -= value
    when :east
      @waypoint.x += value
    when :west
      @waypoint.x -= value
    end
  end

  def rotate_waypoint(turn_direction, value)
    # Waypoint(10,4)
    # R90
    # Waypoint(4,-10)
    #
    # Waypoint(10,4)
    # R180
    # Waypoint(-10,-4)
    #
    # Waypoint(10,4)
    # R270
    # Waypoint(-4,10)
    #
    # Waypoint(10,4)
    # R360 / R0
    # Waypoint(10,4)

    value = (360 - (value % 360) % 360) if turn_direction == 'L'

    # turn_direction -> R or L
    number_of_ninties = value / 90

    # Each 90 degree move to the right is
    # Flip x and y values and make y negative
    number_of_ninties.times do
      temp_x = @waypoint.x
      @waypoint.x = @waypoint.y
      @waypoint.y = -temp_x
    end
  end

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

  def advance_with_heading(value)
    @x_pos += @waypoint.x * value
    @y_pos += @waypoint.y * value
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
