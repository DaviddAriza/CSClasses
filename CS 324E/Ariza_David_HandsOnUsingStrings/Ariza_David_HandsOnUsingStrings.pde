PrintWriter output;

void setup() {
  
  String[] lines = loadStrings("mytext.txt");
  
  output = createWriter("words.txt");
  
  for (String line : lines) {
    println("Length of line: " + line.length());
    
    
    String[] words = split(line, ' ');
    
    println("Number of words:" + words.length);
    
    for (String word : words) {
      output.println(word);
    }
  }
  
  output.flush();
  output.close();
  
}
