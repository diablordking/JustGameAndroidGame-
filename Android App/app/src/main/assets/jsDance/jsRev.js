// 'notes' to store Arrows  
var notes = [];


// ==== CLASS FOR ARROWS ==== //

// 1. Direction of arrows
// 2. jQuery img that links to direction bottom
// 3. Destroy when it arrow gets to the 
// 4. Explode when arrow gets to the bottom

// Class Arrow
function Arrow(direction) {

	// CSS spacings for the arrows //
	var xPos = null;

	switch(direction) {	

		case "left" : xPos = "60px";
		break;

		case "up" : xPos = "127px";
		break;

		case "down" : xPos = "198px";
		break;

		case "right" : xPos = "268px";
		break;

	}

	this.direction = direction;
	this.image = $("<img src='./arrows/" + direction + ".gif'/>");
	this.image.css({

		position: "absolute",
		top: "0px",
		left: xPos

	});

	$('.stage').append(this.image);

}// ends CLASS Arrow

// To enable animating the arrows
Arrow.prototype.step = function() {

	// Controls the speed of the arrows
	this.image.css("top", "+=4px");

};

// Deletes arrows when they get to bottom of page
Arrow.prototype.destroy = function() {

	// removes the image of the DOM
	this.image.remove();

	// Removes the note/arrow from memory/array
	notes.splice(0,1);

};

// Explodes arrow when hit
Arrow.prototype.explode = function() {

	this.image.remove();

};



// For random arrows
var randNum = 0;

// Frame increasing
var frame = 0;

// Determines the speed of notes
var arrowSpawnRate = 240;

// Random generator for arrows
function randomGen() {

	// Randomizes between 1 and 4
	randNum = Math.floor(Math.random() * 4) + 1;

	if (randNum === 1) {

		notes.push(new Arrow("left"));

	}
	if (randNum === 2) {

		notes.push(new Arrow("right"));

	}
	if (randNum === 3) {

		notes.push(new Arrow("up"));
		
	}
	if (randNum === 4) {

		notes.push(new Arrow("down"));

	}

}// ends randomGen()
var score = 0;
var arrowcounter = 10;

// Render function //
function render() {

	if (frame++ % arrowSpawnRate === 0 && arrowcounter > 0 ) {
		arrowcounter--;
		randomGen();

	}

	// Animate arrows showering down //
	for (var i = notes.length - 1; i >= 0; i--) {

		notes[i].step();

		// Check for cleanup
		if (notes[i].image.position().top > 615) {

			notes[i].destroy();
	
		}

	}
	if (arrowcounter === 0 || 0 > arrowcounter )
	{
	          alert(score);
	          console.log("Score:"+score);
			  window.location.href = 'main.html?score='+score;
	}

}// ends render()
//

  $(document).click(function(event) { 
   console.log(event.target.id);
   	for (var i = 0; i < notes.length; i++) {
	
			console.log(notes[i].image.position().top);

		if (event.target.currentSrc.substr(event.target.currentSrc.length - 5,1) == "t" && notes[i].direction == "left") {

			if (notes[i].image.position().top > 460 && notes[i].image.position().top < 526) {
				score+=10
				console.log("LEFT! "+notes[i].explode());

			}
			
		}
		if (event.target.currentSrc.substr(event.target.currentSrc.length - 5,1)  == "p" && notes[i].direction == "up") {

			if (notes[i].image.position().top > 460 && notes[i].image.position().top < 526) {
								score+=10

				console.log("UP! "+notes[i].explode());

			}

		}
		if (event.target.currentSrc.substr(event.target.currentSrc.length - 5,1)  == "n" && notes[i].direction == "down") {

			if (notes[i].image.position().top > 460 && notes[i].image.position().top < 526) {
								score+=10

				console.log("DOWN! "+notes[i].explode());

			}

		}
		if (event.target.currentSrc.substr(event.target.currentSrc.length - 6,2)  == "ht"	 && notes[i].direction == "right") {

			if (notes[i].image.position().top > 460 && notes[i].image.position().top < 526) {
					score+=10
				console.log("RIGHT! "+notes[i].explode());

			}

		}

	}// 
   
   
   
   
   
  });


// jQuery to animate arrows //
$(document).ready(function () {

	// shim layer with setTimeout fallback
	window.requestAnimFrame = (function() {

		return window.requestAnimationFrame ||

		window.webkitRequestAnimationFrame ||

		window.mozRequestAnimationFrame ||

		function(callback) {

			//window.setTimeout(callback, 30 / 60);

		};

	})();

	/*	place the rAF *before* the render() 
		to assure as close to 60fps with the 
		setTimeout fallback.					*/

	// Infinte loop for game play
	(function animloop() {

		requestAnimFrame(animloop);

		render();

	})();// ends (function animloop() )


});// ends $(doc).ready



