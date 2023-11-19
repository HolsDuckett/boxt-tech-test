# frozen_string_literal: true

require 'game_commands'

describe GameCommands do
  let(:robot) { instance_double(Robot, move: nil, left: nil, right: nil, report: nil, place: nil) }
  let(:game_commands) { described_class.new }

  context 'initial_user_command_check' do
    it 'should return true if the user response includes correctly formatted PLACE X,Y,F command' do
      expect(game_commands.initial_user_command_check('PLACE 0,0,WEST')).to be true
    end

    it 'should return false if the user response includes any string other than the PLACE command' do
      expect(game_commands.initial_user_command_check('MOVE')).to be false
      expect(game_commands.initial_user_command_check('RIGHT')).to be false
      expect(game_commands.initial_user_command_check('LEFT')).to be false
      expect(game_commands.initial_user_command_check('REPORT')).to be false
    end
  end

  context 'user_command_check' do
    it 'should output a warning if the command is not within the COMMAND constant' do
      GameCommands.any_instance.stub(:puts)
      expect(game_commands.user_command_check('hello', 'initialized'))
      expect(game_commands).to have_received(:puts).with('Please use a valid command: PLACE X,Y,F, MOVE, LEFT, RIGHT, REPORT')
    end
  end

  context 'execute_command' do
    it 'executes MOVE command on the robot' do
      command = 'MOVE'
      allow(Robot).to receive(:new).with(0, 0, 'NORTH').and_return(robot)
      game_commands.initial_user_command_check('PLACE 0,0,NORTH')
      allow(robot).to receive(:move)
      expect(robot).to receive(:move)
      game_commands.execute_command(command, true)
    end

    it 'executes LEFT command on the robot' do
      command = 'LEFT'
      allow(Robot).to receive(:new).with(0, 0, 'NORTH').and_return(robot)
      game_commands.initial_user_command_check('PLACE 0,0,NORTH')
      allow(robot).to receive(:left)
      expect(robot).to receive(:left)
      game_commands.execute_command(command, true)
    end

    it 'executes RIGHT command on the robot' do
      command = 'RIGHT'
      allow(Robot).to receive(:new).with(0, 0, 'NORTH').and_return(robot)
      game_commands.initial_user_command_check('PLACE 0,0,NORTH')
      allow(robot).to receive(:right)
      expect(robot).to receive(:right)
      game_commands.execute_command(command, true)
    end
    it 'executes REPORT command on the robot' do
      command = 'REPORT'
      allow(Robot).to receive(:new).with(0, 0, 'NORTH').and_return(robot)
      game_commands.initial_user_command_check('PLACE 0,0,NORTH')
      allow(robot).to receive(:report)
      expect(robot).to receive(:report)
      game_commands.execute_command(command, true)
    end
    it 'executes PLACE command on the robot' do
      command = 'PLACE 1,1,EAST'
      allow(Robot).to receive(:new).with(1, 1, 'EAST').and_return(robot)
      game_commands.initial_user_command_check(command)
      allow(robot).to receive(:place)
      expect(robot).to receive(:place)
      game_commands.execute_command(command, true)
    end
    it 'executes PLACE command on a new initialised robot when robot isnt initialised' do
      command = 'PLACE 1,1,EAST'
      expect(Robot).to receive(:new).twice.with(1, 1, 'EAST').and_return(robot)
      game_commands.initial_user_command_check(command)
      game_commands.execute_command(command, nil)
    end
  end
end
