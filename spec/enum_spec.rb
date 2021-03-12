require 'minitest_helper'

describe Rasti::Enum do

  it 'Values as strings' do
    Colors.values.must_equal ['BLUE', 'GREEN', 'RED']
  end

  it 'Values as objects' do
    Colors.values.must_equal [Colors::Blue.new, Colors::Green.new, Colors::Red.new]
  end

  it 'Include' do
    Colors.include?('GREEN').must_equal true
  end

  it 'Not include' do
    Colors.include?('WHITE').must_equal false
  end

  it 'Fetch as string' do
    Colors['RED'].must_equal 'RED'
  end

  it 'Fetch as object' do
    blue = Colors['BLUE']

    blue.red?.must_equal false
    blue.green?.must_equal false
    blue.blue?.must_equal true
  end

  it 'Fetch invalid' do
    error = proc { Colors['WHITE'] }.must_raise RuntimeError
    error.message.must_equal 'Invalid value WHITE for Colors'
  end

end