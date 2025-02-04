class Timer {
  float duration;
  float timeTracker;
  float startTime;
  boolean timerState;
  
  Timer(float d) {
    this.duration = d;
    this.timeTracker = 0;
    this.startTime = 0;
    this.timerState = true;
  }
  
  void start() {
    timerState = true;
    timeTracker = millis();
    startTime = millis();
  }
  
  void stop() {
    timerState = false;
  }
  
  boolean activate() {  // Return True when time is up
    if (! timerState) {
      return false;
    }
    if ((millis() - timeTracker) >= duration) {
      timeTracker = millis();
      return true;
    }
    else {
      return false;
    }
  }
  
}
