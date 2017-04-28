// TOUT les PImage corresponde à l'importation d'images: ici les sprites des personnages
PImage comb1;    //skin croisé   combat
PImage comb2;
PImage comb3;
PImage comb4;
PImage comb5;
PImage combg1;
PImage combg2;
PImage combg3;
PImage combg4;
PImage combg5;
PImage depcroise1;    //skin croisé deplacements0
PImage depcroise2;
PImage depcroise3;
PImage depcroise4;
PImage depcroiseg1;   
PImage depcroiseg2;
PImage depcroiseg3;
PImage depcroiseg4;
PImage croisestop;    //skin croisé quand il bouge pas
PImage croisestopg;

String classeg;
String classed;



int[] positionsg=new int[50];
int[] positionsd=new int[50];

int dgtg;
int dgtd;

boolean soldbrain1g = false;
boolean soldbrain1d = false;
boolean soldbrain2g = false;
boolean soldbrain2d = false;

float drawWidth;
float drawWidth2;
int nbrd;
int x;
int y;
int floor=400;
int spawng=50;
int spawnd=950;
int z;

sol1 sol1 = new sol1(spawnd,floor,25,150,7,15,5);    //création des objets sans caractéristiques:  dmg,life,armor,as,lifesteal
sold1 sold1 = new sold1(spawng,floor,25,150,7,15,0);


void setup() {
  
  
  size(1400, 800);

  depcroise1 = loadImage("depcroise1.png");  //Ici on associes les différents sprites importés plus haut à des variables d'images
  depcroise2 = loadImage("depcroise2.png");
  depcroise3 = loadImage("depcroise3.png");
  depcroise4 = loadImage("depcroise4.png");
  depcroiseg1 = loadImage("depcroiseg1.png");  
  depcroiseg2 = loadImage("depcroiseg2.png");
  depcroiseg3 = loadImage("depcroiseg3.png");
  depcroiseg4 = loadImage("depcroiseg4.png");
  comb1 = loadImage("comb1.png");
  comb2 = loadImage("comb2.png");
  comb3 = loadImage("comb3.png");
  comb4 = loadImage("comb4.png");
  comb5 = loadImage("comb5.png");
  combg1 = loadImage("combg1.png");
  combg2 = loadImage("combg2.png");
  combg3 = loadImage("combg3.png");
  combg4 = loadImage("combg4.png");
  combg5 = loadImage("combg5.png");
  croisestop = loadImage("croisestop.png");
  croisestopg = loadImage("croisestopg.png");

  





  
}






void draw() {
  background(255,255,255);
  fill(0);
  text(sold1.life, 10, 100);
  text(sol1.life, 700, 100);
  BDV();
  
  
  
  if(mouseButton == LEFT) { //invoquer le soldats avec la souris
   soldbrain1g = true;
  }
  if(soldbrain1g == true) {
    sold1.cerveau();
  }
   
   if(mouseButton == RIGHT) {
   soldbrain1d = true;
  }
  if(soldbrain1d == true) {
    sol1.cerveau();
  }
  
  
  
  

  
  
}


void BDV() { //barre de vie

  noStroke();
  drawWidth = sold1.life / sold1.maxlife ;
  rect(50, 720, drawWidth*600, 40);
  stroke(0);
  noFill();
  rect(50, 720, 600, 40);

   
  noStroke();
  drawWidth2 = 1-(sol1.life/sol1.maxlife) ;
  rect(200, 720, (1-drawWidth2)*600, 40);
}





class sold1 {
int x;
int y;
int i=0;
int f=1;
int life;
float maxlife;
int armor;    //armure
int as;    //attaque speed
int dmg;
int ls;
color c=color(255,200,10);
int nbrg;
int dgtg;    //variable pour les dégats exportés xD
boolean vie=true;
boolean barb=false;
boolean regen=false;



 
  sold1(int nouvX, int nouvY, int nouvdmg, int nouvlife, int nouvarmor, int nouvas, int nouvls) {    //on permet d'entrer les différentes variables lors de la création de l'objet
    x= nouvX;
    y=nouvY;
    nbrg=nbrg+1;
    dmg=nouvdmg;    //caractéristiques
    life=nouvlife;
    maxlife=nouvlife;
    armor=nouvarmor;
    as=nouvas;
    ls=nouvls;
    
    
}
  void cerveau() { //moteur qui relit les différentes actions de l'unité de gauche
   if(vie){
   if(sol1.vie){
   if(positionsd[1]==x+50){
    combat();
   } else {
   marche();
   }
   if(life<=0) {
   mort();
   vie=false;
   }
   }
   if(!sol1.vie){
   attend();
   }
   }
   
  }
  
