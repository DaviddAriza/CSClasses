String[] lines;    // Array to store lines from the file
int[] frequencies; // Array to store frequencies
int[] words;       // Array to store the number of words with that frequency
int totalWords = 0;   // Total number of words
float[] angles;    // Array to store the angles for the pie chart

void setup() {
  size(800, 600);
  surface.setResizable(true);  // Makes the window resizable
  lines = loadStrings("wordfrequency.txt");  // Load the file
  frequencies = new int[lines.length];
  words = new int[lines.length];
  
  // Parse the file content and fill the arrays
  for (int i = 0; i < lines.length; i++) {
    String[] parts = split(lines[i], ":");
    frequencies[i] = int(trim(parts[0]));   // Frequency of the word
    words[i] = int(trim(parts[1]));         // Number of words with that frequency
    totalWords += words[i];                 // Accumulate the total number of words
  }
  
  // Calculate the angles for each frequency in the pie chart
  angles = new float[frequencies.length];
  for (int i = 0; i < frequencies.length; i++) {
    angles[i] = TWO_PI * words[i] / totalWords;  // Calculate the proportion of each segment
  }
  

}

void draw() {
  background(255);
  
  float lastAngle = 0;
  float centerX = width / 2;
  float centerY = height / 2;
  float diameter = min(width, height) * 0.75;  // Adjust the pie chart size dynamically
  
  // Define some colors for the pie slices
  color[] colors = {
    color(255, 100, 100), color(100, 255, 100), color(100, 100, 255), 
    color(255, 255, 100), color(100, 255, 255), color(255, 100, 255)
  };
  
  // Draw the pie chart
  for (int i = 0; i < frequencies.length; i++) {
    fill(colors[i % colors.length]);  // Cycle through colors
    arc(centerX, centerY, diameter, diameter, lastAngle, lastAngle + angles[i]);
    lastAngle += angles[i];
  }
  
  // Draw the legend
  float legendX = 50;
  float legendY = 50;
  float maxLegendHeight = height - 50;  // Ensure the legend fits within the window
  int itemsPerColumn = int(maxLegendHeight / 20);  // How many items can fit in one column
  int columnWidth = 200;  // Space between columns
  
  fill(0);
  textSize(12);
  textAlign(LEFT);
  
  for (int i = 0; i < frequencies.length; i++) {
    int currentColumn = i / itemsPerColumn;  // Determine which column the item belongs to
    int currentRow = i % itemsPerColumn;     // Determine the row within the column
    float currentLegendX = legendX + currentColumn * columnWidth;
    float currentLegendY = legendY + currentRow * 20;
    
    fill(colors[i % colors.length]);
    rect(currentLegendX, currentLegendY, 10, 10);  // Color box for each frequency
    fill(0);
    text(frequencies[i] + " frequency, " + words[i] + " words", currentLegendX + 20, currentLegendY + 10);
  }
}
