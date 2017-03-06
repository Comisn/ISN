PImage sdm1;
int x;
int y;
solg sold1 = new solg(50,50);

void setup() {
  fullScreen();
  sdm1 = loadImage("dep1.png");
  
}

void draw() {
  background(255,255,255);
  solg.display();

  
}


class solg {
int x;
int y;
  
  solg(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    
    
}
  void display() {
    fill(255);
    ellipse(x, y, 40, 40);
  }



}