class Clownfish {
  PVector position;
  PVector direction;
  float radius;
  float speed;
  
  PShape body;
  PShape tail;
  PShape fins;
  PShape middle_fin;
  PShape lower_fin;
  
  int rotation_level_mf;
  int rotation_direction_mf;
  int rotation_level_lf;
  int rotation_direction_lf;
  
  int facing_left;
  
  Clownfish(float x, float y, float r, float s, int l) {
    position = new PVector(x, y);
    direction = new PVector(1, 0);
    this.radius = r;
    this.speed = s;
    this.facing_left = l;
    rotation_level_mf = 0;
    rotation_direction_mf = 1;
    rotation_level_lf = 0;
    rotation_direction_lf = 1;
    
    // Load the images for each body part
    body = loadShape("Clownfish_Body.svg");
    tail = loadShape("Clownfish_Tail.svg");
    fins = loadShape("Clownfish_Fins.svg");
    middle_fin = loadShape("Clownfish_MiddleFin.svg");
    lower_fin = loadShape("Clownfish_LowerFin.svg");
  }
  
  void display() {
    // display body, fins, and tail
    pushMatrix();
    translate(position.x, position.y);
    scale(facing_left * 1, 1);
    shape(body, 0, 0);
    shape(fins, 0, 0);
    shape(tail, 0, 0);
    popMatrix();
  }
  
  void move(PVector direction) {
    direction.normalize();
    // Make the fish move faster as the fins rotate upwards
    if (rotation_direction_lf > 0){
      position.x += facing_left * speed * 1.3 * direction.x;
      position.y += facing_left * speed * 1.3 * direction.y;
    } else {
      position.x += facing_left * speed * direction.x;
      position.y += facing_left * speed * direction.y;
    }
    if (position.x > 600 | position.x < -100) {
      facing_left *= -1;
    }
  }
  
  void moveAndDisplay() {
    move(direction);
    lower_fin_display();
    display();
    middle_fin_display();
  }
  
  
  void middle_fin_display() {
    float finX = position.x;
    float finY = position.y;
    // Control the direction of rotation
    if (rotation_level_mf == 60) {
      rotation_level_mf = 0;
      rotation_direction_mf *= -1;
    }
    // Rotate the middle fin as the fish moves
    if (rotation_direction_mf == 1){ // Rotate upward
      pushMatrix();
      translate(finX + facing_left * (53 + middle_fin.getWidth()/2), finY + 43 + middle_fin.getHeight()/2);
      scale(facing_left, 1);
      rotate(radians(-50 + rotation_level_mf));
      shape(middle_fin, -middle_fin.getWidth()/2 - 5, -middle_fin.getHeight()/2 - 4);
      popMatrix();
      rotation_level_mf += 2;
    } else { // Rotate downward
      pushMatrix();
      translate(finX + facing_left * (53 + middle_fin.getWidth()/2), finY + 43 + middle_fin.getHeight()/2);
      scale(facing_left, 1);
      rotate(radians(10 - rotation_level_mf));
      shape(middle_fin, -middle_fin.getWidth()/2 - 5, -middle_fin.getHeight()/2 - 4);
      popMatrix();
      rotation_level_mf += 1;
    }
     
  }
  
  void lower_fin_display() {
    float finX = position.x;
    float finY = position.y;
    // Control the direction of rotation
    if (rotation_level_lf == 60) {
      rotation_level_lf = 0;
      rotation_direction_lf *= -1;
    }
    // Rotate the lower fin as the fish moves
    if (rotation_direction_lf == 1){ // Rotate upward
      pushMatrix();
      translate(finX + facing_left * (59 + lower_fin.getWidth()/2), finY + 50 + lower_fin.getHeight()/2);
      scale(facing_left, 1);
      rotate(radians(-30 + rotation_level_lf/2));
      shape(lower_fin, -lower_fin.getWidth()/2 - 5, - lower_fin.getHeight()/2 + 8);
      popMatrix();
      rotation_level_lf += 2;
      
    } else { // Rotate downward
      pushMatrix();
      translate(finX + facing_left * (59 + lower_fin.getWidth()/2), finY + 50 + lower_fin.getHeight()/2);
      scale(facing_left, 1);
      rotate(radians(- rotation_level_lf/2 - 5));
      shape(lower_fin, -lower_fin.getWidth()/2 - 5, - lower_fin.getHeight()/2 + 8);
      popMatrix();
      rotation_level_lf += 1;
    }
         
  }
  
}
  
  
  
  
  
