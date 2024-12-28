PShape shp1, shp2, circle, rectangle;

void setup() {
  size(1000,1000);
  
}

void draw() {
  beginShape();
  vertex(300, 300);
  vertex(500, 400);
  vertex(700, 400);
  vertex(300, 800);
  endShape();
  
  beginShape(TRIANGLE_STRIP);
  vertex(400, 100);
  vertex(500, 200);
  vertex(600, 100);
  vertex(700, 200);
  vertex(800, 100);
  vertex(900, 200);
  endShape();
  
  beginShape();
  curveVertex(50, 50);
  curveVertex(125, 125);
  curveVertex(250, 225);
  curveVertex(300, 150);
  curveVertex(325, 50);
  endShape();
  
  shp1 = createShape();
  shp1.beginShape();
  shp1.vertex(300, 300);
  shp1.vertex(500, 400);
  shp1.vertex(700, 400);
  shp1.vertex(300, 800);
  shp1.endShape();
  
  shape(shp1, 200, 200); 
  
  circle = createShape(ELLIPSE, 50, 50, 100, 100);
  rectangle = createShape(RECT, 0, 100, 100, 50);
  
  shp2 = createShape(GROUP);
  shp2.addChild(circle);
  shp2.addChild(rectangle);
  
  shape(shp2, 0, 100);
  
}
