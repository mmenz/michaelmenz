PImage img;
int smallPoint, largePoint;
int time = 3;

void setup() {
  img = loadImage("profile.png");
  size(340, 356);
  smallPoint = 1;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
   background(0,0);
}

void draw() { 
  float pointillize = smallPoint + (largePoint - smallPoint)*random(1)/log(time);
  for( int i=0; i<60; i++ ){
    int x = int(random(img.width));
    int y = int(random(img.height));
    color pix = img.get(x, y);
    fill(pix, 128);
    ellipse(x+20, y+20, pointillize, pointillize);
  }
  time += 1;
}

