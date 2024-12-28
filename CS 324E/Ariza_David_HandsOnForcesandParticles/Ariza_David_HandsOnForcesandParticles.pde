class Particle {
  PVector pos;
  PVector vel;
  float r;
  
  
  Particle(float x, float y, float vx, float vy, float r) {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    this.r = r;
  }
  
  void applyForces(float fx, float fy) {
    // Apply forces (gravity) to velocity
    vel.x += fx;
    vel.y += fy;
    
    // Update position based on velocity
    pos.x += vel.x;
    pos.y += vel.y;
    
    // Check for collision with screen edges and bounce
    if (pos.x - r / 2 < 0 || pos.x + r / 2 > width) {
      vel.x *= -0.9; // Reverse horizontal velocity with some energy loss
    }
    if (pos.y - r / 2 < 0 || pos.y + r / 2 > height) {
      vel.y *= -0.9; // Reverse vertical velocity with some energy loss
    }
    
    // Keep particle within screen bounds
    pos.x = constrain(pos.x, r / 2, width - r / 2);
    pos.y = constrain(pos.y, r / 2, height - r / 2);
  }
  
  void display() {
    fill(100, 150, 255);
    noStroke();
    ellipse(pos.x, pos.y, r, r);
  }
}

Particle[] particles = new Particle[10];

void setup() {
  size(500, 500); // Set window size
  
  // Initialize particles with random positions and velocities
  for (int i = 0; i < particles.length; i++) {
    float x = random(0, width);
    float y = random(0, height / 2);
    float vx = random(-2, 2); // Random horizontal velocity
    float vy = random(-2, 2); // Random vertical velocity
    float r = random(20, 50); // Random radius
    particles[i] = new Particle(x, y, vx, vy, r);
  }
}

void draw() {
  background(210); // Light gray background
  
  // Update and display each particle
  for (int i = 0; i < particles.length; i++) {
    particles[i].applyForces(0.0, 0.1); // Gravity force (downward)
    particles[i].display();
  }
}
  