  void combat() {    //action de combat
    if (barb) {      //effet barbare: as augmente quand + de dmg
    as=15-(life/20);  
    }
    if (regen&&i==1) {      //effet démon: regen de vie
    life=life+2;  
    }
    
    if(f<1){
    image(croisestopg,x,y);  
    }
    if(f==1){              //système d'animation d'image
    image(combg1,x,y);
    }
    if(f==2){
    image(combg2,x,y);
    
    }
    if(f==3){
    image(combg3,x,y);
    
    }
    if(f==4){
    image(combg4,x,y);
    
    }
    if(f==5){
    image(combg5,x,y);
    
    }

    
    if(i<as){
    i=i+1;
    } else {
    i=0;
      if(f<5){
      f=f+1;
      } else {
      f=int(random(1,10))*-1;
      
      }
    }
    if(f==5&&i==1){    //attaque
    dgtg=dmg+int(random(dmg/2*-1,dmg/2));  
    life=life+ls;
    }  else {
    dgtg=0;
    }
    
    if(sol1.dgtd>1) {    //réception des dégats
    life=life-(sol1.dgtd-armor);    
    }
    
    
  
  }
  
  
  
  
  
  void marche() {    //action de déplacement
    x=x+1;    //déplacement
    positionsg[nbrg] = x;    //attribution de sa position au tableau pour qu'il puisse être détecté

    
    if(f==1){              //système d'animation d'image
    image(depcroiseg1,x,y);
    }
    if(f==2){
    image(depcroiseg2,x,y);
    }
    if(f==3){
    image(depcroiseg3,x,y);
    }
    if(f==4){
    image(depcroiseg4,x,y);
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
    
  image(croisestopg,x,y); 
      
    }
  void mort() {
  fill(255,0,0);
  ellipse(x,y,26,26);
    
  }

}


class sol1 {
int x;
int y;
int i=0;    //compteur du temps
int f=1;    //compteur de frames
int life;    //vie
float maxlife; 
int armor;    //armor
int as;
int dmg;
int ls;
int atk;
color c=color(255,200,10);
int nbrd;
int dgtd;
boolean vie=true;
boolean barb=false;
boolean regen=false;



 
  sol1(int nouvX, int nouvY, int nouvdmg, int nouvlife, int nouvarmor, int nouvas, int nouvls) {
    x= nouvX;
    y=nouvY;
    nbrd=nbrd+1;
    dmg=nouvdmg;    //caractéristiques
    life=nouvlife;
    maxlife=nouvlife;
    armor=nouvarmor;
    as=nouvas;
    ls=nouvls;
    
    
}

  void cerveau() {    //moteur qui relie les différentes actions de l'unité de droite
   if(vie){
   if(sold1.vie){
   if(positionsg[1]==x-50){
    combat();
   } else {
   marche();
   }
   if(life<=0) {
   mort();
   vie=false;
   }
   }
   if(!sold1.vie){
   attend();
   }
   }
   
 
}  
  void combat() {    //combats
    if (barb) {      //effet barbare: as augmente quand + de dmg
    as=15-((150-life)/20);  
    }
    if (regen&&i==1) {      //effet démon: regen de vie
    life=life+2;  
    }
    
    if(f<1){
    image(croisestop,x,y);  
    }
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
    image(comb4,x,y);
    
    }
    if(f==5){
    image(comb5,x,y);
    
    }

    
    if(i<as){
    i=i+1;
    } else {
    i=0;
      if(f<5){
      f=f+1;
      } else {
      f=int(random(1,10))*-1;
      
      }
    }
    
    
    if(f==5&&i==1){    //attaque
    dgtd=dmg+int(random(dmg/2*-1,dmg/2));  
    life=life+ls;
    }  else {
    dgtd=0;
    }
    
    if(sold1.dgtg>1) {    //réception des dégats
    life=life-(sold1.dgtg-armor);    
    }
  }
  
  
  
  
  
  void marche() {    //déplacement
    x=x-1;    
    positionsd[nbrd] = x;    //attribution de sa position au tableau pour qu'il puisse être détecté

    
    if(f==1){              //système d'animation d'image
    image(depcroise1,x,y);
    }
    if(f==2){
    image(depcroise2,x,y);
    }
    if(f==3){
    image(depcroise3,x,y);
    }
    if(f==4){
    image(depcroise4,x,y);
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
    
    image(croisestop,x,y); 
      
    }
  void mort() {
    fill(255,0,0);
    ellipse(x,y,26,26);
    
  }
}

void choixg() {    //fonction de choix et d'association des caractéristiques aux différents personnages
  if (classeg == "Croisé") {
    sol1 = new sol1(spawnd,floor,26,120,7,15,0);  
    //ajouter burst et achèvement
  }
  if (classeg == "Shaco") {
    
  }
  if (classeg == "Barbare") {
    sol1 = new sol1(spawnd,floor,26,120,7,15,7);
    sol1.barb = true;
  }
  if (classeg == "Myrmidon") {
    
  }
  if (classeg == "Spartiate") {
    sol1 = new sol1(spawnd,floor,30,140,8,14,0);
    //ajouter un shield
  }
  if (classeg == "Paladin") {
    sol1 = new sol1(spawnd,floor,25,150,15,15,0);
    
  }
  if (classeg == "Démon") {
    sol1 = new sol1(spawnd,floor,24,200,9,15,0);
    sol1.regen = true;
    
  }
  if (classeg == "SwordMaster") {
    sol1 = new sol1(spawnd,floor,32,100,5,14,12);
    
  }
  if (classeg == "Assassin") {
    sol1 = new sol1(spawnd,floor,42,100,5,13,0);
  }
}