# frozen_string_literal: true

# Represent a cell object
class Cell
  @next_state
  @state
  attr_accessor :neighbors

  def initialize(state = :dead)
    @state = state
    @neighbors = []
  end

  def alive?
    @state == :alive
  end

  def dead?
    !alive?
  end

  def define_next_state
    count = 0
    neighbors.each do |n|
      count += 1 if n.alive?
    end
    rules(count)
  end

  def update_next_state
    @state = @next_state
  end

  private

  def rules(count)
    # Any living cell with more than three live neighbours dies
    # Any living cell with two or three live neighbours lives on next generation
    # Any living cell with fewer than two live neighbours dies
    # Any dead cell with exactly three live neighbours becomes a live cell.
    @next_state = if count == 3
                    :alive
                  elsif count == 2 && @state == :alive
                    :alive
                  else
                    :dead
                  end
  end
end
