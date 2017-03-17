PImage sdm1;
PImage sdm2;
PImage sdm3;
int[] positionsg=new int[50];
int[] positionsd=new int[50];

int dgtg;
int dgtd;


int x;
int y;
int floor=700;
int spawng=250;
int spawnd=800;
int z;
solg sold1 = new solg(spawng,floor);
sold sol1 = new sold(spawnd,floor);



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
  cerveaug();
  cerveaud();
  fill(0);
  text(sold1.life, 10, 100);
  text(sol1.life, 100, 100);

  
 
  
  

  
}


void cerveaug() {    //moteur qui relie les différentes actions de l'unité
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

void cerveaud() {    //moteur qui relie les différentes actions de l'unité
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
int dgtg;    //variable pour les dégats exportés xD
boolean vie=true;



 
  solg(int nouvX, int nouvY) {
    x= nouvX;
    y=nouvY;
    nbr=nbr+1;
    dmg=10;    //caractéristiques
    life=50;
    armor=5;
    
    
}

  
  void combat() {    //action de combat
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
    if(i==15){    //attaque
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
    if(sol1.dgtd>1){    //réception des dégats
    life=life-(sol1.dgtd-armor);     
    }
  }
  
  void attend() {
    
      image(sdm1,x,y); 
      
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

  
  void combat() {    //combats
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
    
    if(i==15){    //attaque
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
    if(sold1.dgtg>1) {    //réception des dégats
    life=(life-sold1.dgtg-armor);    
    }
  }
  void attend() {
    
      image(sdm1,x,y); 
      
    }
  void mort() {
    fill(255,0,0);
    ellipse(x,y,26,26);
    
  }
}