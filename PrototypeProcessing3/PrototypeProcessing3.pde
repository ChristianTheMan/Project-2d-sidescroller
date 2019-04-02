//This is a comment

PImage beach;
int x1, y1, w1, h1;
int x2, y2, w2, h2;
boolean jumping = false;
float playerSpeedY =0;
boolean equipped = false;
float stickSpeedY = 0;
float stickSpeedX= 0;
float monsterSpeedX=0;
boolean atkMode = false;
boolean rightPressed =false;
boolean leftPressed = false;
boolean upPressed = false;
boolean atkPressed = false;
PImage[] pixelMonster;
boolean death = false;

Player player = new Player();
Stick stick= new Stick();
Monster [] monsters = new Monster[5];

Rock rock = new Rock();

void setup () {
  size(800, 450);
  beach = loadImage("darkbeach.png");
  
  //load monster
  monsters[0]= new Monster("pixelMonsterB.png");
  monsters[0].setXY(450, 240);
}

void draw () {
  movement();
  image(beach, 0, 0);
  beach.resize(800, 450);
  fill(255);
  fill(0, 0, 250);
  rect(x2, y2, w2, h2);
  player.display();
  rock.display();
  stick.display();
  if (death == false) monsters[0].display();

  checkDeath();

  //jumping
  player.y +=playerSpeedY;
  if (player.y >=250) {
    playerSpeedY =0;
    jumping = false;
  } else {
    playerSpeedY ++;
  }
  //If player reaches certain height, jumping = false
  if (player.y <= 180) {
    upPressed = false;
  }
  /*
  //Monster movement
   monsters[0].x += monsterSpeedX;
   monsterSpeedX = +1;
   if (monsters[0].x >= 700){
   monsterSpeedX = 0;
   }
   */

  //Item

  stick.y += stickSpeedY;
  if (stick.y >= 325) {
    stickSpeedY =0;
    stick.y = 325;
  } else { //item falls to the ground and doesnt fall forever
    stickSpeedY = +6;
  }
  /* Equips item ( If the player is close to the stick,
   and presses 'e', the sticks coordinates
   are set to the fit the player)
   */
  if (!equipped && player.x > stick.x-20 && player.x < stick.x +70 && key == 'e') {
    stick.x = player.x + 30;
    stick.y = player.y +30;
    equipped = true;
  }
  //Item stays connected to player
  if (equipped) {
    stick.x = player.x;
    stick.y = player.y+30;
  }
  //Unequip
  if (equipped && key =='o') {
    equipped = false;
  }

  //Attacking (If the stick is equipped, and ' ' is pressed, then stick.x +30)
  stick.x += stickSpeedX;
  if (equipped && key == ' ' && atkPressed == true) {
    stickSpeedX = +30;
  } else {
    stickSpeedX =0;
    atkPressed= false;
  }
  if (stick.x > player.x+60 && equipped==true) {
    stickSpeedX = 0;
    stick.x --;
    atkPressed = false;
  }
}





void movement() {
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

//collision between monster and stick
boolean collision( Monster inputMonster, Stick stick) {
  float distance = dist(inputMonster.x+inputMonster.wide/2, inputMonster.y+inputMonster.high/2, stick.x+60, stick.y+5);
  if (distance < inputMonster.wide/2) {

    return true;
  } else {
    return false;
  }
}


void checkDeath() {
  if (collision(monsters[0], stick) && atkPressed == true) {
    monsters[0].hp = monsters[0].hp+stick.dmg;
    println("Dmg " + stick.dmg);

    //death = true;
  }
}
