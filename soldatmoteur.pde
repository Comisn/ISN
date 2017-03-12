PImage sdm1;
PImage sdm2;
PImage sdm3;
int[] positionsg=new int[50];
int[] positionsd=new int[50];

int x;
int y;
int floor=700;
int spawn=250;
int z;
solg sold1 = new solg(spawn,floor);



void setup() {
  fullScreen();
  sdm1 = loadImage("dep1.png");
  sdm2 = loadImage("dep2.png");
  sdm3 = loadImage("dep3.png");
  sdm1.resize(400,200);
  sdm2.resize(400,200);
  sdm3.resize(400,200);
  positionsd[1]=1000;



  
  
}






void draw() {
  background(255,255,255);
  cerveau();

  fill(0);
  rect(1200,0,300,1000);
  
 
  
  

  
}


void cerveau() {
 if(positionsd[1]==sold1.x){
  sold1.combat();
 } else if(positionsg[1]==sold1.x-50){
 sold1.attend();
 } else {
 sold1.marche();
 }
}




class solg {
int x;
int y;
int i=0;
int f=1;
int life;
int armor;
int as;
int dmg;
color c=color(255,200,10);
int nbr;



 
  solg(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    nbr=nbr+1;
    
    
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
    x=x+1;    //déplacement
    positionsg[nbr] = x;

    
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
  void attend() {
    
      image(sdm1,x,y); 
      
    }

}