# frozen_string_literal: true

require_relative '../app/cell.rb'

RSpec.describe Cell do
  it 'new cell' do
    expect(Cell.new.dead?).to be true
  end
  it 'live cell' do
    expect(Cell.new(:alive).alive?).to be true
  end
  it 'more than three live neighbours dies' do
    @cell = Cell.new(:alive)
    4.times { @cell.neighbors.push(Cell.new(:alive)) }
    @cell.define_next_state
    @cell.update_next_state
    expect(@cell.dead?).to be true
  end
  it 'two live neighbours lives' do
    @cell = Cell.new(:alive)
    2.times { @cell.neighbors.push(Cell.new(:alive)) }
    @cell.define_next_state
    @cell.update_next_state
    expect(@cell.alive?).to be true
  end
  it 'three live neighbours lives' do
    @cell = Cell.new(:alive)
    3.times { @cell.neighbors.push(Cell.new(:alive)) }
    @cell.define_next_state
    @cell.update_next_state
    expect(@cell.alive?).to be true
  end
  it 'fewer than two live neighbours dies' do
    @cell = Cell.new(:alive)
    @cell.neighbors.push(Cell.new(:alive))
    @cell.define_next_state
    @cell.update_next_state
    expect(@cell.dead?).to be true
  end
  it 'exactly three live neighbours becomes a live cell' do
    @cell = Cell.new
    3.times { @cell.neighbors.push(Cell.new(:alive)) }
    @cell.define_next_state
    @cell.update_next_state
    expect(@cell.alive?).to be true
  end
end
