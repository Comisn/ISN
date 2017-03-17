PImage frd1;
PImage frd2;
PImage frd3;
int x;
int y;
int floor=700;
int spawn=250;
frng frond1 = new frng(spawn,floor); //frondeur venant de la gauche


void setup() {
  fullScreen();
  frd1 = loadImage("fg1.png");
  frd2 = loadImage("fg2.png");
  frd3 = loadImage("fg3.png");
//il faut mettre un autre resize

  
}

void draw() {
  background(255,255,255);
  frond1.marche();
  
}


  
  
  class frng { //caractéristiques des frondeurs
float x;
int y;
int i=0;
int f=1;
int life;
int armor;
int as;
int dmg;

 
  frng(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    
  }
  
  
  
  
  
  
  
  
  
  void marche() {
    if(f==1){
    image(frd1,x,y);
    }
    if(f==2){
    image(frd2,x,y);
    }
    if(f==3){
    image(frd3,x,y);
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