float camX = 0;
float camY = 0;
float camZ = (height/2.0) / tan(PI*30.0 / 180.0);

void setup() {
  size(800, 600, P3D);
  noStroke();
}

void draw() {
  background(200);
  
  // Setup camera (move along Z-axis)
  camera(camX, camY, camZ,  // Camera position
         width/2, height/2, 0,  // Point to look at
         0, 1, 0);  // Up direction
  
  // Draw the 3D shapes
  drawShapes();
  
  // Update camera position
  camX = sin(frameCount * 0.01) * 500;
  camY = cos(frameCount * 0.01) * 500;
}

void drawShapes() {
  pushMatrix();
  translate(width*0.3, height*0.5, 0);
  fill(150, 0, 255);
  box(100);  // A box
  popMatrix();
  
  pushMatrix();
  translate(width*0.5, height*0.5, -100);
  fill(0, 255, 150);
  sphere(70);  // A sphere
  popMatrix();
  
  pushMatrix();
  translate(width*0.7, height*0.5, 0);
  fill(255, 150, 0);
  rotateX(PI/4);
  rotateY(PI/4);
  box(50);  // A cone
  popMatrix();
}
