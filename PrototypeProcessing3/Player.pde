class Player {
 
  int x, y, w, h;


  Player() {
    x= 100;
    y=250;
    w=30;
    h=70;
  }
  void display() {
    fill(255);
    rect(x, y, w, h);
  }
  void draw() {
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
  void checkDeath() {
    if (player.x >= crab1.x+10 && player.y+70 >=crab1.y-20 && player.x <=crab1.x+30 && player.y+40 <= crab1.y+10 && jumping == true) {
      death=true;
      println("dope");
    }
  }
}
