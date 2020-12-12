require 'digest'

file = File.read('input.txt')

double_array_of_seating =
  file.split(/\n/).map { |line| line.split('') }

class Grid
  def initialize(double_array_of_seating)
    @seating_chart = double_array_of_seating
    @previous_state_hash = nil
  end

  def tick
    # iterate over each position in seating_chart
    #   check occupied neighbor count
    #   ...
    updated_seating_chart =
      @seating_chart.each_with_index.map do |row, x|
        row.each_with_index.map do |cell, y|
          number_occupied = count_occupied_neighbors(x, y)

          # Rules:
          # If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
          if cell == 'L' && number_occupied.zero?
            '#'
          # If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
          elsif cell == '#' && number_occupied >= 4
            'L'
          # Otherwise, the seat's state does not change.
          else
            cell
          end
        end
      end

    @previous_state_hash = Digest::MD5.hexdigest(@seating_chart.to_s)
    @seating_chart = updated_seating_chart
  end

  def chaos_stabalized?
    Digest::MD5.hexdigest(@seating_chart.to_s) == @previous_state_hash
  end

  def count_occupied_neighbors(x, y)
    # ... x-1,y-1 | x-1,y | x-1,y+1
    # .x. x,y-1   |       | x,y+1
    # ... x+1,y-1 | x+1,y | x+1,y+1
    neighbor_positions = [
      [x-1,y-1], [x-1,y], [x-1,y+1],
      [x,y-1],            [x,y+1],
      [x+1,y-1], [x+1,y], [x+1,y+1]
    ]
    positions_to_check = neighbor_positions.filter { |x_pos, y_pos| !x_pos.negative? && !y_pos.negative? }

    positions_to_check
      .map { |x_pos, y_pos| Array(@seating_chart[x_pos])[y_pos] }
      .filter { |state| state == '#' }
      .size
  end

  def occupy_all_seats
    fully_occupied_seating_chart =
      @seating_chart.map do |row|
        row.map do |cell|
          if cell != '.'
            '#'
          else
            '.'
          end
        end
      end

    @previous_state_hash = Digest::MD5.hexdigest(@seating_chart.to_s)
    @seating_chart = fully_occupied_seating_chart
  end

  def to_s
    @seating_chart.map do |row|
      row.join('')
    end.join("\n")
  end

  def display
    puts self.to_s
  end

  def count_occupied
    @seating_chart.sum do |row|
      row.sum do |cell|
        cell == '#' ? 1 : 0
      end
    end
  end
end

grid = Grid.new(double_array_of_seating)

# require 'pry'; binding.pry;

# grid.display
# puts grid.count_occupied

grid.occupy_all_seats
grid.display
while !grid.chaos_stabalized? do
  grid.tick
  grid.display
end
puts grid.count_occupied
