class WPM {
  Timer WPMTimer;
  int wordsTyped;
  float elapsedTime;
  int currentWPM;
  
  
  WPM(float updateInterval) {
    wordsTyped = 0;
    elapsedTime = 0;
    currentWPM = 0;
    WPMTimer = new Timer(updateInterval);
    WPMTimer.start();
  }
  
  
  void reset() {
    wordsTyped = 0;
    currentWPM = 0;
    elapsedTime = 0;
    WPMTimer.start();
  }
  
  void incrementWords() {
    wordsTyped++;
  }
  
  void updateWPM() {
    if (WPMTimer.activate()) {
      elapsedTime = (millis() - WPMTimer.startTime) / 1000.0;
      if (elapsedTime > 0) {
        currentWPM = int((wordsTyped * 60) / elapsedTime);
      }
    }
  }
  
  int getWPM() {
    return currentWPM;
  }
}
