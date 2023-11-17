require_relative 'table'

class Robot
    @table = Table.new
    CARDINAL_DIRECTIONS = %w[NORTH, EAST, SOUTH, WEST]

    def initialize(x_axis, y_axis, direction)
        @projected_direction=direction
        @x_axis=x_axis
        @y_axis=y_axis
    end

    def place(x_axis, y_axis, direction)
        if  table.isRobotSafeToMakeItsNextMove(x_axis, y_axis, direction) 
            @projected_direction = direction
            @x_axis = x_axis
            @y_axis = y_axis
        else
            warning_message
        end
    end
    
    def update_robots_coordinates
        if direction_facing == CARDINAL_DIRECTIONS[0] 
            @y_axis += 1
        elsif direction_facing == CARDINAL_DIRECTIONS[1]
            @x_axis += 1
        elsif direction_facing == CARDINAL_DIRECTIONS[2] 
            @y_axis -= 1
        elsif direction_facing == CARDINAL_DIRECTIONS[3]
            @x_axis -= 1
        end
    end

    def move
        if table.isRobotSafeToMakeItsNextMove(@x_axis, @y_axis, @projected_direction) 
        update_robots_coordinates
        else
            warning_message
        end
    end

    def left
        current_direction_index = CARDINAL_DIRECTIONS.index(@projected_direction)
        new_direction_index = current_direction_index === 0 ? CARDINAL_DIRECTIONS.length - 1 : current_direction_index - 1
        @projected_direction = new_direction
    end

    def right
        current_direction_index = CARDINAL_DIRECTIONS.index(@projected_direction)
        new_direction_index = current_direction_index === CARDINAL_DIRECTIONS.length - 1 ? 0 : current_direction_index + 1
        new_direction = CARDINAL_DIRECTIONS[new_direction_index]
        @projected_direction = new_direction
    end

    def report
        puts "Report: #{@x_axis},#{@y_axis},#{@projected_direction}"
    end

    def warning_message
        puts "Oooft that was a close one; you nearly had a tumble off the table there. Please try a different command."
    end


end
