class Player
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

class Chess
	include Player
	attr_accessor :player1, :player2

	def initialize
		@player1 = Player.new("White")
		@player2 = Player.new("Black")
		puts "#{player1.name} is playing as #{player1.color}."
		puts "#{player2.name} is playing as #{player2.color}."
		puts "The scoreboard is ready. Please type 'help' for a list of commands."
		scoreboard
	end

	
	def readScore(player1, player2)
		puts "The score is:"
		puts "#{player1.name} is on #{player1.score} / #{player1.played} points."
		puts "#{player2.name} is on #{player2.score} / #{player2.played} points."
	end
	def scoreboard
		response = ""

		while !(response == "quit")

			response = gets.chomp.downcase

			case response

			when 'help'
				puts 'Type "player1" to record a player1 win'
				puts 'Type "player2" to record a player2 win'
				puts 'Type "draw" to record a draw'
				puts 'Type "score" to reveal a score'
				puts 'Type "quit" to reveal a score'
			when "draw"
				player1.draws+=1.0.to_f
				player2.draws+=1.0.to_f
				readScore(player1, player2)
			when "player1"
				player1.wins+=1.0
				player2.losses+=1.0
				readScore(player1, player2)
			when "player2"
				player1.losses+=1.0
				player2.wins+=1.0
				readScore(player1, player2)
			when "score"
				readScore(player1, player2)
			when "quit"
				puts "Final scores"
				readScore(player1, player2)
				puts "Thanks for playing!"
				puts "Application terminated."
			else
				puts "Invalid input, please try again:"
			end
		end
	end
end

match = Chess.new
