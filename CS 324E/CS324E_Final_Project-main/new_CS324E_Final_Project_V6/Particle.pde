class Particle {
  PVector pos, vel;
  float lifespan;
  int colorp;
  float size;

  Particle(PVector pos, PVector vel, float lifespan, int colorp, float size) {
    this.pos = pos.copy().add(new PVector(0, 0)); 
    this.vel = vel.copy();
    this.lifespan = lifespan;
    this.colorp = colorp;
    this.size=size;
  }

  void update() {
    pos.add(vel);
    lifespan -= 2; 
  }

  void display() {
    noStroke();
    fill(colorp, lifespan);
    //size
    ellipse(pos.x, pos.y, size, size); 
  }

  boolean isDead() {
    return lifespan <= 0;
  }
}
