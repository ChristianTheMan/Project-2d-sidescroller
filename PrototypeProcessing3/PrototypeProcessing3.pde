//This is a comment
PImage Crab;
PImage Sand;
PImage beach;

int x1, y1, w1, h1;
int x2, y2, w2, h2;
float playerSpeedY =0;
float stickSpeedY = 0;
float stickSpeedX= 0;
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
    Sand.resize(60, 30);
  checkDeath();
  damage();
  

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
// rock
  rock.y += rock.speedY;
  if (rock.y >= 325) {
    rock.speedY =0;
    rock.y = 325;
  } else { //item falls to the ground and doesnt fall forever
    rock.speedY = +6;
  }
  /* Equips item ( If the player is close to the stick,
   and presses 'e', the sticks coordinates
   are set to the fit the player)
   */
  if (!rockEquipped && player.x > rock.x-20 && player.x < rock.x +70 && key == 'e') {
    rock.x = player.x + 30;
    rock.y = player.y +30;
    rockEquipped = true;
  }
  //Item stays connected to player
  if (rockEquipped) {
    rock.x = player.x;
    rock.y = player.y+30;
  }
  //Unequip
  if (rockEquipped && key =='o') {
    rockEquipped = false;
  }

  //Attacking (If the stick is equipped, and ' ' is pressed, then stick.x +30)
  rock.x += rock.speedX;
  if (rockEquipped && key == ' ' && atkPressed == true) {
    rock.speedX = +30;
  } else {
    rock.speedX =0;
    atkPressed= false;
  }
  if (rock.x > player.x+60 && rockEquipped==true) {
    rock.speedX = 0;
    rock.x --;
    atkPressed = false;
  }
  if ( rockEquipped == true ){
      
    for (int i = 0 ; i < 15; i++){
      rock.speedX = 0 + i;
      if (key == ' '){
        rockEquipped = false; 
        rock.x = rock.x + rock.speedX;
        if (i == 12 ){
         rock.speedY = 0 ;
       
        }
      }
    }
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
/*boolean collision( Monster inputMonster, Stick stick) {
  float stickDistance = dist(inputMonster.x+inputMonster.wide/2, inputMonster.y+inputMonster.high/2, stick.x+60, stick.y+5);
  
  if (stickDistance < inputMonster.wide/2) {


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
}*/

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
