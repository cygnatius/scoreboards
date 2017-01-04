function game() {

	this.score = [];
	this.score[0] = 0;
	this.score[1] = 0;

	this.serverpoint = function () {
		this.score[0]+=1;
		if (this.score[0] >= 4 && this.score[0] >= this.score[1]+2) {
			console.log("The game is over, won by server!");
			this.newgame();
		} else {
			this.readGameScore();
		}
	}

	this.receiverpoint = function () {
		this.score[1]+=1;
		if (this.score[1] >= 4 && this.score[1] >= this.score[0]+2) {
			console.log("The game is over, won by server!");
			this.newgame();
		} else {
			this.readGameScore();
		}
	}

	this.scoreconverter = function (score) {
		switch(score) {
			case 0:
				score = 0;
				break;
			case 1:
				score = 15;
				break;
			case 2:
				score = 30;
				break;
			case 3:
				score = 40;
				break;
		}
		return score;
	}

	this.readGameScore = function () {
		if (this.score[0] + this.score[1] >= 6) {
			if (this.score[0] > this.score[1]) {
				console.log("Advantage Server");
			} else if (this.score[0] < this.score[1]) {
				console.log("Advantage Receiver");
			} else {
				console.log("Deuce");
			}
		} else {
			console.log(this.scoreconverter(this.score[0]) + ' ' + this.scoreconverter(this.score[1]));
		}
	}

	this.newgame = function() {
		this.score[0] = 0;
		this.score[1] = 0;
	}
}

tgame = new game();

/*function Player() {
	this.name = prompt("Players name: ");
}

function Match() {

	function Set() {
		this.score = [0,0];

		function Game() {
			this.MIN_POINTS = 4;
			this.score = [0,0];

			function player1point() {
				this.score[0]+=1;
				this.gamescore();
				if (this.score[0] >= 4 && this.score[0] >= this.score[1]+2) {
					endgame();
				} else {
					readGameScore();
				}
			}

			function player2point() {
				this.score[1]+=1;
				this.gamescore();
				if (this.score[1] >= 4 && this.score[1] >= this.score[0]+2) {
					endgame();
				} else {
					readGameScore();
				}
			}

			function readGameScore() {

				console.log(this.score[0] + ' ' + this.score[1]);
			}
		}
		
	}

	this.player1 = new Player;
	this.player2 = new Player;
	this.sets = [0,0];
}

var match = new Match;*/