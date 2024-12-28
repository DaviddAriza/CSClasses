class Spot {
  float x, y;     // Position of the spot
  float speedX, speedY;  // Speed of the spot in the x and y directions
  float radius;   // Size of the spot
  
  // Constructor to initialize the spot's position, speed, and size
  Spot(float x, float y, float speedX, float speedY, float radius) {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    this.radius = radius;
  }
  
  // Method to display the spot
  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
  
  // Method to move the spot by updating its position based on speed
  void move() {
    x += speedX;
    y += speedY;
    
    // Check for boundaries and reverse direction if needed
    if (x < 0 || x > width) {
      speedX *= -1;
    }
    if (y < 0 || y > height) {
      speedY *= -1;
    }
  }
}
