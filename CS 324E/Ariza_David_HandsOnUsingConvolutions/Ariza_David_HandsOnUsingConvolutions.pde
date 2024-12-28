PImage img;
PImage resultImg;
float[][] sharpenKernel = {{0,-1,0},{-1,5,-1},{0,-1,0}};

void setup() {
  size(1000,1000);
  
  img = loadImage("tree.jpg");
  resultImg = createImage(img.width, img.height, RGB);
  
  applyConvolution(sharpenKernel);
  
  image(img,0,0);
  
  image(resultImg, img.width, 0);
  
  
}

void applyConvolution(float[][] kernel) {
  
  for (int x = 1; x < img.width - 1; x++) {
    for (int y = 1; y < img.height - 1; y++) {
      float r = 0, g = 0, b = 0;
      
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          color c = img.get(x + i, y + j);
          float weight = kernel[i + 1][j + 1];
          
          r += red(c) * weight;
          g += green(c) * weight;
          b += blue(c) * weight;
        }
      }
      
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      
      resultImg.set(x, y, color(r, g, b));
    }
  }
}

void draw(){

}
