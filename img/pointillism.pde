
/* @pjs preload="img/profile.png"; */

PImage img;
int smallPoint, largePoint;
int time = 3;



void setup() {
  String url = "https://processing.org/img/processing-web.png";
  // Load image from a web server
 // img = loadImage(url, "png");
  img = loadImage("img/profile.png");
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
    int x = int(random(300));
    int y = int(random(314));
    color pix = img.get(x, y);
    fill(pix, 128);
    ellipse(x+20, y+20, pointillize, pointillize);
  }
  if (time > img.height){
    fill(time);
    text("FOUND", 50, 50);
  }
  time += 1;
}

