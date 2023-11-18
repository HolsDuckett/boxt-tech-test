require_relative 'table'

class Robot
    CARDINAL_DIRECTIONS = %w[{NORTH: }, EAST, SOUTH, WEST]
    MAX_TABLE_POSITION_LIMIT = 4

    def initialize(x_axis, y_axis, direction)
        @projected_direction=direction
        @x_axis=x_axis
        @y_axis=y_axis
        place(x_axis, y_axis, direction)
        puts "Wooo we have a robot!"
    end

    def place(x_axis, y_axis, direction)
        if  isRobotSafeToMakeItsNextMove(x_axis, y_axis, direction) 
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
        new_move
        if isRobotSafeToMakeItsNextMove(@x_axis, @y_axis, @projected_direction) 
        update_robots_coordinates
        else
            warning_message
        end
    end

    def new_move
        // if youre facing north y + 1
        // if youre facing east x + 1
        // if youre facing south y - 1
        // if youre facing west x - 1


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

    def isRobotSafeToMakeItsNextMove(x_axis, y_axis, direction_facing)
        requested_position = [x_axis.to_i, y_axis.to_i]
        request_position.each { |position| position > MAX_TABLE_POSITION_LIMIT }

        # refactor
        puts x_axis > 4
        puts y_axis
        puts direction_facing
        if x_axis > 4 || y_axis > 4
            return false 
        elsif direction_facing == "NORTH" 
            y_axis == 4 ? false : true
        elsif direction_facing == "EAST" 
            x_axis == 4 ? false : true
        elsif direction_facing == "SOUTH" 
            y_axis == 0 ? false : true
        elsif direction_facing == "WEST" 
            x_axis == 0 ? false : true
        else 
            true
        end
    end


end
