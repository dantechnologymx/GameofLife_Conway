require_relative "generations"
require_relative "cell"

class Grid

  @rows
  @columns
  @game
  
  def initialize(rows, columns, seed_percent)
    @rows = rows
    @columns = columns
    @game = Generations.new(rows, columns, seed_percent)
  end
  
  def play
    begin
      draw 
      @game.next_generation
      sleep(1)
    end while true
  end
  
  def draw_top
    print "╔"
    (1..@columns).each do |index|
		if @columns == index
			print "══╗\n"
		else
			print "══╦"
		end
	end
  end

  def draw_bottom
    print "╚"
    (1..@columns).each do |index|
		if @columns == index
			print "══╝\n"
		else
			print "══╩"
		end
    end
  end
  
  def draw_middle
    print "╠"
    (1..@columns).each do |index|
		if @columns ==index
			print "══╣\n"
		else
			print "══╬"
		end
	end
  end

  def line
    print "║"
  end

  def draw_cell(cell)
    if cell.alive?
      print '▓▓'
    else
      print '  '
    end
  end

  def end_line
    print "\n"
  end

  def draw
    draw_top
    @game.cells.each_with_index do |row, index|
      line
      row.each do |cell|
        draw_cell(cell)
		line
      end
      end_line
	  if index+1 == @rows
		draw_bottom
	  else
		draw_middle
	  end
    end
  end
end




