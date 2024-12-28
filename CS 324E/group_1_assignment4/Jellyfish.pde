class Jellyfish {
  PVector position;
  PVector direction;
  float radius;
  float speed;
  
  PShape upper_body;
  PShape lower_body;
  PShape left_tent;
  PShape mid_tent;
  PShape right_tent;
  
  int facing_left;
  
  float tentacleOffset = 0; // Offeset for animating tentacle movement
  float tentacleSpeed = 0.04; //Speed of the tentacle animation
  
  Jellyfish(float x, float y, float r, float s, int l) {
    position = new PVector(x, y);
    direction = new PVector(1, 0);
    this.radius = r;
    this.speed = s;
    this.facing_left = l;
    
    // Loads the SVG files of the Jellyfish
    upper_body = loadShape("Jellyfish_Upper_Body.svg");
    lower_body = loadShape("Jellyfish_Lower_Body.svg");
    left_tent = loadShape("Jellyfish_Left_Tentacle.svg");
    mid_tent = loadShape("Jellyfish_Middle_Tentacle.svg");
    right_tent = loadShape("Jellyfish_Right_Tentacle.svg");
    
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    scale(facing_left * 1, 1);
    
    animateTentacles();
        
    shape(upper_body, 0, 0);
    shape(lower_body, 0, 0);
    
    popMatrix();
  }
  // Animating the tentacles with sine wave movement
  void animateTentacles() {
    //Tentacle movement based on sine wave
    float tentacleMovement = sin(tentacleOffset) * 5;
    // Draw the left tentacle with sine wave movement
    shape(left_tent, 0, tentacleMovement * .9);
    // Draw the middle tentacle with smaller movement
    shape(mid_tent, 0, tentacleMovement * 0.3);
    // Draw the right tentacle with sine wave movement
    shape(right_tent, 0, tentacleMovement * .7);
    
    tentacleOffset += tentacleSpeed;
    
  }
  
  void move() {
    
    position.add(PVector.mult(direction, speed));
    
    // Basic boundary check to reverse direction when hitting window edges
    if (position.x < 0 || position.x > width) {
      direction.x *= -1;
    }
    if (position.y < 0 || position.y > height) {
      direction.y *= -1;
    }
  }
  
  void moveAndDisplay() {
    move();
    display();
  }

}
