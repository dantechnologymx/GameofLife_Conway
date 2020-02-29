# frozen_string_literal: true

require_relative '../app/generations.rb'
require_relative '../app/cell.rb'

RSpec.describe Generations do
  before do
    @columns = 0
    @rows = 0
    @living = 0
    @generation = Generations.new(10, 10, 50)
    @generation.cells.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        @columns = column_index
        @living += 1 if cell.alive?
      end
      @rows = row_index
    end
  end
  it 'new generation' do
    expect(@columns).to eq(9)
    expect(@rows).to eq(9)
  end
  it 'seed percentage' do
    expect(@living).to be_between(45, 55).inclusive
  end
end
