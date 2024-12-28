float y;
float vy;
float m = 1.0;
float ry = 250;
float ks = 0.1;
float kd = 0.01;

void setup() {
  size(500, 500);
  y = 400;
  vy = 0;
}

void draw() {
  background(210);
  
  float f = -(ks * (y - ry) + kd*vy);
  float a = f/m;
  vy = vy + a;
  y += vy;
  
  rect(200, y, 100, 20);
}
