PFont font;

import java.util.Random;
import java.util.ArrayList;
import java.util.Arrays;
import java.lang.Math;

Random rand = new Random();

String[] words;
ArrayList<String> word_list;
String[] random_words;
color[] word_color = new color[10];
int vertical_space = 25;

void setup() {
  size(700, 600);
  background(0);
  fill(245, 147, 66);
  font = createFont("Palatino", 24);
  textFont(font);
  words = loadStrings("uniquewords.txt");
  word_list = new ArrayList(Arrays.asList(words));
  random_words = update_random_words(word_list);
  for (int i = 0; i < word_color.length; i++) {
    word_color[i] = color(255 - 20 * i, 255 - 5 * i, 200);
  }

}

void draw() {
  background(98, 107, 120);
  int x = 10;
  int y = 30;
  int k = 0;

  while (y + textAscent() < 600 && k < random_words.length) {
    /*
    if (random_words[k].length() <=8) {
      fill(255);
    } else if (random_words[k].length() <=11) {
      fill(147, 174, 184);
    } else {
      fill(90, 134, 150);
    }
    */
    fill(word_color[max(min(random_words[k].length() - 3, word_color.length - 1), 0)]);
    text(random_words[k], x, y);
    x += textWidth(random_words[k]) + 10;
    k += 1;
    if (x + 10 + textWidth(random_words[k]) >= 700) {
      x = 10;
      y += 25;
    }
  }
}

String[] update_random_words(ArrayList<String> word_list) {
  random_words = new String[word_list.size()];
  for (int i = 0; i < random_words.length; i++) {
    int rand_index = rand.nextInt(word_list.size());
    random_words[i] = word_list.get(rand_index);
    word_list.remove(rand_index);
  }
  return random_words;
}


void mousePressed() {
  words = loadStrings("uniquewords.txt");
  word_list = new ArrayList(Arrays.asList(words));
  random_words = update_random_words(word_list);
}
