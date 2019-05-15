class Rock {
  int x;
  int y;
  int w;
  int speedX;
  int speedY;
  int life = 255;
  boolean rocksVisible = false;
  boolean rockPickedUp = false;
  boolean rockEquipped = false;
  boolean thrown = false; 


  Rock() {
    x=200;
    y=320;
    w=10;
  }

  Rock(int _x, int _y, int _w)
  {
    x = _x;
    y = _y;
    w = _w;
  }


  void display() {
    fill(200);
    noStroke();
    ellipse(x, y, w, w);
  }
  void draw() {

    // rocK
    y += rock.speedY;
    if (y >= 325) {
      speedY =0;
      y = 325;
    } else if (!rockPickedUp) { //item falls to the ground and doesnt fall forever
      speedY = +6;
      rockEquipped =false;
    }
    /* Equips item ( If the player is close to the stick,
     and presses 'e', the sticks coordinates
     are set to the fit the player)
     */
    if (!rockEquipped && player.x > x-20 && player.x < x +20 && key == 'e' || key == '2' && rockPickedUp == true  ) {
      rockEquipped = true;
        rockPickedUp = true;
        x = player.x + 30;
        y = player.y +30;
    }
    //Item stays connected to player
    if (rockEquipped && rockPickedUp ) {
      x = player.x;
      y = player.y+30;
    }
    //Unequip
    if (rockEquipped && rockPickedUp && key =='1') {
      rockPickedUp = true;
      rockEquipped = false;
      x = 50;
      y = 50;
    }

    //Attacking (If the stick is equipped, and ' ' is pressed, then stick.x +30)
    x += speedX;
    if (rockEquipped && key == ' ' && atkPressed == true) {
      speedX = +30;
    } else {
      speedX =0;
      atkPressed= false;
    }
    if (x > player.x+60 && rockEquipped==true) {
      speedX = 0;
      x --;
      atkPressed = false;
    }
    if ( rockEquipped == true ) {

      for (int i = 0; i < 15; i++) {
        speedX = 0 + i;
        if (key == ' ') {
          rockEquipped = false; 
          rockPickedUp = false;
          x = rock.x + speedX;
          if (i == 12 ) {
            speedY = 0 ;
          }
        }
      }
    }
  }
}
