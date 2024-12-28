float time = 0;      // Tracks time (between 0 and 1)
float duration = 5;  // Duration for one full cycle (5 seconds)
float A = 100;       // Amplitude for oscillation and circle radius
float x0 = 200, y0 = 200;  // Center position for circle
float startPos = 50; // Start position for easing
float endPos = 350;  // End position for easing

void setup() {
  size(400, 400);
  frameRate(60);  // Run at 60 FPS
}

void draw() {
  background(255);

  // Update time
  time += 1.0 / (frameRate * duration);
  if (time > 1) time = 0; // Reset after a full cycle

  // Part 1: Oscillate back and forth
  float oscillatingX = oscillateBackAndForth(time, A, x0);
  fill(255, 0, 0);
  ellipse(oscillatingX, 100, 20, 20);

  // Part 2: Circle around a point
  PVector circularPos = circleAroundPoint(time, A, x0, y0);
  fill(0, 255, 0);
  ellipse(circularPos.x, circularPos.y, 20, 20);

  // Part 3: Ease-out interpolation
  float easeOutX = easeOut(time, startPos, endPos);
  fill(0, 0, 255);
  ellipse(easeOutX, 300, 20, 20);

  // Part 4: Ease-in interpolation
  float easeInX = easeIn(time, startPos, endPos);
  fill(255, 165, 0);
  ellipse(easeInX, 350, 20, 20);
}

// Part 1: Oscillate a ball back and forth using sin(θ)
float oscillateBackAndForth(float t, float A, float x0) {
  float theta = TWO_PI * t;  // theta varies with time
  return A * sin(theta) + x0;
}

// Part 2: Circle a ball around a point using sin(θ) and cos(θ)
PVector circleAroundPoint(float t, float A, float x0, float y0) {
  float theta = TWO_PI * t;  // theta varies with time
  float x = A * cos(theta) + x0;
  float y = A * sin(theta) + y0;
  return new PVector(x, y);
}

// Part 3: Ease-out interpolation using lerp
float easeOut(float t, float start, float end) {
  return lerp(start, end, easeOutFunc(t));
}

// Part 4: Ease-in interpolation using lerp
float easeIn(float t, float start, float end) {
  return lerp(start, end, easeInFunc(t));
}

// Easing function for ease-out (starts fast, ends slow)
float easeOutFunc(float t) {
  return 1 - pow(1 - t, 2);
}

// Easing function for ease-in (starts slow, ends fast)
float easeInFunc(float t) {
  return t * t;
}
