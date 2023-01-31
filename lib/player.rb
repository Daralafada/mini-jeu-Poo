require "pry"

class Player 
	attr_accessor:name, :life_points 

	def initialize (user_name)
		@name = user_name
		@life_points = 10
	end 

	def show_state
		puts "#{@name} a #{@life_points} points de vie."
	end 

	def gets_damage (damage_points)
		@life_points = @life_points - damage_points
		if @life_points <= 0
			puts "Le joueur #{@name} a été tué !"
		end 
	end

	def attacks (defenser)
		puts "Le joueur #{@name} attaque le joueur #{defenser.name}"
		damage = compute_damage 
		puts "Il lui inflige #{damage} points de dommages"
		defenser.gets_damage(damage)
	end 

	def compute_damage
		return rand(1..6)
	end

end 

class HumanPlayer < Player
	attr_accessor:weapon_level

	def initialize (user_name)
		@name = user_name
		@life_points = 100
		@weapon_level = 1
	end 

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
	end 

	def compute_damage
		rand(1..6) * @weapon_level
	end 

	def search_weapon 
		@weapon_new = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{@weapon_new}"
		if @weapon_new > @weapon_level
			puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
		elsif @weapon_new <= @weapon_level
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end 

	def search_health_pack
		@health_pack = rand(1..6)
		if @health_pack == 1
			puts "Tu n'as rien trouvé... "
		end
		if 2<= @health_pack <=5
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points = @life_points + 50
			if @life_points > 100
				@life_points = 100
			end
		end
		if @health_pack == 6
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
			@life_points = @life_points + 80
			if @life_points > 100
				@life_points = 100
			end
		end 
	end 
			
end 

#binding.pry
