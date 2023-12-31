# frozen_string_literal: true

require_relative 'robot'

# Service to parse console commands from the user to the robot service
class GameCommands

  COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT].freeze

  def initial_user_command_check(user_response)
    initial_valid_command = COMMANDS[0]

    return false unless user_response.upcase.split[0] == initial_valid_command

    execute_command(user_response.upcase, robot = nil)
    true
  end

  def user_command_check(user_response, is_robot_initialized)
    if COMMANDS.include?(user_response.upcase.split[0])
      execute_command(user_response.upcase, is_robot_initialized)
    else
      puts 'Please use a valid command: PLACE X,Y,F, MOVE, LEFT, RIGHT, REPORT'
    end
  end

  def execute_command(command, is_robot_initialized)
    case command.split[0]
    when 'MOVE'
      @robot.move
    when 'LEFT'
      @robot.left
    when 'RIGHT'
      @robot.right
    when 'REPORT'
      @robot.report
    when 'PLACE'
      axis_and_direction = command.split[1].split(',')
      x_axis = axis_and_direction[0]
      y_axis = axis_and_direction[1]
      direction = axis_and_direction[2]
      is_robot_initialized ?
        @robot.place(x_axis.to_i, y_axis.to_i, direction.to_s) :
        @robot = Robot.new(x_axis.to_i, y_axis.to_i, direction.to_s)
    end
  end
end
