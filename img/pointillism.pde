
/* @pjs preload="img/profile.png"; */

PImage img;
int smallPoint, largePoint;
int time = 3;

void setup() {
  img = loadImage("img/profile.png");
  size(340, 356);
  smallPoint = 1;
  largePoint = 100;
  imageMode(CENTER);
  noStroke();
  background(0,0);
}

void draw() {
  float pointillize = smallPoint + (largePoint - smallPoint)*random(1)/log(time);
  for( int i=0; i<min(time,60); i++ ){
    int x = int(random(300));
    int y = int(random(314));
    color pix = img.get(x, y);
    fill(pix, 128);
    textAlign(CENTER, CENTER);
    textSize(pointillize);
    text(str(int(random(10))),x+20,y+20);
   // ellipse(x+20, y+20, pointillize, pointillize);
  }
  time += 1;
  if (time > 200){
    time += time/100;
  }
}

