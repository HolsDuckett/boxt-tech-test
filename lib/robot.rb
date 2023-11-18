# frozen_string_literal: true

# Service to update the initialized robots location on a game table
class Robot
  CARDINAL_DIRECTIONS = { 'NORTH' => ['y', 1], 'EAST' => ['x', 1], 'SOUTH' => ['y', -1], 'WEST' => ['x', -1] }.freeze
  MAX_TABLE_POSITION_LIMIT = 4

  def initialize(x_axis, y_axis, direction)
    @projected_direction = direction
    @x_axis = x_axis
    @y_axis = y_axis
    place(x_axis, y_axis, direction)
    puts 'Wooo we have a robot!'
  end

  def report
    puts "Report: #{@x_axis},#{@y_axis},#{@projected_direction}"
  end

  def warning_message
    puts 'Oooft that was a close one; you nearly had a tumble off the table there. Please try a different command.'
  end

  def place(x_axis, y_axis, direction)
    if robot_safe_to_move?([x_axis, y_axis])
      @projected_direction = direction
      @x_axis = x_axis
      @y_axis = y_axis
    else
      warning_message
    end
  end

  def move
    next_possible_coordinates = possible_next_move
    if robot_safe_to_move?(next_possible_coordinates)
      @x_axis = next_possible_coordinates[0]
      @y_axis = next_possible_coordinates[1]
    else
      warning_message
    end
  end

  def left
    current_direction_index = CARDINAL_DIRECTIONS.keys.index(@projected_direction)
    new_direction_index = current_direction_index.zero? ? CARDINAL_DIRECTIONS.length - 1 : current_direction_index - 1
    new_direction = CARDINAL_DIRECTIONS.keys[new_direction_index]
    @projected_direction = new_direction
  end

  def right
    current_direction_index = CARDINAL_DIRECTIONS.keys.index(@projected_direction)
    new_direction_index = current_direction_index == CARDINAL_DIRECTIONS.length - 1 ? 0 : current_direction_index + 1
    new_direction = CARDINAL_DIRECTIONS.keys[new_direction_index]
    @projected_direction = new_direction
  end

  def possible_next_move
    position = [@x_axi.to_i, @y_axi.to_i]
    cardinal_directions = CARDINAL_DIRECTIONS[@projected_direction]
    cardinal_directions[0] == 'y' ? position[1] = + cardinal_directions[1] : position[0] = + cardinal_directions[1]
    position
  end

  def robot_safe_to_move?(requested_coordinates)
    valid_move_array_check = requested_coordinates.map do |position|
      position.negative? || position > MAX_TABLE_POSITION_LIMIT
    end
    valid_move_array_check.include?(true) ? false : true
  end
end
