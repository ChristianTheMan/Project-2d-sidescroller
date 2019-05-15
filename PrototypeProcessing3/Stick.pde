class Stick {
  int x, y, w, h, dmg;
  float stickSpeedY = 0;
  float stickSpeedX= 0;

  boolean stickPickedUp = false;




  Stick() {
    x= 250;
    y=320;
    w=70;
    h=5;
    dmg=25;
  }

  Stick(int _x, int _y, int _w, int _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }


  void display() {
    fill(0, 255, 0);
    rect(x, y, w, h);
  }
  void draw() {

    stick.y += stickSpeedY;
    if (stick.y >= 325) {
      stickSpeedY =0;
      stick.y = 325;
    } else if (!stickPickedUp){ //item falls to the ground and doesnt fall forever
      stickSpeedY = +6;
      equipped = false;
    }
    /* Equips item ( If the player is close to the stick,
     and presses 'e', the sticks coordinates
     are set to the fit the player)
     */
    if (!equipped && player.x > stick.x-20 && player.x < stick.x +70 && key == 'e' || key == '1' && stickPickedUp ) {
      stick.x = player.x + 30;
      stick.y = player.y +30;
      equipped = true;
      stickPickedUp = true;
    }
    //Item stays connected to player
    if (equipped && stickPickedUp) {
      stick.x = player.x;
      stick.y = player.y+30;
    }
    //Unequip
    if (equipped && stickPickedUp && key =='2') {
      equipped = false;
      stickPickedUp = true;
      x = 70;
      y = 50;
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
}
