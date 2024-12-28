PImage img;

void setup() {
  size(1000, 1000);
  img = loadImage("CIBJ3418.JPG"); // Load your image
  image(img, 0, 0);
  
  PImage tintedImage = applyTint(img, 100, 0, 0, 128); // Applying a red tint with 50% transparency
  image(tintedImage, 0, 0); // Display the tinted image
}

// Custom tint method
PImage applyTint(PImage img, int r, int g, int b, int alpha) {
  PImage tintedImg = createImage(img.width, img.height, ARGB);
  img.loadPixels();
  tintedImg.loadPixels();

  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i]; // Original color
    float origR = red(c);
    float origG = green(c);
    float origB = blue(c);
    float origA = alpha(c);
    
    // Blend each channel with the tint color, considering the alpha for transparency
    float newR = (origR * (255 - alpha) + r * alpha) / 255;
    float newG = (origG * (255 - alpha) + g * alpha) / 255;
    float newB = (origB * (255 - alpha) + b * alpha) / 255;
    
    // Update the tinted image pixels
    tintedImg.pixels[i] = color(newR, newG, newB, origA);
  }
  
  tintedImg.updatePixels();
  return tintedImg;
}
