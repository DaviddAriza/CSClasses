class Tutorial{
  PVector pos;
  int size;
  int lineSpace;

  Tutorial(int x, int y, int size) {
    pos = new PVector(x, y);
    this.size = size;
    lineSpace = size + 5;
  }

  
  void display() {
    textFont(createFont("ArtifaktElement-Bold.otf", size + 2));
    textAlign(CENTER);
    fill(234, 206, 104);
    text("Welcome to Asteroid Typer!", pos.x, pos.y - 10);
    
    textFont(createFont("ArtifaktElement-Regular.otf", size));
    fill(255);
    text("Your mission:", pos.x, pos.y + lineSpace);
    fill(169, 199, 206);
    text("Save Earth from impending doom!\n" +
    "Type the words on each asteroid to obliterate\n" +
    "them before they crash into the planet.", pos.x, pos.y + lineSpace * 2);
    fill(255);
    text("Choose Your Challenge:", pos.x, pos.y + lineSpace * 6);
    fill(169, 199, 206);
    text("Select a game mode that matches your skills.", pos.x, pos.y + lineSpace * 7);
    fill(255);
    text("Customize Your Experience:", pos.x, pos.y + lineSpace * 9);
    fill(169, 199, 206);
    text("Adjust the fall rate and the number of asteroids\n to increase the thrill.", pos.x, pos.y + lineSpace * 10);
    fill(234, 206, 104);
    textFont(createFont("ArtifaktElement-Italic.ttf", size));
    text("The fate of Earth is in your hands...\nCan you type fast enough to save it?", pos.x, pos.y + lineSpace * 13);

  }

}
