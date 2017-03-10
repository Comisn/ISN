PImage sdm1;
PImage sdm2;
PImage sdm3;


int x;
int y;
int floor=700;
int spawn=250;
solg sold1 = new solg(spawn,floor);


void setup() {
  fullScreen();
  sdm1 = loadImage("dep1.png");
  sdm2 = loadImage("dep2.png");
  sdm3 = loadImage("dep3.png");
  sdm1.resize(400,200);
  sdm2.resize(400,200);
  sdm3.resize(400,200);

  
}






void draw() {
  background(255,255,255);
  
  
  
  sold1.marche();

  
}


class solg {
float x;
int y;
int i=0;
int f=1;
int life;
int armor;
int as;
int dmg;

 
  solg(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    
    
}

  
  
  
  
  
  
  
  
  
  
  
  void combat() {
      if(f==1){              //système d'animation d'image
    image(sdm1,x,y);
    }
    if(f==2){
    image(sdm2,x,y);
    }
    if(f==3){
    image(sdm3,x,y);
    }
    
    
    if(i<15){
    i=i+1;
    } else {
    i=0;
      if(f<3){
      f=f+1;
      } else {
      f=1;
      }
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  void marche() {
    
    
    if(f==1){              //système d'animation d'image
    image(sdm1,x,y);
    }
    if(f==2){
    image(sdm2,x,y);
    }
    if(f==3){
    image(sdm3,x,y);
    }
    
    
    if(i<15){
    i=i+1;
    } else {
    i=0;
      if(f<3){
      f=f+1;
      } else {
      f=1;
      }
    }
    
    
    
    x=x+1;    //déplacement
    
    
  }



}