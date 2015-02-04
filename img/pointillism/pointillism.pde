PImage img1, img2, img;
int smallPoint, largePoint;
int time = 3;
int imgn = 1;

void setup() {
  img1 = loadImage("reduced.png");
  img2 = loadImage("seahawks.jpg");
  img = img1;
  size(img.width, img.height);
  smallPoint = 3;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 
  float pointillize = smallPoint + (largePoint - smallPoint)*random(3.0)/log((time%300)+2);
  for( int i=0; i<200; i++ ){
    int x = int(random(img.width));
    int y = int(random(img.height));
    color pix = img.get(x, y);
    fill(pix, 128);
    textSize(pointillize);
    text(str(int(random(10))),x,y);
  }
  time += 1;
  if (time%300 == 0){
    if (imgn == 1){
      img = img2; 
      imgn = 2;
    }
    else if (imgn == 2){
      img = img1; 
      imgn = 1;
    }
    
  }
}
