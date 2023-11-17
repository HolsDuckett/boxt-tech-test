require_relative 'robot'

class Table

    SOUTH_WEST_CORNER = "0,0"

    def inititalize
        @robot_location=robot.robot_location
    end

    def isRobotSafe(x_axis, y_axis)
        puts "here"
        puts x_axis >=5
        puts y_axis >=5

        x_axis || y_axis >= 5 ? false : true
    end


    def dangerZone
    end
end