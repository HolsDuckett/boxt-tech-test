require_relative 'robot'

class Table
  def isRobotSafeToMakeItsNextMove(x_axis, y_axis, direction_facing)
    # refactor
    if x_axis >= 5 || y_axis >= 5
      false
    elsif direction_facing == 'NORTH'
      !(y_axis == 4)
    elsif direction_facing == 'EAST'
      x_axis = 4 ? false : true
    elsif direction_facing == 'SOUTH'
      y_axis = 0 ? false : true
    elsif direction_facing == 'WEST'
      x_axis = 0 ? false : true
    else
      true
    end
  end
end
