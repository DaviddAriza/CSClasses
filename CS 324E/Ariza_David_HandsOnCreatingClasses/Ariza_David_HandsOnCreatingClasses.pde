Spot spot1, spot2;

void setup() {
  size(400, 400);
  // Create two Spot objects with different starting positions and speeds
  spot1 = new Spot(100, 100, 2, 3, 20);
  spot2 = new Spot(300, 200, -3, 1, 30);
}

void draw() {
  background(255); // Clear the background to white
  
  // Move and display each spot
  spot1.move();
  spot1.display();
  
  spot2.move();
  spot2.display();
}
