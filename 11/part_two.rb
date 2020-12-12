require 'digest'

class Grid
  def initialize(double_array_of_seating, occupied: false)
    @seating_chart = double_array_of_seating
    @previous_state_hash = nil

    occupy_all_seats if occupied
  end

  def tick
    # iterate over each position in seating_chart
    #   check occupied neighbor count
    #   and update accordingly
    updated_seating_chart =
      @seating_chart.each_with_index.map do |row, x|
        row.each_with_index.map do |cell, y|
          number_occupied = count_occupied_neighbors(x, y)

          # Rules:
          # If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
          if cell == 'L' && number_occupied.zero?
            '#'
          # If a seat is occupied (#) and FIVE or more seats adjacent to it are also occupied, the seat becomes empty.
          elsif cell == '#' && number_occupied >= 5
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
    # ABC x-1,y-1 | x-1,y | x-1,y+1
    # HxD x,y-1   |       | x,y+1
    # GFE x+1,y-1 | x+1,y | x+1,y+1
    generalized_finder = proc do |xn, yn|
      catch(:seat_found) do
        x_pos = x
        y_pos = y

        while true
          x_pos += xn
          y_pos += yn

          # x-xn.negative? || y-yn.negative? -> 0
          throw(:seat_found, 0) if x_pos.negative? || y_pos.negative?
          #                            == nil -> 0
          found_seat = Array(@seating_chart[x_pos])[y_pos]
          throw(:seat_found, 0) if found_seat.nil?
          # @seating_chart[x-xn][y-yn] == '#' || 'L' -> 0 || 1
          throw(:seat_found, 0) if found_seat == 'L'
          throw(:seat_found, 1) if found_seat == '#'

          # @seating_chart[x-xn][y-yn] == '.' -> keep looking, increment xn, yn
          next
        end
      end
    end

    # ABC x-1,y-1 | x-1,y | x-1,y+1
    # HxD x,y-1   |       | x,y+1
    # GFE x+1,y-1 | x+1,y | x+1,y+1
    a = generalized_finder.call(-1, -1)
    b = generalized_finder.call(-1, 0)
    c = generalized_finder.call(-1, 1)
    d = generalized_finder.call(0, 1)
    e = generalized_finder.call(1, 1)
    f = generalized_finder.call(1, 0)
    g = generalized_finder.call(1, -1)
    h = generalized_finder.call(0, -1)

    [a, b, c, d, e, f, g, h].sum
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

file = File.read('input.txt')

double_array_of_seating =
  file.split(/\n/).map { |line| line.split('') }

grid = Grid.new(double_array_of_seating, occupied: true)

grid.display
until grid.chaos_stabalized?
  grid.tick
  grid.display
end
puts grid.count_occupied
