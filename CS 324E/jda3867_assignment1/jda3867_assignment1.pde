color brown_1 = color(125,75,0);
color brown_2 = color(100,75,0);
color green_1 = color(0,175,0);
color green_2 = color(0,140,0);
color green_3 = color(0,120,0);


void setup() {
  size(500,500);
  background(0,150,255);
  
}

void draw( ) {
  //Legs of Turtle
  stroke(green_3);
  fill(green_3);
  strokeWeight(1);
  quad(290, 300, 265, 300, 315, 340, 330, 325);
  stroke(green_2);
  fill(green_2);
  quad(300, 300, 275, 300, 325, 340, 340, 325);
  stroke(green_3);
  fill(green_3);
  bezier(200, 300, 175, 300, 175, 375, 200, 375);
  stroke(green_2);
  fill(green_2);
  bezier(210, 300, 185, 300, 185, 375, 210, 375);
  
  
  //Body of Turtle
  stroke(green_1);
  strokeWeight(0);
  fill(green_1);
  ellipseMode(CENTER);
  ellipse(100, 250, 75, 50);
  ellipse(140, 260, 75, 40);
  ellipse(240, 275, 200, 100);
  ellipse(310, 280, 125, 20);
  
  //Face of Turtle
  stroke(0);
  fill(0);
  arc(85, 245, 5, 5, 0, 6.28);
  fill(green_1);
  stroke(0);
  strokeWeight(2);
  bezier(66, 260, 70, 265, 75, 275, 100, 258);

  //Shell of Turtle
  stroke(brown_2);
  strokeWeight(4);
  fill(brown_1);
  ellipse(250, 250, 210, 125);
  
}
