require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0
	puts "L'état de chaque joueur :"
	player1.show_state
	player2.show_state
puts 
	puts "Phase d'attaque :"
	player2.attacks(player1)
	if player1.life_points <=0 || player2.life_points <=0 
		break 
	player1.attacks(player2)
puts 

	end
end 

#binding.pry