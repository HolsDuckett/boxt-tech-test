require_relative 'robot'

class GameCommands

    attr_reader :robot

    COMMANDS = %w[PLACE MOVE LEFT RIGHT REPORT]

    def correct_initial_command_check(user_command)
        # //does inital check to ensure only place is called first
    initial_valid_command = COMMANDS[0]
        if user_command.split[0] == initial_valid_command 
            # // TO DO: check to ensure the correct place format is correct
            # if correct initial command then execute the command and robot to be initialized
            
            execute_command(user_command, robot = nil)
            return true
        else
            return false 
        end
    end
    


    def execute_command(command, isRobotInitialized)
        puts isRobotInitialized
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
        axis_and_direction = command.split[1].split(",")
        x_axis = axis_and_direction[0]
        y_axis = axis_and_direction[1]
        direction = axis_and_direction[2]
        isRobotInitialized ? 
        robot.place(x_axis, y_axis, "#{direction}") :
        @robot = Robot.new(x_axis, y_axis, "#{direction}")
        end
    end

end
