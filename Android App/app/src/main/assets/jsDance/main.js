var canvas,
surface,
currentScreen;

var mouse; // simple helper for capturing the mouse's state

function beginLoop() {
  var frameId = 0;
  var lastFrame = Date.now();

  function loop() {
    var thisFrame = Date.now();

    var elapsed = thisFrame - lastFrame;

    frameId = window.requestAnimationFrame(loop);

    currentScreen.update(elapsed);
    currentScreen.draw(surface);

    lastFrame = thisFrame;
  }

  loop();
}


canvas = document.querySelector('canvas#board');
canvas.setAttribute('width', 370);
canvas.setAttribute('height', 526);

surface = canvas.getContext('2d');

mouse = (function (target) {
  var isButtonDown = false;

  target.addEventListener('touchstart', function () {
    isButtonDown = true;
  });
  target.addEventListener('touchend', function () {
    isButtonDown = false;
  });
  

  return {
    isButtonDown: function () {
      return isButtonDown;
    }
  };
}(document));

// define the start screen
currentScreen = (function (input) {

  var hue = 0;
  var direction = 1;
  var transitioning = false;
  var wasButtonDown = false;
  var title = 'Dance Revolution';

  function centerText(ctx, text, y) {
    var measurement = ctx.measureText(text);
    var x = (ctx.canvas.width - measurement.width) / 2;
    ctx.fillText(text, x, y);
  }
  
    function UpRightText(ctx, text) {
    var measurement = ctx.measureText(text);
    var y = 30 ;
	var x = (ctx.canvas.width)-150;

    ctx.fillText(text, x, y);
  }
  function gup( name, url ) {
    if (!url) url = location.href;
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( url );
    return results == null ? null : results[1];
}

  function draw(ctx, elapsed) {

    var y = ctx.canvas.height / 2;
    var color = 'rgb(' + hue + ',0,0)';

    ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
    ctx.fillStyle = 'white';
    ctx.font = '36px monospace';
    centerText(ctx, title, y);

    ctx.fillStyle = color;
    ctx.font = '24px monospace';
    centerText(ctx, 'click to begin', y + 30);
	var point =  gup("score",window.href);
	if(point == null ) {
	point == 0
	}
 	UpRightText(ctx,"Score:"+point);
  }

  function update() {

    hue += 1 * direction;
    if (hue > 255) direction = -1;
    if (hue < 1) direction = 1;

    var isButtonDown = input.isButtonDown();
    var mouseJustClicked = !isButtonDown && wasButtonDown;

    if (mouseJustClicked && !transitioning) {
      transitioning = true;
      // do something here to transition to the actual game
	  window.location.href = 'jsRev.html';
      title = 'Start Playing!';
    }

    wasButtonDown = isButtonDown;
  }

  return {
    draw: draw,
    update: update
  };
}(mouse));


beginLoop();