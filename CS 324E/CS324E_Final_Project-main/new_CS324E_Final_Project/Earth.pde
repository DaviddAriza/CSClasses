class Earth{
// Initialize spinning earth animation variables
int earthFrames = 8;
int earthRows = 2;
int earthCols = 4;
PImage earthSheet;
PImage[] earth;
Timer earthTimer;
int earthCurrentFrame = 7;

  Earth() {
    earth = new PImage[earthFrames];
    earthSheet = loadImage("earth 4000 pixel.png");
    earthTimer = new Timer(100);
  }
  void initializeSpinningEarth() {
    
    float w = earthSheet.width / earthCols;
    float h = earthSheet.height / earthRows;
    int index = 0;
    for (int row = 0; row < earthRows; row++) {
      for (int col = 0; col < earthCols; col++) {
        earth[index] = earthSheet.get(int(col * w), int(row * h), int(w), int(h));
        index++;
      }
    }
  }
  
  void displaySpinningEarth() {
    pushMatrix();
    float earthScale = 0.5;
    translate(width / 2 - earthSheet.width / earthCols * earthScale / 2, 400);
    scale(earthScale, earthScale);
    image(earth[earthCurrentFrame], 0, 0);
    popMatrix();
  }

}
