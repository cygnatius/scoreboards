module Player
	attr_reader :color
	attr_accessor :name, :rating, :wins, :losses, :draws

	def initialize(color)
		@color = color
		@name = getName
		@rating = getRating
		@wins = 0.0
		@losses = 0.0
		@draws = 0.0
	end

	def getName
		puts "Enter Name: "
		gets.chomp
	end

	def getRating
		puts "Please enter the player rating: "
		rating = gets.to_i
		while !(rating > 0) do
			puts "Rating not entered, Please try again: "
			rating = gets.to_i
		end
	end

	def showRating
		puts "The rating is #{rating}"
	end

	def played
		(wins + losses + draws).to_i
	end

	def score
		(draws/2).to_f+wins
	end
end




