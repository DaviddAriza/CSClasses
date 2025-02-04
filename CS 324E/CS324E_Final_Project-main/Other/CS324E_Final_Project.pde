// Initialize the dictionary variables
Table words_1000_table;
String[] words_1000 = new String[1000];
Table words_5000_table;
String[] words_5000 = new String[5000];
Table words_10000_table;
String[] words_10000 = new String[10000];

// Initialize spinning earth animation variables
int earthFrames = 8;
int earthRows = 2;
int earthCols = 4;
PImage earthSheet;
PImage[] earth = new PImage[earthFrames];
Timer earthTimer;
int earthCurrentFrame = 7;

HP hp; // Initialize the HP class


void setup() {
  size(500, 500);
  frameRate(8);
  
  loadDictionaries(); // Load the dictionaries
  
  initializeSpinningEarth(); // Set up the earth
  earthTimer = new Timer(3000);
  
  hp = new HP(10, 10, 3); // Set up the HP class
}


void draw() {
  background(0);
  displaySpinningEarth();
  
  hp.display(); // Display the HP hearts
  
  /*
  // Update earth animation grame
  if (earthTimer.activate()) {
    earthCurrentFrame = (earthCurrentFrame + 1) % earthFrames;
    earthTimer.start();
  }
  */
}




void loadDictionaries(){
  /* Note: The length of the tables are not the same as the length of the arrays
     words_1000_table:  1000 rows
     words_5000_table:  5008 rows
     words_10000_table: 9884 rows
  */
  
  // The 1000 words dictionary
  // Source: https://gist.github.com/SivilTaram/9597125e4134cc81648027b1c6f6395f
  words_1000_table = loadTable("1000_words.csv");
  int index = 0;
  for (TableRow r : words_1000_table.rows()) {
    words_1000[index] = r.getString(0);
    index++;
    if (index >= 1000) break;
  }
  
  // The 5000 words dictionary 
  // Source: https://github.com/mahsu/IndexingExercise/blob/master/5000-words.txt
  words_5000_table = loadTable("5000_words.csv");
  index = 0;
  for (TableRow r : words_5000_table.rows()) {
    words_5000[index] = r.getString(0);
    index++;
    if (index >= 5000) break;
  }
  
  // The 10000 words dictionary
  // Source: https://github.com/first20hours/google-10000-english
  words_10000_table = loadTable("10000_words.csv");
  index = 0;
  for (TableRow r : words_10000_table.rows()) {
    words_10000[index] = r.getString(0);
    index++;
    if (index >= 10000) break;
  }
}

void initializeSpinningEarth() {
  earthSheet = loadImage("earth 4000 pixel.png");
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
