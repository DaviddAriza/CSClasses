class Spot {
  float x, y;
  color col;
  
  Spot(float x, float y, color col) {
    this.x = x;
    this.y = y;
    this.col = col;
  }
  
  void display() {
    fill(col);
    ellipse(x, y, 20, 20);
  }
  
  void move(float dx, float dy) {
    x += dx;
    y += dy;
  }
}

class TwoSpots extends Spot {
  color col2;
  
  TwoSpots(float x, float y, color col1, color col2) {
    super(x, y, col1);
    this.col2 = col2;
  }
  
  void display() {
    super.display();
    fill(col2);
    ellipse(x -30, y, 20, 20);
  }
}

TwoSpots twoSpots;

void setup() {
  size(400, 400);
  twoSpots = new TwoSpots(200, 200, color(0, 0, 255), color(255, 0, 0));
}

void draw() {
  background(255);
  twoSpots.display();
  twoSpots.move(2,0);
}
