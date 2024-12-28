PImage img, original;

void setup() {
  surface.setResizable(true);
  img = loadImage("school.jpg");
  surface.setSize(img.width, img.height);
  original = img.copy();
  
}

void draw() {
  image(img, 0, 0);
}

void keyPressed() {
  if (key == '1') grayscaleFilter();
  else if (key == '2') contrastFilter(180, 50);
  else if (key == '3') gaussian3x3BlurFilter();
  else if (key == '4') edgeDetectionFilter();
  else if (key == '5') gaussian5x5BlurFilter();
  else if (key == '0') resetImage();

}

void grayscaleFilter() {
  img.loadPixels();
  
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    
    float gray = (r + g + b) / 3;
    
    img.pixels[i] = color(gray, gray, gray);
  }
  img.updatePixels();
}

void contrastFilter(float threshold, float contrastValue) {
  img.loadPixels();
  
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    
    float brightness = (r + g + b) / 3;
    
    if (brightness > threshold) {
      
      r = constrain(r + contrastValue, 0, 255);
      g = constrain(g + contrastValue, 0, 255);
      b = constrain(b + contrastValue, 0, 255);
    } else {
      r = constrain(r - contrastValue, 0, 255);
      g = constrain(g - contrastValue, 0, 255);
      b = constrain(b - contrastValue, 0, 255);
    }
    img.pixels[i] = color(r, g, b);
  }
  img.updatePixels();
}
  

float[][] gaussian3x3Kernel = {
  {.0625, .125, .0625},
  {.125, .25, .125},
  {.0625, .125, .0625}
};

float[][] gaussian5x5Kernel = {
  {0.003906, 0.015625, 0.023438, 0.015625, 0.003906},
  {0.015625, 0.062500, 0.093750, 0.062500, 0.015625},
  {0.023438, 0.093750, 0.140625, 0.093750, 0.023438},
  {0.015625, 0.062500, 0.093750, 0.062500, 0.015625},
  {0.003906, 0.015625, 0.023438, 0.015625, 0.003906}
};

void applyKernelWithEdgeHandling(float[][] kernel, int kernelSize) {
  PImage result = createImage(img.width, img.height, RGB);
  float kernelSum = 0;
  
  for (int i = 0; i < kernelSize; i++) {
    for (int j = 0; j < kernelSize; j++) {
      kernelSum += kernel[i][j];
    }
  }
  
  int offset = kernelSize / 2;
  
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      float sumR = 0, sumG = 0, sumB = 0;
      
      for (int i = -offset; i <= offset; i++) {
        for (int j = -offset; j <= offset; j++) {
          int neighborX = constrain(x + i, 0, img.width - 1);
          int neighborY = constrain(y + j, 0, img.height - 1);
          
          color c = img.get(neighborX, neighborY);
          sumR += red(c) * kernel[i + offset][j + offset];
          sumG += green(c) * kernel[i + offset][j + offset];
          sumB += blue(c) * kernel[i + offset][j + offset];
        }
      }
      
      if (kernelSum!= 1.0) {
        sumR /=kernelSum;
        sumG /= kernelSum;
        sumB /= kernelSum;
      }
      
      result.set(x, y, color(constrain(sumR, 0, 255), constrain(sumG, 0, 255), constrain(sumB, 0, 255)));
    }
  }
  img = result;
}

void gaussian3x3BlurFilter() {
  applyKernelWithEdgeHandling(gaussian3x3Kernel, 3);
}

void gaussian5x5BlurFilter() {
  applyKernelWithEdgeHandling(gaussian5x5Kernel, 5);
}


float[][] sobelX = {
  {-1, 0, 1},
  {-2, 0 , 2},
  {-1, 0, 1}
};

float[][] sobelY = {
  {-1, -2, -1},
  {0, 0, 0},
  {1, 2, 1}
};

void applySobel(float[][] kernelX, float[][] kernelY) {
  PImage result = createImage(img.width, img.height, RGB);
  
  for (int x = 1; x < img.width -1; x++) {
    for (int y = 1; y < img.height - 1; y++) {
      float gxR = 0, gxG = 0, gxB = 0;
      float gyR = 0, gyG = 0, gyB = 0;
      
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          color c = img.get(x + i, y + j);
          gxR += red(c) * kernelX[i + 1][j + 1];
          gxG += green(c) * kernelX[i + 1][j + 1];
          gxB += blue(c) * kernelX[i + 1][j + 1];
          gyR += red(c) * kernelY[i + 1][j + 1];
          gyG += green(c) * kernelY[i + 1][j + 1];
          gyB += blue(c) * kernelY[i + 1][j + 1];
        }
      }
      
      float magnitudeR = sqrt(gxR * gxR + gyR * gyR);
      float magnitudeG = sqrt(gxG * gxG + gyG * gyG);
      float magnitudeB = sqrt(gxB * gxB + gyB * gyB);
      
      result.set(x, y, color(constrain(magnitudeR, 0, 255), constrain(magnitudeG, 0, 255), constrain(magnitudeB, 0, 255)));
    }
  }
  img = result;
}

void edgeDetectionFilter() {
  applySobel(sobelX, sobelY);
}

void resetImage() {
  img = original.copy();
}
