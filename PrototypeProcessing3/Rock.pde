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
  void display() {
    fill(200);
    noStroke();
    ellipse(x, y, w, w);
  }
  void draw() {

    // rocK
    y += speedY;
    if (y >= 325 && !rockPickedUp) {
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
      x = 50 ;
      y = 400;
    }

    //Attacking (If the stick is equipped, and ' ' is pressed, then stick.x +30)
    x += speedX;
    if (rockEquipped && key == ' ' && atkPressed == true) {
      speedX = +30;
    } else {
      speedX =0;
      atkPressed= false;
    }
    if (x > player.x+60 && rockEquipped==true || equipped && rockEquipped) {
      speedX = 0;
      x --;
      atkPressed = false;
    }
    if ( rockEquipped == true ) {
      for (int i = 0; i < 15; i++) { // Denne funktion er hvad der får stenene til at rykke sig fremad
        speedX = 0 + i;              // samt at indskrænke hvor langt stenen må flyve. plus at unequipped
        if (key == ' ') {            // stenen så den ikke bare teleporter tilbage til playeren
          rockEquipped = false; 
          rockPickedUp = false;
          x = x + speedX;
          if (i == 12 ) {
            speedY = 0 ;
          }
        }
      }
    }
  }
}
