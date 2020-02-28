class Cell
  @next_state
  @state
  attr_accessor :neighbors

  def initialize( state = :dead )
    @state = state
    @neighbors = []
  end

  def alive?
    return @state == :alive
  end

  def dead?
    return !alive?
  end

  def define_next_state
    count = 0
    neighbors.each do |n|
		if n.alive?
			count += 1 
		end
	end
    rules(count)
  end

  def update_next_state
    @state = @next_state
  end

  def rules(count)
	#Any living cell with more than three live neighbours dies
	#Any living cell with two or three live neighbours lives on to the next generation.
	#Any living cell with fewer than two live neighbours dies
	#Any dead cell with exactly three live neighbours becomes a live cell.
    if count == 3
      @next_state = :alive
    elsif count == 2 && @state == :alive
      @next_state = :alive
    else
      @next_state = :dead
    end
  end
end