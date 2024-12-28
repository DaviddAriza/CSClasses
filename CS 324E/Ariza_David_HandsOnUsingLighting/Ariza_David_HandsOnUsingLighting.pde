PShape box, sphere;
PVector boxPos, spherePos;

void setup() {
  size(1000, 1000, P3D);

  box = createShape(BOX, 50);
  sphere = createShape(SPHERE, 40);

  boxPos = new PVector(450, 500, 0);
  spherePos = new PVector(550, 500, 0);

  ambientLight(50, 50, 50);
  directionalLight(255, 255, 255, -1, -1, -1);
  pointLight(255, 0, 0, 0, -100, 200);
  spotLight(0, 255, 0, -200, 200, 100, 1, -1, 0, PI/4, 2);
  
  noStroke();
}

void draw() {
  background(0);

  pushMatrix();
  translate(boxPos.x, boxPos.y, boxPos.z);
  rotateY(frameCount * 0.01);
  shape(box);
  popMatrix();

  pushMatrix();
  translate(spherePos.x, spherePos.y, spherePos.z);
  rotateX(frameCount * 0.01);
  shape(sphere);
  popMatrix();
}
