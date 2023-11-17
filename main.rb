require './lib/game_commands'

game_command = GameCommands.new

puts "What would you like to do?"
user_reponse = gets.chomp

until (game_command.command_check(user_reponse, robot)) do
    puts "What would you like to do? `hint hint you need to place me on the table`"
    user_reponse = gets.chomp
end

        


