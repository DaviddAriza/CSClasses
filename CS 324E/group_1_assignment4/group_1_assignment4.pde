/*
To install the sound library:
Go to Sketch > Import Library > Manage Libraries,
search for "Sound" and click install.
*/
import processing.sound.*;
SoundFile fish_tank;

PImage background_image;

Clownfish cf1;
Clownfish cf2;
Clownfish cf3;

Tealfish tf1;
Tealfish tf2;
Tealfish tf3;

Jellyfish jf1;
Jellyfish jf2;
Jellyfish jf3;

void setup() {
  fish_tank = new SoundFile(this, "fish_tank_sound.mp3");
  fish_tank.loop();
  background_image = loadImage("background.png");
  
  // Create three clownfish
  cf1 = new Clownfish(250, 250, 100, 0.5, 1);
  cf2 = new Clownfish(400, 100, 100, 0.7, -1);
  cf3 = new Clownfish(-100, 350, 100, 0.9, 1);
  
  // Create three tealfish with adjusted position for tf2
  tf1 = new Tealfish(100, 300, 50, 0.3, 1);
  tf2 = new Tealfish(200, 200, 50, 0.5, -1); // Adjusted position
  tf3 = new Tealfish(450, 200, 50, 0.4, 1);
  
  jf1 = new Jellyfish(100, 200, 50, .5, -1);
  jf2 = new Jellyfish(0, 100, 40, .2, 1);
  jf3 = new Jellyfish(450, 0, 20, .1, -1);
  
  size(500, 500);
}

void draw() {
  background(90, 166, 206);
  image(background_image, 0, 0);
  
  // Move and display each clownfish
  cf1.moveAndDisplay();
  cf2.moveAndDisplay();
  cf3.moveAndDisplay();
  
  // Move and display each tealfish
  tf1.moveAndDisplay();
  tf2.moveAndDisplay(); // tf2 is now fully visible
  tf3.moveAndDisplay();
  
  jf1.moveAndDisplay();
  jf2.moveAndDisplay();
  jf3.moveAndDisplay();
}
