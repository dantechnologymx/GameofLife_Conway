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
    link_neighbors(rows,columns)
  end

  def next_generation
    @cells.each do |row| 
      row.each do |col|
        col.define_next_state
      end
    end
    
    @cells.each do |row|
      row.each do |col|
        col.update_next_state
      end
    end
  end

  private

  def link_neighbors(rows, columns)
    for row in 0...rows
      for col in 0...columns
        left = col - 1
        right = col + 1
        top = row - 1
        bottom = row + 1
        neighbors = @cells[row][col].neighbors
		if top >= 0 && left >= 0
			neighbors.push(@cells[top][left])
		end
		if top >= 0
			neighbors.push(@cells[top][col])
		end
		if top >= 0 && right < columns
			neighbors.push(@cells[top][right])
		end
		if left >= 0
			neighbors.push(@cells[row][left])
		end
		if right < columns
			neighbors.push(@cells[row][right])
		end
		if bottom < rows  && left >= 0
			neighbors.push(@cells[bottom][left])
		end
		if bottom < rows
			neighbors.push(@cells[bottom][col])
		end
		if bottom < rows  && right < columns
			neighbors.push(@cells[bottom][right])
		end
      end
    end

  end

end