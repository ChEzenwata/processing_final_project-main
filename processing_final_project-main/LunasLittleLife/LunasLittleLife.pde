/*
Amanda
 Final Processing project
 ToDo: Add brief description of final project here
 In this game, the player has a "pet". The player
 is just supposed to feed the pet, keep it happy
 and put it to sleep when it wants.
 */

//Variables:
PImage cat;

boolean insideTitleScreen = true;
int hunger = 50;
int happiness = 50;
int energy = 50;

//controls luna's movements
float x, y;
boolean moving = false;
float speed = 5;
int catMoveFrame = 0;

String catMessage = "Welcome to Luna's Room!";
String lunaMood = "Happy";

// play button properties
float btnX = 225;
float btnY = 360;
float btnW = 150;
float btnH = 50;

void setup() {
  size(600, 450);
  textAlign(CENTER, CENTER);

  cat = loadImage("cute-cat.png");
  
  //sets the cat's starting position
  x = cat.width/2 - cat.width/2;
  y = cat.height/2 - cat.height/2;
}

void draw() {
  background(255, 230, 240);

  // Star decorations
  textSize(30);
  fill(255, 180, 80);
  text("*", 70, 70);
  text("*", 500, 80);
  text("*", 100, 140);
  text("*", 520, 190);
  text("*", 75, 240);
  text("*", 510, 280);
  text("*", 140, 330);
  text("*", 460, 340);
  text("*", 170, 90);
  text("*", 430, 100);
  text("*", 90, 380);
  text("*", 500, 390);

  // Pink stars
  fill(255, 100, 170);
  textSize(27);
  text("*", 150, 160);
  text("*", 450, 160);
  text("*", 160, 280);
  text("*", 440, 300);

  // Purple stars
  fill(170, 100, 220);
  textSize(30);
  text("*", 110, 200);
  text("*", 490, 230);


  if (insideTitleScreen == true) {
    // Title screen
    fill(120, 60, 100);
    textSize(36);
    text("Luna's Little Life", 300, 65);

    textSize(18);
    fill(80, 60, 80);
    text("A little love, a little magic!", 300, 105);

    // Cat picture
    image(cat, 200, 125, 200, 200);

    // Start button
    fill(150, 100, 200);
    //    x    y    w    h   rounded corner
    rect(225, 350, 150, 55, 15);

    fill(255);
    stroke(120, 80, 160);
    strokeWeight(3);
    textSize(22);
    text("START", 300, 378);
  } 
  else {
    //main game screen
    background(255, 230, 240);
    fill (120, 60, 100);
    textSize(30);
    text("Luna's Room", 300, 50);
    textSize(18);
    
    image(cat, 200 + x, 120, 200, 200);
    
    //speech bubble
    fill(252, 193, 211);
    stroke(255, 145, 164);
    strokeWeight(2);
    //    x    y    w    h   rc
    rect(390, 120, 190, 45, 12);
    
    //small triangle under the bubble
    //        x1   y1   x2   y2   x3   y3
    triangle(430, 165, 450, 165, 420, 180);
    
    //message inside the bubble
    fill(100, 60, 100);
    textSize(14);
    text(catMessage, 485, 143);
    
    noStroke();
    
    //checking luna's mood
    if (energy < 25){
      lunaMood = "Sleepy";
    }
    
    else if (hunger < 25){
      lunaMood = "Hungry";
    }
    
    else {
      lunaMood = "Happy";
    }
    
    if (lunaMood.equals("Sleepy")){
      catMessage = "I need a little nap...";
    }
    
    else if (lunaMood.equals("Hungry")){
      catMessage = "Can I have some food??";
    }
    
   

    // Luna's stats
    fill(150, 100, 200);
    textSize(16);
    text("Hunger: " + hunger, 90, 90);
    text("Happiness: " + happiness, 230, 90);
    text("Energy: " + energy, 370, 90);
    text("Mood: " + lunaMood, 500, 90);

    //feed button
    fill(250, 159, 237);
    stroke(225, 143, 213);
    strokeWeight(3);
    rect(35, 360, 150, 50, 12);

    fill(255);
    textSize(18);
    text("FEED", 110, 385);

    //play button
    fill(230, 175, 222);
    stroke(207, 158, 200);
    strokeWeight(3);
    rect(225, 360, 150, 50, 12);

    fill(255);
    text("PLAY", btnX + btnW/2, btnY + btnH/2);
    
    //moves the cat while moving is true
    if (moving) {
      catMoveFrame++;
      
      //controls how often the cat changes position, if i make the number higher it moves less often and vice versa
      catMoveFrame %= 10;
      if (catMoveFrame == 0) {
        x += speed;
        if (x >= 0 || x <= width - cat.width) {
          speed *= -1;
        }
      }
    }

    //sleep button
    fill(217, 128, 204);
    stroke(195, 115, 184);
    strokeWeight(3);
    rect(415, 360, 150, 50, 12);

    fill(255);
    text("SLEEP", 490, 385);
  }
}

void mousePressed() {
  if (insideTitleScreen == true) {
    // the first mouseX is my x value, the second is the x value plus width. the first mouseY is my y value and the second is y plus height.
    if (mouseX > 225 && mouseX < 375 &&
      mouseY > 350 && mouseY < 405) {
      insideTitleScreen = false;
    }
  } 
  else {
    //feed button click control
    if (mouseX > 35 && mouseX < 185 && mouseY > 360 && mouseY < 410) {
      
      //makes the cat message say thank you
      catMessage = "Yummy! Thank you!";
      
      //reduces the hunger when the feed button is clicked
      hunger = hunger - 5;

     //keeps hunger from going below zero
      if (hunger < 0) {
        hunger = 0;
      }
      
      if (hunger > 100){
        hunger = 100;
      }
    }
    //play button click control
    else if (mouseX > 225 && mouseX < 375 && mouseY > 360 && mouseY < 410) {
      
      //makes the cat message say let's play
      catMessage = "Yay! Let's play";
      
      //increases happiness and reducing energy when she is playing
      happiness = happiness + 5;
      energy = energy - 5;
      
      if (happiness < 0){
        happiness = 0;
      }

      //happiness can't go past 100
      if (happiness > 100) {
        happiness = 100;
      }
      
     
      //energy can't go below zero
      if (energy < 0) {
        energy = 0;
      }
      
      
      //switches movement on or off when PLAY is clicked
      moving = !moving;
      
      println(moving);
    }
    
    
    //sleep button click control
    else if (mouseX > 415 && mouseX < 565 && mouseY > 360 && mouseY < 410) {
      
      //makes the cat message say, i'm getting sleepy
      catMessage = "Zzzzzzzz";
      
      //increases energy whe sleep is clicked
      energy = energy + 5;
    }
    //energy can't go above 100
    if (energy > 100) {
        energy = 100;
      }
  }
}