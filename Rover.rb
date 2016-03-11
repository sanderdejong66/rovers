class Rover

  attr_reader :x	# int
  attr_reader :y	# int
  attr_reader :direction	# char N E S W

  def init(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def status
    @x.to_s + ' ' + @y.to_s + ' ' + @direction
  end

  def process1(instruction) # L R M
    compass_points = 'NWSE'

    case instruction
    when 'L'
      new_pos_of_current_dir = compass_points.index(direction) + 1
      new_pos_of_current_dir = 0 if new_pos_of_current_dir == compass_points.size
      @direction = compass_points[new_pos_of_current_dir]

    when 'R'
      new_pos_of_current_dir = compass_points.index(direction) - 1
      new_pos_of_current_dir = compass_points.size - 1 if new_pos_of_current_dir < 0
      @direction = compass_points[new_pos_of_current_dir]

    when 'M'
      case direction
      when 'N'
        @y = @y + 1
      when 'W'
        @x = @x - 1
      when 'S'
        @y = @y - 1
      when 'E'
        @x = @x + 1
      end
    end
  end

  def process(instructions)
    instructions.split('').each { |i|
      process1(i)
    }
  end

end
