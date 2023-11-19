require './lib/game_commands'
require './lib/robot'

game_command = GameCommands.new

puts 'What would you like to do?'
user_response = gets.chomp

until game_command.correct_initial_command_check(user_response)
  puts 'What would you like to do? `hint hint you need to place me on the table`'
  user_response = gets.chomp
end

loop do
  puts 'Where shall we explore next on this table?'
  user_response = gets.chomp
  game_command.user_command_check(user_response, true)
end
