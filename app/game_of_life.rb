require_relative "grid"

class GameOfLife

	def start(rows, columns, seed)
		grid = Grid.new(rows,columns,seed)
		grid.play
	end
  
	puts "\nHi! Welcome to the Game of Life\n\n"
	puts "Instructions:\n"
	puts "This game receives 3 parameters: [rows] [columns] [seed]\n"
	puts "[rows] Represents the grid height.\n"
	puts "[columns] Represents the grid width.\n"
	puts "[seed] It is the percentage of live cells to start\n\n"

	if ARGV.count == 3
		rows = ARGV[0].to_i
		columns = ARGV[1].to_i
		seed = ARGV[2].to_i
		game = GameOfLife.new
		game.start(rows,columns,seed)
	else
		puts "You do not provide parameters. Do you want to start the game by default? [Y/N]"
		answer = gets.chomp
	end

	if !(answer == "Y" || answer == "N")
		puts "Invalid answer. Do you want to start the game by default? [Y/N]"
		answer = gets.chomp
	end

	if answer == "Y"
		game = GameOfLife.new
		game.start(10,10,40)
	else
		puts "Please capture the following parameters:"
		puts "[rows] must be integer number.\n"
		rows = gets.chomp
		puts "[columns] must be integer number.\n"
		columns = gets.chomp
		puts "[seed] must be integer number in range 1 to 100 \n"
		seed = gets.chomp
		game = GameOfLife.new
		game.start(rows.to_i,columns.to_i,seed.to_i)
	end
end




