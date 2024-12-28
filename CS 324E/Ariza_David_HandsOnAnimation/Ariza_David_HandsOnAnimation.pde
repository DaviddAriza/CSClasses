PImage[] spriteImages;  // Array to store the sprite images
int totalFrames = 6;   // Total number of frames in the sequence
int currentFrame = 0;   // Keeps track of the current frame
int x = 50, y = 75;   // Position to display the sprite

void setup() {
  size(400, 400);  // Create a canvas of size 400x400
  
  // Initialize the array to hold all the images
  spriteImages = new PImage[totalFrames];

  // Load the images using a for-loop with nf() for filename padding
  for (int i = 0; i < totalFrames; i++) {
    String filename = "images/sprite_" + nf(i, 3) + ".png";  // E.g., sprite_000.png
    spriteImages[i] = loadImage(filename);  // Load the image into the array
  }
  
  frameRate(12);  // Set the frame rate for the animation
}

void draw() {
  background(32);  // Clear the background
  
  // Calculate the current frame using the modulo operator to loop the animation
  currentFrame = frameCount % totalFrames;

  // Display the current frame at position (x, y)
  image(spriteImages[currentFrame], x, y);
}
