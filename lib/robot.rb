require_relative 'table'

class Robot
    CARDINAL_DIRECTIONS = {"NORTH" =>["y",1], "EAST" =>["x", 1], "SOUTH" =>["y", -1], "WEST" =>["x", -1]}
    MAX_TABLE_POSITION_LIMIT = 4

    def initialize(x_axis, y_axis, direction)
        @projected_direction=direction
        @x_axis=x_axis
        @y_axis=y_axis
        place(x_axis, y_axis, direction)
        puts "Wooo we have a robot!"
    end

    def report
        puts "Report: #{@x_axis},#{@y_axis},#{@projected_direction}"
    end

    def warning_message
        puts "Oooft that was a close one; you nearly had a tumble off the table there. Please try a different command."
    end

    def place(x_axis, y_axis, direction)
        if  isRobotSafeToMakeItsNextMove(x_axis, y_axis) 
            @projected_direction = direction
            @x_axis = x_axis
            @y_axis = y_axis
        else
            warning_message
        end
    end
    
    # def update_robots_coordinates
    #     if direction_facing == CARDINAL_DIRECTIONS[0] 
    #         @y_axis += 1
    #     elsif direction_facing == CARDINAL_DIRECTIONS[1]
    #         @x_axis += 1
    #     elsif direction_facing == CARDINAL_DIRECTIONS[2] 
    #         @y_axis -= 1
    #     elsif direction_facing == CARDINAL_DIRECTIONS[3]
    #         @x_axis -= 1
    #     end
    # end

    def move 
        next_possible_coordinates = possible_next_move
        if isRobotSafeToMakeItsNextMove(next_possible_coordinates) 
            @x_axis = next_possible_coordinates[0]
            @y_axis = next_possible_coordinates[1]
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

    def possible_next_move
        position = [@x_axi.to_i, @y_axi.to_i]
        cardinal_directions = CARDINAL_DIRECTIONS[@projected_direction]
        cardinal_directions[0] == "y" ? position[1] =+ cardinal_directions[1] : position[0] =+ cardinal_directions[1]
        return postion
    end

    def isRobotSafeToMakeItsNextMove(x_axis, y_axis)
        requested_position = [x_axis.to_i, y_axis.to_i]
        valid_move_array_check = requested_position.map { | position | position.negative?() || position > MAX_TABLE_POSITION_LIMIT }
        valid_move_array_check.include?(true) ? false : true
    end
end
