require_relative 'table'

class Robot

    attr_reader :robot_location

    def initialize(x_axis, y_axis, direction)
        @robot_location=[x_axis, y_axis]
        @projected_direction=direction
        @x_axis=x_axis
        @y_axis=y_axis
    end

    def place(x_axis, y_axis, direction)
        # table = Table.new
        if Table.new.isRobotSafe(x_axis, y_axis) 
            @projected_direction = direction
            @x_axis = x_axis
            @y_axis = y_axis
            puts "reached"
        else
            warning_message
        end
        # // check table class if the new corrdinates are off the table (5,5)
        # // if they are not then update the new robot location and place the robot on the table
        # // update the current face and x and y axis vars
    end

    def setRobotsNewCoordinates

    end

    def move
        # // is this a killer move? (current direction and wanted move - will this kill us - xecute warning message)
        # // if okay figure out new cooridnates and place robot on new square
        # // update report vars (x axis, y axis, direction)
    end

    def left
        # //figure out the new projection based on current direction (anti-clockwise)
        # //update projected direction
    end

    def right
        # //figure out the new projection based on current direction (clockwise)
        # //update projected direction
    end

    def report
        puts "Report: #{@x_axis},#{@y_axis},#{@projected_direction}"
    end

    def warning_message
        puts "Oooft that was a close one. Chose a differnce place or move."
    end


end

Robot.new("y","x","WEST")