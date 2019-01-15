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
var sart =0;

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
	if (arrowcounter === 0 && sart === 0 )
	{
				  sart =1;
	          alert(score);
	          console.log("Score:"+score);
			  window.location.href = 'main.html?score='+score;

	}
	   $(".score").text("Score:"+score);

}// ends render()
//


