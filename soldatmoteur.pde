PImage sdm1;
int x;
int y;
int floor=800;
int spawn=250;
solg sold1 = new solg(spawn,floor);


void setup() {
  fullScreen();
  sdm1 = loadImage("dep1.png");
  sdm1 = resize(400,200);

  
}

void draw() {
  background(255,255,255);
  sold1.marche();

  
}


class solg {
float x;
int y;
  
  solg(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    
    
}
  void marche() {
    image(sdm1,x,y);
    x=x+1;
    
  }



}