//This is a comment
PImage Crab;
PImage Sand;
PImage beach;

int x1, y1, w1, h1;
int x2, y2, w2, h2;
float playerSpeedY =0;

float monsterSpeedX=0;
float d;
boolean jumping = false;
boolean equipped = false;
boolean atkMode = false;
boolean rightPressed =false;
boolean leftPressed = false;
boolean upPressed = false;
boolean atkPressed = false;
boolean death = false;
boolean rockEquipped = false;
boolean thrown = false; 
boolean moveRight = true;
boolean crabHidden = true;

Player player = new Player();
Stick stick= new Stick();
Monster [] monsters = new Monster[5];
Crab crab = new Crab();

Rock rock = new Rock();

void setup () {
  size(800, 450);
  beach = loadImage("darkbeach.png");
  Sand =loadImage("Sand_Dune.png");
  Crab =loadImage("OCRAB.png");

  
  //load monster
 // monsters[0]= new Monster("pixelMonsterB.png");
  //monsters[0].setXY(450, 240);
}

void draw () {
  player.movement();
  player.draw();
  image(beach, 0, 0);
  beach.resize(800, 450);
  fill(255);
  fill(0, 0, 250);
  rect(x2, y2, w2, h2);
  player.display();
  rock.display();
  stick.display();
    Sand.resize(60, 30);
  checkDeath();
  damage();
  crab.draw();
  rock.draw();
  stick.draw();
  

 // if (death == false) monsters[0].display();

  checkDeath();

  
  /*
  //Monster movement
   monsters[0].x += monsterSpeedX;
   monsterSpeedX = +1;
   if (monsters[0].x >= 700){
   monsterSpeedX = 0;
   }
   */

  //Item

}


void keyPressed() {
  if (keyCode =='A') {
    leftPressed = true;
  }
  if (keyCode == 'D') {
    rightPressed = true;
  }
  if (keyCode == 'W' && !jumping) {
    upPressed = true;
  }
  if (keyCode == ' ' && equipped) {
    atkPressed = true;
  }
}

void keyReleased() {
  if (keyCode == 'A') {
    leftPressed = false;
  }
  if (keyCode == 'D') {
    rightPressed = false;
  }
  if (keyCode == 'W') {
    upPressed = false;
  }
  if (keyCode == ' ') {
    atkPressed = false;
  }
}
void damage() {
  if (player.x == crab.x -10 && jumping == false && death == false) {
    println("av");
    player.x =player.x +-60;
  }

  if (player.x == crab.x+60 && jumping == false && death == false) {
    println("av2");
    player.x = player.x +60;
  }
}


void checkDeath() {


  if (player.x >= crab.x+10 && player.y+70 >=crab.y-20 && player.x <=crab.x+30 && player.y+40 <= crab.y+10 && jumping == true) {
    death=true;
    println("dope");
  }
}


void movement2() {
  if (keyPressed) {
    if (rightPressed) {
      player.x=player.x+2;
    }
    if (leftPressed) {
      player.x=player.x-2;
    }
    if (upPressed) {
      playerSpeedY =-10;
      jumping = true;
    }
  }
}
