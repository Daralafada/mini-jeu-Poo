require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts
puts "Quel est ton prénom ?"
print ">" 
name_user = gets 
user = HumanPlayer.new(name_user)

enemies = []
player1 = Player.new("José")
player2 = Player.new("Josiane")
enemies.push(player1, player2)

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	user.show_state
	puts "Quelle action veux-tu effectuer ?
	a- chercher une meilleure arme
	s- chercher à se soigner
	attaquer un joueur en vue
		0- Josiane a #{player2.life_points} points de vie
		1- José a #{player1.life_points} points de vie"
	print ">"
	choice = gets 

	case choice 
		when "a"
			user.search_weapon
		when "s"
			user.search_health_pack
		when "0"
			user.attacks(player2)
		when "1"
			user.attacks(player1)
	end 
end
