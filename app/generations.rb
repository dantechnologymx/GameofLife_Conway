# frozen_string_literal: true

# Represent a generations object
class Generations
  attr_accessor :cells

  def initialize(rows, columns, percent_of_live_seed)
    @cells = Array.new(rows) do
      Array.new(columns) do
        if Random.rand(100) < percent_of_live_seed
          Cell.new(:alive)
        else
          Cell.new(:dead)
        end
      end
    end
    link_neighbors(rows, columns)
  end

  def next_generation
    @cells.each do |row|
      row.each(&:define_next_state)
    end

    @cells.each do |row|
      row.each(&:update_next_state)
    end
  end

  private

  def link_neighbors(rows, columns)
    (0...rows).each do |row|
      (0...columns).each do |col|
        left = col - 1
        right = col + 1
        top = row - 1
        bottom = row + 1
        neighbors = @cells[row][col].neighbors
        neighbors.push(@cells[top][left]) if top >= 0 && left >= 0
        neighbors.push(@cells[top][col]) if top >= 0
        neighbors.push(@cells[top][right]) if top >= 0 && right < columns
        neighbors.push(@cells[row][left]) if left >= 0
        neighbors.push(@cells[row][right]) if right < columns
        neighbors.push(@cells[bottom][left]) if bottom < rows && left >= 0
        neighbors.push(@cells[bottom][col]) if bottom < rows
        if bottom < rows && right < columns
          neighbors.push(@cells[bottom][right])
        end
      end
    end
  end
end
