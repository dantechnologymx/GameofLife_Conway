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
    print "\xE2\x95\x94"
    (1..@columns).each do |index|
      if @columns == index
        print "══╗\n"
      else
        print "\xE2\x95\x90\xE2\x95\x90\xE2\x95\xA6"
      end
    end
  end

  def draw_bottom
    print "\xE2\x95\x9A"
    (1..@columns).each do |index|
      if @columns == index
        print "══╝\n"
      else
        print "\xE2\x95\x90\xE2\x95\x90\xE2\x95\xA9"
      end
    end
  end

  def draw_middle
    print "\xE2\x95\xA0"
    (1..@columns).each do |index|
      if @columns == index
        print "══╣\n"
      else
        print "\xE2\x95\x90\xE2\x95\x90\xE2\x95\xAC"
      end
    end
  end

  def line
    print "\xE2\x95\x91"
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
      if index + 1 == @rows
        draw_bottom
      else
        draw_middle
      end
    end
  end
end
