class Tealfish {
  PVector position;
  PVector direction;
  float radius;
  float speed;
  
  PShape body;
  PShape head;
  PShape fins;

  int facing_left;

  // Variables for fin animation
  float finAngle; // Angle for fin rotation
  float finAngleSpeed; // Speed of the fin's oscillation

  Tealfish(float x, float y, float r, float s, int l) {
    position = new PVector(x, y);
    direction = new PVector(1, 0);
    this.radius = r;
    this.speed = s;
    this.facing_left = l;

    // Load the images for each body part
    body = loadShape("Fish_Body.svg");
    head = loadShape("Fish_Head.svg");
    fins = loadShape("Fish_Fins.svg");

    // Initialize fin animation variables
    finAngle = 0; // Starting angle for fin movement
    finAngleSpeed = 0.1; // Speed of the fin's movement
  }
  
  void display() {
    // Display body, head, and fins
    pushMatrix();
    translate(position.x, position.y);
    scale(facing_left * 1, 1);
    shape(body, 0, 0);
    shape(head, 0, 0);
    
    // Draw fins with oscillation
    pushMatrix();
    translate(100, 120); // Adjust position of the fin (change as needed)
    scale(facing_left, 1); // Scale for facing direction
    rotate(sin(finAngle) * radians(15)); // Oscillate the fin
    shape(fins, -fins.getWidth() / 2, -fins.getHeight() / 2); // Center the fin shape
    popMatrix();
    
    popMatrix();
  }
  
  void move(PVector direction) {
    direction.normalize();
    // Make the fish move forward in the direction it is facing
    position.x += facing_left * speed * direction.x;
    position.y += facing_left * speed * direction.y;

    // Change direction if it hits the boundary
    if (position.x > 600 || position.x < -100) {
      facing_left *= -1;
    }

    // Update the fin angle for oscillation
    finAngle += finAngleSpeed; // Increment angle
    if (finAngle > TWO_PI) {
      finAngle = 0; // Reset angle to avoid overflow
    }
  }
  
  void moveAndDisplay() {
    move(direction);
    display();
  }
}
