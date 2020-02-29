# frozen_string_literal: true

require_relative 'generations'
require_relative 'cell'

# Represent a grid object
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
    loop do
      draw
      @game.next_generation
      sleep(1)
    end
  end

  def draw_top
    print "╔"
    top_columns = @columns
    (1..top_columns).each do |index|
      if top_columns == index
        print "══╗\n"
      else
        print "\xE2\x95\x90\xE2\x95\x90\xE2\x95\xA6"
      end
    end
  end

  def draw_bottom
    print "╚"
    bottom_columns = @columns
    (1..bottom_columns).each do |index|
      if bottom_columns == index
        print "══╝\n"
      else
        print "\xE2\x95\x90\xE2\x95\x90\xE2\x95\xA9"
      end
    end
  end

  def draw_middle
    print "╠"
    middle_columns = @columns
    (1..middle_columns).each do |index|
      if middle_columns == index
        print "══╣\n"
      else
        print "\xE2\x95\x90\xE2\x95\x90\xE2\x95\xAC"
      end
    end
  end

  def draw_cell(row)
    print "\xE2\x95\x91"
    row.each do |cell|
      if cell.alive?
        print '▓▓║'
      else
        print '  ║'
      end
    end
    print "\n"
  end

  def draw
    draw_top
    @game.cells.each_with_index do |row, index|
      draw_cell(row)
      if index + 1 == @rows
        draw_bottom
      else
        draw_middle
      end
    end
  end
end
