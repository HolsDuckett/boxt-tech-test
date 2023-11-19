require 'robot'
require 'game_commands'

describe 'Game play' do
  before do
    Robot.any_instance.stub(:puts)
  end

  context 'placing a robot on a table at a certain place' do
    it 'is placed in the correct location' do
      robot = Robot.new(0, 0, 'WEST')
      command = GameCommands.new
      command.correct_initial_command_check('PLACE 4,3,SOUTH')
      expect(robot).to have_received(:puts).with('Wooo we have a robot!')
    end
    it 'is placed in the correct location' do
        robot = Robot.new(0, 0, 'WEST')
        command = GameCommands.new
        command.user_command_check('REPORT', 'INITIALIZED')
        expect(robot).to have_received(:puts).with('Wooo we have a robot!')
    end
  end
end