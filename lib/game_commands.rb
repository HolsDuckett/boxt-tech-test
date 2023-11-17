require_relative 'robot'

class GameCommands
    COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT]


    def game_commands_check(user_command)
    initial_valid_command = COMMANDS[0]
        if user_command.split[0] == initial_valid_command 
            execute_command(command)
            return true
        else
            return false 
        end
    end

    def execute_command(command)
        case command.split[0]
        when 'MOVE'
        robot.move
        when 'LEFT'
        robot.left
        when 'RIGHT'
        robot.right
        when 'REPORT'
        robot.report
        when 'PLACE'
        axis_and_direction = command[1].split(",")
        x_axis = axis_and_direction[0]
        y_axis = axis_and_direction[1]
        direction = axis_and_direction[2]
        robot.place(x_axis, y_axis, direction)
        end
    end


end
