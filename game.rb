# frozen_string_literal: true

# Implementation of Conway's Game of Life
class Game
  attr_reader :state

  def initialize(size = 20)
    @state = Array.new(size) { Array.new(size) { rand(10) == 1 } }
    @size = size
  end

  def next_generation
    next_state = Array.new(@size) { Array.new(@size) }
    @state.each_with_index do |row, row_index|
      row.each_with_index do |_col, col_index|
        next_state[row_index][col_index] =
          @state[row_index][col_index] ? _stay_alive(row_index, col_index) : _become_alive(row_index, col_index)
      end
    end
    @state = next_state
  end

  private

  def _stay_alive(row_index, col_index)
    live_neighbors = _live_neighbors(row_index, col_index)
    live_neighbors > 1 && live_neighbors < 4
  end

  def _become_alive(row_index, col_index)
    live_neighbors = _live_neighbors(row_index, col_index)
    live_neighbors == 3
  end

  def _live_neighbors(row_index, col_index)
    live_neighbors = 0
    [-1, 0, 1].each do |dx|
      [-1, 0, 1].each do |dy|
        next unless _valid(row_index, col_index, dx, dy)

        live_neighbors += 1 if @state[row_index + dy][col_index + dx]
      end
    end

    live_neighbors
  end

  def _valid(row_index, col_index, ch_x, ch_y)
    return false if ch_x.zero? && ch_y.zero?
    return false if _out_of_bounds(row_index, ch_y)
    return false if _out_of_bounds(col_index, ch_x)

    true
  end

  def _out_of_bounds(index, change)
    ((index == (@size - 1)) && change == 1) || (index.zero? && change == -1)
  end
end
