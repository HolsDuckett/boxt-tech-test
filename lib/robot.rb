require_relative 'table'

class Robot

    attr_reader :current_location

    DIRECTIONS_IN_ORDER = ["NORTH", "EAST", "SOUTH", "WEST"]

    def initialize(x_axis, y_axis, direction)
        @current_location=[@x_axis, @y_axis, @projected_direction ]
        @projected_direction=direction
        @x_axis=x_axis
        @y_axis=y_axis
    end

    def place(x_axis, y_axis, direction)
        if Table.new.isRobotSafe(x_axis, y_axis) 
            @projected_direction = direction
            @x_axis = x_axis
            @y_axis = y_axis
        else
            warning_message
        end
        # // check table class if the new corrdinates are off the table (5,5)
        # // if they are not then update the new robot location and place the robot on the table
        # // update the current face and x and y axis vars
    end

    def move
        if Table.new.isRobotSafe(@x_axis, @y_axis) 
            puts "we need a new direction #{@x_axis}#{@_axis}"
            @x_axis = x_axis
            @y_axis = y_axis
        else
            warning_message
        end
        # // is this a killer move? (current direction and wanted move - will this kill us - xecute warning message)
        # // if okay figure out new cooridnates and place robot on new square
        # // update report vars (x axis, y axis, direction)
    end

    def left
        current_direction_index = DIRECTIONS_IN_ORDER.index(@projected_direction)
        new_direction = DIRECTIONS_IN_ORDER[current_direction_index - 1]
        @projected_direction = new_direction
        # //figure out the new projection based on current direction (anti-clockwise)
        # //update projected direction
    end

    def right
        current_direction_index = DIRECTIONS_IN_ORDER.index(@projected_direction)
        new_direction = DIRECTIONS_IN_ORDER[current_direction_index + 1]
        @projected_direction = new_direction
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