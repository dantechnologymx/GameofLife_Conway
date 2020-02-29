# frozen_string_literal: true

require_relative '../app/cell.rb'

RSpec.describe Cell do
  it 'new cell' do
    expect(Cell.new.dead?).to be true
  end
  it 'live cell' do
    expect(Cell.new(:alive).alive?).to be true
  end
end
RSpec.describe 'cell_rules_for_alive_cell' do
  before do
    @cell = Cell.new(:alive)
  end
  it 'more than three live neighbours dies' do
    @cell = link_neighbors(4)
    expect(@cell.dead?).to be true
  end
  it 'two or three live neighbours lives' do
    @cell = link_neighbors(2)
    expect(@cell.alive?).to be true
  end
  it 'fewer than two live neighbours dies' do
    @cell = link_neighbors(1)
    expect(@cell.dead?).to be true
  end
  def link_neighbors(number)
    number.times { @cell.neighbors.push(Cell.new(:alive)) }
    @cell.define_next_state
    @cell.update_next_state
    @cell
  end
end
RSpec.describe 'cell_rules_for_dead_cell' do
  it 'exactly three live neighbours becomes a live cell' do
    @cell = Cell.new
    3.times { @cell.neighbors.push(Cell.new(:alive)) }
    @cell.define_next_state
    @cell.update_next_state
    expect(@cell.alive?).to be true
  end
end
