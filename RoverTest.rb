require 'test/unit'
require './Rover'

class RoverTest < Test::Unit::TestCase

  def setup
    @rover = Rover.new
  end

  def test_init
    @rover.init(3, 4, 'N')
    assert_equal 3, @rover.x
    assert_equal 4, @rover.y
    assert_equal 'N', @rover.direction
  end

  def test_status
    @rover.init(3, 4, 'N')
    assert_equal '3 4 N', @rover.status
  end

  def test_process_L
    @rover.init(3, 4, 'N')
    @rover.process1('L')
    assert_equal '3 4 W', @rover.status
    @rover.process1('L')
    assert_equal '3 4 S', @rover.status
    @rover.process1('L')
    assert_equal '3 4 E', @rover.status
    @rover.process1('L')
    assert_equal '3 4 N', @rover.status
  end

  def test_process_R
    @rover.init(1, 5, 'N')
    @rover.process1('R')
    assert_equal '1 5 E', @rover.status
    @rover.process1('R')
    assert_equal '1 5 S', @rover.status
    @rover.process1('R')
    assert_equal '1 5 W', @rover.status
    @rover.process1('R')
    assert_equal '1 5 N', @rover.status
  end

  def test_process_M
    @rover.init(3, 4, 'N')
    @rover.process1('M')
    assert_equal '3 5 N', @rover.status
  end

  def test_process_instructions
    @rover.init(2, 1, 'N')
    @rover.process('M')
    assert_equal '2 2 N', @rover.status
    @rover.process('RRM')
    assert_equal '2 1 S', @rover.status
    @rover.process('LMMM')
    assert_equal '5 1 E', @rover.status
    @rover.process('RRMMMLLMMM')
    assert_equal '5 1 E', @rover.status
    @rover.process('LMMRRM')
    assert_equal '5 2 S', @rover.status

    @rover.init(1, 2, 'N')
    @rover.process('LMLMLMLMM')
    assert_equal '1 3 N', @rover.status

    @rover.init(3, 3, 'E')
    @rover.process('MMRMMRMRRM')
    assert_equal '5 1 E', @rover.status

  end

end
