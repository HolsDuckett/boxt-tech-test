require_relative 'robot'

class Table

    def inititalize
        @robot_current_location=robot.current_location
    end

    def isRobotSafe(x_axis, y_axis)
        if x_axis >= 5 || y_axis >= 5 
            puts "1"
            false 
        elsif x_axis + 1 >= 5
            puts "2"
            false
        elsif y_axis + 1 >= 5
            puts "3"
            false
        else 
            puts "4"
             true
        end
        # // desired x axis + 1 in said direction is over 5 fail
        # // or desired y axis + 1 in said direction is over 5 fail      
    end

end