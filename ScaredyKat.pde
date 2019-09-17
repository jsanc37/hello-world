ArrayList<Platform> p;
boolean iscolliding = false;
PVector pos;
PVector vel; 
float moving = 0;
float walk = 2;

void setup() {
  p = new ArrayList<Platform>();
  float y = height/2;
  float ory = y;
  for (int i = 0; i < width/50; i++) {
    p.add(new Platform(i*50, y));
    y += random(-100, 100); 
  }
  pos = new PVector(20, ory);
  vel = new PVector();  

rectMode(CENTER);
  strokeWeight(20); 
  point(389, 245);
  strokeWeight(6);

}
void settings() {
  size(1000, 500);
}
void draw (){
  background(255, 148, 41);
  iscolliding = false;
  for(Platform i: p) {
    i.show();
    if(i.collide(pos)) {
      iscolliding = true;
      pos.y = i.pos.y; 
    }
  line(1000, 700, 800, 50);
  println(width);
  stroke(200, 100, 20);
  line(100, 700, 800, 50);
  fill(50, 0, 0);
   
    line(870, 700, 800, 50);
  println(width);
  stroke(200, 100, 20);
  line(100, 700, 800, 50);
  fill(50, 349, 200);
 

  } 
  if(pos.y > height) {
    setup();
  }
  if(pos.x > width) {
    setup();
  } 
  fill(200, 400, 0);
  stroke(0);
  rect(pos.x, pos.y-8, 16, 16);
  if(!iscolliding) {
  vel.y += 0.2;
  }
  pos.add(vel);
  pos.x += moving; 
  vel.mult(0.9);
  //println(vel.y);
}
void keyPressed() { 
  if(key == 'a') {
    moving = -walk;
  }
  if(key == 'd') {
    moving = walk;
  }
  if(key == ' ') {
    if(iscolliding) {
      vel.y -= +15;
    }
}
}

void keyReleased() {
  if(key == 'a') {
    moving = 0;
  }
  if(key == 'd') {
    moving = 0;
  }
}
