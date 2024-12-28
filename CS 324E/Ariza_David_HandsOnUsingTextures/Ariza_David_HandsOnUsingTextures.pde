float camX = 0;
float camY = 0;
float camZ = (height / 2.0) / tan(PI * 30.0 / 180.0);

void setup() {
  size(800, 600, P3D);
  noStroke();
  lights();  

  // Add more lighting for a plastic-like effect
  ambientLight(50, 50, 50);  // General ambient light
  pointLight(255, 255, 255, width * 0.25, height * 0.25, 100);  // Strong point light
  directionalLight(200, 200, 200, -1, 0, 0);  // Directional light from left
}

void draw() {
  background(0);

  // Setup camera (move along Z-axis)
  camera(camX, camY, camZ,  // Camera position
         width / 2, height / 2, 0,  // Point to look at
         0, 1, 0);  // Up direction

  // Draw the 3D shapes
  drawShapes();

  // Update camera position to create animation
  camX = sin(frameCount * 0.01) * 500;
  camY = cos(frameCount * 0.01) * 500;
}

void drawShapes() {
  pushMatrix();
  translate(width * 0.3, height * 0.5, 0);
  applyPlasticMaterial(150, 0, 255);  // Plastic-like purple
  box(100);  // A box
  popMatrix();

  pushMatrix();
  translate(width * 0.5, height * 0.5, -100);
  applyPlasticMaterial(0, 255, 150);  // Plastic-like green
  sphere(70);  // A sphere
  popMatrix();

  pushMatrix();
  translate(width * 0.7, height * 0.5, 0);
  applyPlasticMaterial(255, 150, 0);  // Plastic-like orange
  rotateX(PI / 4);
  rotateY(PI / 4);
  box(50);  // A rotated box (used as a cone substitute)
  popMatrix();
}

// Function to apply plastic-like material properties
void applyPlasticMaterial(int r, int g, int b) {
  ambient(r * 0.5, g * 0.5, b * 0.5);  // Dull ambient reflection
  specular(255);  // Strong specular reflection (white highlights)
  shininess(50);  // Make the material shiny
  fill(r, g, b);  // Object's main color
}
