class Player {
  int x, y, w, h;


  Player() {
    x= 100;
    y=250;
    w=30;
    h=70;
  }

  Player(int _x, int _y, int _w, int _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }

  void display() {
    fill(255);
    rect(x, y, w, h);
  }
  void draw(){
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

}
