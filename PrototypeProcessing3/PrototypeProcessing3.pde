//This is a comment
PImage Crab;
PImage Sand;
//PImage beach;
PImage Bar;
 PImage PantherL;
  PImage PantherR;
  PImage Heart [] = new PImage [3];

PImage gameBackground;
int x1, y1, w1, h1;
int x2, y2, w2, h2;
float playerSpeedY = 0;
float monsterSpeedX= 0;
float d;
boolean atkMode = false;
boolean rightPressed =false;
boolean leftPressed = false;
boolean upPressed = false;
boolean atkPressed = false;
boolean death = false;
boolean moveRight = true;
boolean press1 = false;
boolean press2 = false;  
boolean equipped = false;
boolean jumping = false;


Player player = new Player();
Stick stick= new Stick();
Monster [] monsters = new Monster[5];
//Crab crab = new Crab();
Crab crab1 = new Crab();
Monkey monkey = new Monkey();
Items item = new Items();
Rock rock = new Rock();
Stone stone = new Stone();
Panther panther = new Panther();

void setup () {
  size(800, 450);
 //beach = loadImage("darkbeach.png");
  Sand =loadImage("Sand_Dune.png");
 gameBackground = loadImage ("gameBackgroundFinish.png");
  Bar = loadImage("bar.png");
  PantherL =loadImage("PantherL.png");
  PantherR =loadImage("PantherR.png");
  Heart[0] = loadImage("Heart.png");
  Heart[1] = loadImage("Heart.png");
  Heart[2] = loadImage("Heart.png");


  //load monster
  monsters[0]= new Monster("pixelMonsterB.png");
  monsters[0].setXY(450, 240);
}

void draw () {
  player.movement();
  translate(player.x*-1+100, 0);

  //image(beach, 0, 0);
  //beach.resize(800, 450);
   image(gameBackground, 0, 0);
  gameBackground.resize(6000, 450);
  fill(255);
  fill(0, 0, 250);
  rect(x2, y2, w2, h2);
    player.draw();
  player.display();
   player.heart();
   player.checkDeath();
  rock.display();
  rock.draw();
  stick.display();
  stick.draw();
  monkey.display();
  monkey.draw();
  crab1.damage();
  crab1.draw();
  item.inventory();
  panther.draw();
  panther.damage();
  Sand.resize(60, 30);
  if (death == false) monsters[0].display();
  //Monster movement
  monsters[0].x += monsterSpeedX;
  monsterSpeedX = +1;
  if (monsters[0].x >= 700) {
    monsterSpeedX = 0;
  }


  //Item
}
boolean collision( Monster inputMonster, Stick stick) {
  float stickDistance = dist(inputMonster.x+inputMonster.width/2, inputMonster.y+inputMonster.height/2, stick.x+60, stick.y+6);
  if (stickDistance <inputMonster.width/2) {
    return true;
  } else {
    return false;
  }
}
void checkDeath2() {
  if (collision(monsters[0], stick) && atkPressed == true) {
    monsters[0].hp = monsters[0].hp+stick.dmg;
    println("dmg" + stick.dmg);
  }
}

void keyPressed() {
  if (keyCode =='1') {
    press1 = true;
  }
  if (keyCode =='2') {
    press2 = true;
  }
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
  if (keyCode =='1') {
    press1 = false;
  }
  if (keyCode =='2') {
    press2 = false;
  }
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
