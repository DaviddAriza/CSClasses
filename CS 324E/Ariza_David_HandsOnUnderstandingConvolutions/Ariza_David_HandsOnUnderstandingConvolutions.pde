// Declare a color variable
color c;

void setup() {
  size(500, 500);
  
  // Define a color in RGB mode
  c = color(255, 100, 50);
  
  // Display the RGB color information
  println("RGB Values:");
  println("Red: " + red(c));
  println("Green: " + green(c));
  println("Blue: " + blue(c));
  
  // Switch to HSB mode
  colorMode(HSB, 360, 100, 100); // Setting HSB mode with ranges for hue, saturation, brightness
  
  // Extract HSB values from the same color
  println("\nHSB Values:");
  println("Hue: " + hue(c));
  println("Saturation: " + saturation(c));
  println("Brightness: " + brightness(c));
  
  // Display the color on screen
  noStroke();
  fill(c);
  rect(0, 0, width, height);
}

float[][] kernel = {
  {0, -1, 0},
  {-1, 5, -1},
  {0, -1, 0}
};
