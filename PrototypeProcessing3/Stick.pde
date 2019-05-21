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
  void display() {
    fill(0, 255, 0);
    rect(x, y, w, h);
  }
  void draw() {
    y += stickSpeedY;
    if (y >= 325 && !stickPickedUp) {
      stickSpeedY =0;
      y = 325;
    } else if (!stickPickedUp) { //item falls to the ground and doesnt fall forever
      stickSpeedY = +6;
      equipped = false;
    }
    /* Equips item ( If the player is close to the stick,
     and presses 'e', the sticks coordinates
     are set to the fit the player)
     */
    if (!equipped && player.x > x-20 && player.x < x +70 && key == 'e' || key == '1' && stickPickedUp ) {
      x = player.x + 30;
      y = player.y +30;
      equipped = true;
      stickPickedUp = true;
    }
    //Item stays connected to player
    if (equipped && stickPickedUp) {
      x = player.x;
      y = player.y+30;
    }
    //Unequip
    if (equipped && stickPickedUp && key =='2' || rock.rockEquipped && equipped == true) {
      equipped = false;
      stickPickedUp = true;
      x = 80;
      y = 400;
    }

    //Attacking (If the stick is equipped, and ' ' is pressed, then stick.x +30)
    x += stickSpeedX;
    if (equipped && key == ' ' && atkPressed == true) {
      stickSpeedX = +30;
    } else {
      stickSpeedX =0;
      atkPressed= false;
    }
    if (x > player.x+60 && equipped==true) {
      stickSpeedX = 0;
      x --;
      atkPressed = false;
    }
  }
}
