require_relative 'robot'

class GameCommands
    COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT]


    def command_check(user_command, robot=nil)
    initial_valid_command = COMMANDS[0]
        if user_command.split[0] == initial_valid_command 
            # // do i need to check to ensure the correct place format is correct
            execute_command(user_command, robot)
            return true
        else
            return false 
        end
    end

    def execute_command(command, robot)
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
        robot ? 
        robot.place(x_axis, y_axis, "#{direction}") :
        @robot = Robot.new(x_axis, y_axis, "#{direction}") 
        end
    end


end
