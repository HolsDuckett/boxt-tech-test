# frozen_string_literal: true

require 'robot'

describe Robot do
  before do
    Robot.any_instance.stub(:puts)
  end

  context 'initialise' do
    it 'initialises a robot with x, y and direction' do
      robot = Robot.new(0, 0, 'WEST')
      expect(robot.x_axis).to eq(0)
      expect(robot.y_axis).to eq(0)
      expect(robot.projected_direction).to eq('WEST')
      expect(robot).to have_received(:puts).with('Wooo we have a robot!')
    end
  end

  context 'report' do
    it 'outputs a report to the console' do
      robot = Robot.new(2, 0, 'SOUTH')
      robot.report
      expect(robot.x_axis).to eq(2)
    end
  end

  context 'warning_message' do
    it 'outputs a warning message to the console' do
      robot = Robot.new(0, 0, 'WEST')
      robot.warning_message
      expect(robot).to have_received(:puts).with('Oooft that was a close one; you nearly had a tumble off the table there. Please try a different command.')
    end
  end

  context 'place' do
    it 'updates x axis, y axis and direction if robot is safe to place' do
      robot = Robot.new(0, 0, 'WEST')
      robot.place(1, 1, 'SOUTH')
      expect(robot.x_axis).to eq(1)
      expect(robot.y_axis).to eq(1)
      expect(robot.projected_direction).to eq('SOUTH')
    end
    it 'returns a warning message if the place paramenters are out of bounds' do
      robot = Robot.new(0, 0, 'WEST')
      robot.place(5, 1, 'SOUTH')
      expect(robot).to have_received(:puts).with('Oooft that was a close one; you nearly had a tumble off the table there. Please try a different command.')
      expect(robot.x_axis).to eq(0)
      expect(robot.y_axis).to eq(0)
      expect(robot.projected_direction).to eq('WEST')
    end
  end

  context 'move' do
    it 'updates x axis, y axis if robot is safe to move' do
      robot = Robot.new(1, 1, 'WEST')
      robot.move
      expect(robot.x_axis).to eq(0)
      expect(robot.y_axis).to eq(1)
      expect(robot.projected_direction).to eq('WEST')
      expect(robot).to have_received(:puts).with("We're moving and grooving!")
    end
    it 'returns a warning message if the next possible move is out of bounds' do
      robot = Robot.new(0, 0, 'WEST')
      robot.place(0, 0, 'WEST')
      robot.move
      expect(robot).to have_received(:puts).with('Oooft that was a close one; you nearly had a tumble off the table there. Please try a different command.')
      expect(robot.x_axis).to eq(0)
      expect(robot.y_axis).to eq(0)
      expect(robot.projected_direction).to eq('WEST')
    end
  end

  context 'left' do
    it 'updates projected direction from NORTH to WEST' do
      robot = Robot.new(1, 1, 'NORTH')
      robot.left
      expect(robot.projected_direction).to eq('WEST')
    end
    it 'updates projected direction from WEST to SOUTH' do
      robot = Robot.new(1, 1, 'WEST')
      robot.left
      expect(robot.projected_direction).to eq('SOUTH')
    end
    it 'updates projected direction from SOUTH to EAST' do
      robot = Robot.new(1, 1, 'SOUTH')
      robot.left
      expect(robot.projected_direction).to eq('EAST')
    end
    it 'updates projected direction from EAST to NORTH' do
      robot = Robot.new(1, 1, 'EAST')
      robot.left
      expect(robot.projected_direction).to eq('NORTH')
    end
  end

  context 'right' do
    it 'updates projected direction from NORTH to EAST' do
      robot = Robot.new(1, 1, 'NORTH')
      robot.right
      expect(robot.projected_direction).to eq('EAST')
    end
    it 'updates projected direction from EAST to SOUTH' do
      robot = Robot.new(1, 1, 'EAST')
      robot.right
      expect(robot.projected_direction).to eq('SOUTH')
    end
    it 'updates projected direction from SOUTH to WEST' do
      robot = Robot.new(1, 1, 'SOUTH')
      robot.right
      expect(robot.projected_direction).to eq('WEST')
    end
    it 'updates projected direction from WEST to NORTH' do
      robot = Robot.new(1, 1, 'WEST')
      robot.right
      expect(robot.projected_direction).to eq('NORTH')
    end
  end
end
