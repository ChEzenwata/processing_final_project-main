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

int day = 1;
boolean gameOver = false;

//controls luna's movements
float x, y;
boolean moving = false;
float speed = 5;
int catMoveFrame = 0;

String catMessage = "Welcome to Luna's Room!";
String lunaMood = "Happy";
String finalRating = "";

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
  } else if (gameOver == true) {
    // Ending screen
    fill(120, 60, 100);
    textSize(34);
    text("Luna's Little Life", 300, 55);

    textSize(23);
    text("Your adventure is complete!", 300, 200);

    // Caretaker rating
    textSize(22);
    fill(170, 100, 160);
    text(finalRating, 300, 250);

    // Shows a special message for an amazing caretaker
    if (finalRating.equals("You were an Amazing Caretaker!")) {
      fill(255, 150, 100);
      textSize(20);
      text("Luna is so lucky to have you!", 300, 330);
    }

    // Displays Luna's final message based on her mood
    textSize(18);

    if (lunaMood.equals("Happy")) {
      text("I had the best adventure with you!", 300, 280);
    } else if (lunaMood.equals("Hungry")) {
      text("I could have used a few more snacks!", 300, 280);
    } else if (lunaMood.equals("Sleepy")) {
      text("That was fun! Now I need a nap!", 300, 280);
    } else if (lunaMood.equals("Unhappy")) {
      text("I hope you give me more attention next time!", 300, 280);
    }

    // Days completed
    fill(120, 60, 100);
    textSize(18);
    text("Days completed: 5", 300, 310);

    // LUNA'S STATS
    fill(150, 100, 200);
    textSize(16);

    // shows Luna's current hunger value
    text("Hunger: " + hunger, 90, 90);

    // HUNGER BAR BACKGROUND
    // Draws the grey bar behind the pink bar
    fill(220, 200, 220);
    rect(35, 105, 110, 12, 6);

    // HUNGER BAR
    // The pink bar changes width depending on Luna's hunger
    fill(255, 145, 164);

    // Multiplies hunger by 1.1 so the bar can reach 110 pixels
    // when hunger reaches 100
    rect(35, 105, hunger * 1.1, 12, 6);

    // shows Luna's current happiness
    text("Happiness: " + happiness, 230, 90);

    // HAPPINESS BAR BACKGROUND
    // Draws the grey background behind the bar
    fill(220, 200, 220);
    rect(175, 105, 110, 12, 6);

    // HAPPINESS BAR
    // The purple bar changes width depending on Luna's happiness
    fill(170, 100, 220);

    // Multiplies happiness by 1.1 to make the maximum width 110 pixels
    rect(175, 105, happiness * 1.1, 12, 6);


    // showss Luna's current energy
    fill(150, 100, 200);
    text("Energy: " + energy, 370, 90);

    // ENERGY BAR BACKGROUND
    // Draws the grey background behind the bar
    fill(220, 200, 220);
    rect(315, 105, 110, 12, 6);

    // ENERGY BAR
    // The blue bar changes width depending on Luna's energy
    fill(120, 170, 230);

    // Multiplies energy by 1.1 to make the maximum width 110 pixels
    rect(315, 105, energy * 1.1, 12, 6);

    // shows Luna's current mood
    text("Mood: " + lunaMood, 500, 90);

    // PLAY AGAIN button
    fill(255, 145, 164);
    stroke(230, 131, 148);
    strokeWeight(3);
    rect(225, 360, 150, 50, 12);

    fill(255);
    textSize(18);
    text("PLAY AGAIN", 300, 385);
  } else {
    //main game screen
    background(255, 230, 240);
    fill (120, 60, 100);
    textSize(30);
    text("Luna's Room", 300, 50);
    textSize(20);
    text ("Day: " + day, 50, 50);

    // CHECKS LUNA'S CURRENT MOOD

    if (energy < 2) {
      lunaMood = "Sleepy";
    } else if (hunger > 50) {
      lunaMood = "Hungry";
    } else if (happiness < 30) {
      lunaMood = "Unhappy";
    } else {
      lunaMood = "Happy";
    }




    // CHANGES THE BACKGROUND COLOUR BASED ON LUNA'S MOOD

    if (lunaMood.equals("Happy")) {
      fill(255, 220, 240);
    } else if (lunaMood.equals("Hungry")) {
      fill(255, 235, 190);
    } else if (lunaMood.equals("Sleepy")) {
      fill(190, 180, 230);
    } else if (lunaMood.equals("Unhappy")) {
      fill(200, 210, 235);
    }

    // Draws a coloured rectangle behind Luna
    noStroke();
    rect(190 + x, 110, 220, 220, 20);


    if (!catMessage.equals("Welcome back!")) {
      if (lunaMood.equals("Sleepy")) {
        catMessage = "I need a little nap...";
      } else if (lunaMood.equals("Hungry")) {
        catMessage = "Can I have some food??";
      } else if (lunaMood.equals("Unhappy")) {
        catMessage = "I need some attention...";
      }
    }

      // Displays Luna's image
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

    //TITLE SCREEN
    if (insideTitleScreen == true) {

      if (mouseX > 225 && mouseX < 375 &&
        mouseY > 350 && mouseY < 405) {
        insideTitleScreen = false;
      }
    }

    //ENDING SCREEN
    else if (gameOver == true) {

      //PLAY AGAIN button
      if (mouseX > 225 && mouseX < 375 &&
        mouseY > 360 && mouseY < 410) {

        // Decorative stars on the ending screen
        fill(255, 180, 100);
        textSize(30);
        text("*", 80, 150);
        text("*", 520, 150);
        text("*", 120, 340);
        text("*", 480, 340);

        //resets all stats
        hunger = 50;
        happiness = 50;
        energy = 50;

        //resets the day
        day = 1;

        //starts the game again
        gameOver = false;

        //resets movement
        moving = false;
        x = 0;
        speed = 5;
        catMoveFrame = 0;

        //resets mood and message
        catMessage = "Welcome back!";
        lunaMood = "Happy";
      }
    }

    //MAIN GAME SCREEN
    else {

      //FEED BUTTON
      if (mouseX > 35 && mouseX < 185 &&
        mouseY > 360 && mouseY < 410) {

        catMessage = "Yummy! Thank you!";
        hunger = hunger - 5;

        if (hunger > 100) {
          hunger = 100;
        }
      }

      //PLAY BUTTON
      else if (mouseX > 225 && mouseX < 375 &&
        mouseY > 360 && mouseY < 410) {

        catMessage = "Yay! Let's play";

        happiness = happiness + 5;
        energy = energy - 5;
        hunger = hunger + 2;

        if (happiness > 100) {
          happiness = 100;
        }

        if (energy < 0) {
          energy = 0;
        }

        moving = !moving;
        println(moving);
      }

      //SLEEP BUTTON
      else if (mouseX > 415 && mouseX < 565 &&
        mouseY > 360 && mouseY < 410) {

        energy = energy + 20;
        happiness = happiness - 20;

        if (energy > 100) {
          energy = 100;
        }

        if (happiness < 0) {
          happiness = 0;
        }

        if (day == 5) {

          //calculates Luna's final score
          int finalScore = hunger + happiness + energy;

          //decides the user caretaking rating
          if (finalScore >= 210) {
            finalRating = "You were an Amazing Caretaker!";
          } else if (finalScore >= 120) {
            finalRating = " You were a Good Caretaker!";
          } else {
            finalRating = "Luna Needs More Love!";
          }

          catMessage = "Our adventure is complete!!!";
          gameOver = true;
        } else {
          catMessage = "Day " + day + " complete!";
          day = day + 1;
        }
      }
    }
  }