PImage sdm1;    //tout les PImage c'est les sprites
PImage sdm2;
PImage sdm3;
PImage sdm4;
PImage sdm1g;    //tout les PImage c'est les sprites
PImage sdm2g;
PImage sdm3g;
PImage sdm4g;
PImage sdstop;
PImage sdstopg;
PImage comb1;
PImage comb2;
PImage comb3;


int[] positionsg=new int[50]; //tableau afin de repérer les positions
int[] positionsd=new int[50];

int dgtg;
int dgtd;


int x;
int y;
int floor=500;
int spawng=150;
int spawnd=900;
int z;
solg sold1 = new solg(spawng,floor);
sold sol1 = new sold(spawnd,floor);



void setup() {
  
  
  size(1500, 1000);
  sdm1 = loadImage("dep1.png");    //importation des sprites
  sdm2 = loadImage("dep2.png");
  sdm3 = loadImage("dep3.png");
  sdm4 = loadImage("dep4.png");
  sdm1g = loadImage("dep1g.png");    //importation des sprites
  sdm2g = loadImage("dep2g.png");
  sdm3g = loadImage("dep3g.png");
  sdm4g = loadImage("dep4g.png");
  sdstop = loadImage("stop.png");
  sdstopg = loadImage("stopg.png");
  comb1 = loadImage("comb1.png");
  comb2 = loadImage("comb2.png");
  comb3 = loadImage("comb3.png");
  





  
}






void draw() {
  background(255,255,255);
  sold1.cerveau();
  sol1.cerveau();
  fill(0);
  text(sold1.life, 10, 100);
  text(sol1.life, 100, 100);

  
 
  
  

  
}










class solg {
int x;
int y;
int i=0;
int f=1;
int life;
int armor;    //armure
int as;    //attaque speed
int dmg;
color c=color(255,200,10);
int nbr;
int dgtg;    //variable pour les dégats exportés 
boolean vie=true;



 
  solg(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    nbr=nbr+1;
    dmg=10;    //caractéristiques
    life=50;
    armor=5;
    
    
}
  void cerveau() {
   if(sold1.vie){
   if(positionsd[1]==sold1.x+50){
    sold1.combat();
   } else if(positionsg[1]==sold1.x-50){
   sold1.attend();
   } else {
   sold1.marche();
   }
   if(sold1.life<=0) {
   sol1.mort();
   sold1.vie=false;
   }
   }
  }
  
  void combat() {    //action de combat
      if(f==1){              //système d'animation d'image
    image(comb1,x,y);
    }
    if(f==2){
    image(comb2,x,y);
    
    }
    if(f==3){
    image(comb3,x,y);
    
    }
    if(f==4){
    image(comb2,x,y);
    
    }

    
    if(i<15){    //i c'est la vitesse de déroulement des images 
    i=i+1;
    } else {
    i=0;
      if(f<4){    //f c'est le nombre total d'images de l'animation
      f=f+1;
      } else {
      f=1;
      }
    }
    if(f==4&&i==1){    //attaque
    dgtg=dgtg+dmg;  
    }  else {
    dgtg=0;
    }
    
    if(sol1.dgtd>1) {    //réception des dégats
    life=life-(sol1.dgtd-armor);    
    }
    
    
  
  }
  
  
  
  
  
  void marche() {    //action de déplacement
    x=x+1;    //déplacement
    positionsg[nbr] = x;    //attribution de sa position au tableau pour qu'il puisse être détecté

    
    if(f==1){              //système d'animation d'image
    image(sdm1g,x,y);
    }
    if(f==2){
    image(sdm2g,x,y);
    }
    if(f==3){
    image(sdm3g,x,y);
    }
    if(f==4){
    image(sdm4g,x,y);
    }
    
    
    if(i<13){
    i=i+1;
    } else {
    i=0;
      if(f<4){
      f=f+1;
      } else {
      f=1;
      }
    }
    if(sol1.dgtd>1){    //réception des dégats
    life=life-(sol1.dgtd-armor);     
    }
  }
  
  void attend() {
    
  image(sdstop,x,y); 
      
    }
  void mort() {
  fill(255,0,0);
  ellipse(x,y,26,26);
    
  }

}


class sold {
int x;
int y;
int i=0;    //compteur du temps
int f=1;    //compteur de frames
int life;    //vie
int armor;    //armor
int as;
int dmg;
color c=color(255,200,10);
int nbr;
int dgtd;
boolean vie=true;



 
  sold(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    nbr=nbr+1;
    dmg=10;    //initialisation des caractéristiques
    life=50;
    armor=5;
    
    
    
}

  void cerveau() {    //moteur qui relie les différentes actions de l'unité
   if(sol1.vie){
   if(positionsg[1]==sol1.x-50){
    sol1.combat();
   } else if(positionsd[1]==sol1.x-50){
   sol1.attend();
   } else {
   sol1.marche();
   }
   if(sol1.life<=0) {
   sol1.mort();
   sol1.vie=false;
   }
   }
 
}  
  void combat() {    //combats
    if(f==1){              //système d'animation d'image
    image(comb1,x,y);
    }
    if(f==2){
    image(comb2,x,y);
    
    }
    if(f==3){
    image(comb3,x,y);
    
    }
    if(f==4){
    image(comb2,x,y);
    
    }

    
    if(i<15){
    i=i+1;
    } else {
    i=0;
      if(f<4){
      f=f+1;
      } else {
      f=1;
      }
    }
    
    if(f==4&&i==1){    //attaque
    dgtd=dgtd+dmg;  
    }  else {
    dgtd=0;
    }
    
    if(sold1.dgtg>1) {    //réception des dégats
    life=life-(sold1.dgtg-armor);    
    }
  }
  
  
  
  
  
  void marche() {    //déplacement
    x=x-1;    
    positionsd[nbr] = x;    //attribution de sa position au tableau pour qu'il puisse être détecté

    
    if(f==1){              //système d'animation d'image
    image(sdm1,x,y);
    }
    if(f==2){
    image(sdm2,x,y);
    }
    if(f==3){
    image(sdm3,x,y);
    }
    if(f==4){
    image(sdm4,x,y);
    }
    
    
    if(i<13){
    i=i+1;
    } else {
    i=0;
      if(f<4){
      f=f+1;
      } else {
      f=1;
      }
    }
    if(sold1.dgtg>1) {    //réception des dégats
    life=(life-sold1.dgtg-armor);    
    }
  }
  void attend() {
    
    image(sdstop,x,y); 
      
    }
  void mort() {
    fill(255,0,0);
    ellipse(x,y,26,26);
    
  }
}
