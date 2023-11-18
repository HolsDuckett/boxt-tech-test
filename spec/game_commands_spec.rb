# frozen_string_literal: true

require 'game_commands'

describe GameCommands do
  let(:robot) { class_double(Robot) }
  let(:robot) { instance_double(Robot, move: nil, left: nil, right: nil, report: nil, place: nil) }

  before do
    @game_command = GameCommands.new
    GameCommands.any_instance.stub(:puts)
  end


  context 'correct_initial_command_check' do
    it 'should return true if the user response includes correctly formatted PLACE X,Y,F command' do
      expect(@game_command.correct_initial_command_check('PLACE 0,0,WEST')).to be true
    end

    it 'should return false if the user response includes any string other than the PLACE command' do
      expect(@game_command.correct_initial_command_check('MOVE')).to be false
      expect(@game_command.correct_initial_command_check('RIGHT')).to be false
      expect(@game_command.correct_initial_command_check('LEFT')).to be false
      expect(@game_command.correct_initial_command_check('REPORT')).to be false
    end
  end

  context 'user_command_check' do
    it 'should output a warning if the command is not within the COMMAND constant' do
      expect(@game_command.user_command_check('hello', 'initialized'))
      expect(@game_command).to have_received(:puts).with('Please use a valid command (robots arent usually sensitive but this one is cap sensitive): PLACE X,Y,F, MOVE, LEFT, RIGHT, REPORT')
    end
  end

#   context 'execute_command' do
#     it 'executes MOVE command on the robot' do
#       allow(Robot).to receive(:new).with(0, 0, 'WEST').and_return(robot)
#       @game_command.execute_command('MOVE', 'initialized')
#       expect(robot).to respond_to(:move)
#     end
#     it 'executes LEFT command on the robot' do
#         allow(Robot).to receive(:new).with(0, 0, 'WEST').and_return(robot)
#         @game_command.execute_command('LEFT', 'initialized')
#         expect(robot).to respond_to(:left)
#       end

#       it 'executes RIGHT command on the robot' do
#         allow(Robot).to receive(:new).with(0, 0, 'WEST').and_return(robot)
#         @game_command.execute_command('RIGHT', 'initialized')
#         expect(robot).to respond_to(:right)
#       end
#       it 'executes REPORT command on the robot' do
#         allow(Robot).to receive(:new).with(0, 0, 'WEST').and_return(robot)
#         @game_command.execute_command('REPORT', 'initialized')
#         expect(robot).to respond_to(:report)
#       end
#       it 'executes PLACE command on the robot' do
#         allow(Robot).to receive(:new).with(0, 0, 'WEST').and_return(robot)
#         @game_command.execute_command('PLACE 1,1,WEST', 'initialized')
#         expect(robot).to respond_to(:place)
#       end
#       it 'executes PLACE command on a new initialised robot when robot isnt initialised' do
#         allow(Robot).to receive(:new).with(0, 0, 'WEST').and_return(robot)
#         @game_command.execute_command('PLACE 1,1,WEST', nil)
#         expect(robot).to respond_to(:place)
#       end
#   end

end
