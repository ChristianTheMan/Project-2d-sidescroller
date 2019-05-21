class Panther extends Monster {
 
  boolean faceRight = true;
  boolean faceLeft = false;
  Panther() {
    x=3000;
    y=225;
    width=250;
    height=130;
    speedX=0;
    speedY=0;
    dmg = 20;
  }
  void displayR() {

    
    PantherR.resize(width, height);
    image(PantherR, x, y);
  }
  void displayL() {

    
    PantherL.resize(width, height);
    image(PantherL, x, y);
  }

  void draw() {
    x +=speedX;

    //De 2 tal krabben går imellem er 100-300

    if (x <500 &&  faceRight==true) {
      speedX=4;
      displayR();
      
    }
    if (x >500) {
      faceRight=false;
      faceLeft=true;
      displayL();
      speedX=-4;
    }
    if (faceLeft == true) {
      displayL();
    }
    if (x < 200) {
      faceRight=true;
      faceLeft=false;
    }
  }
  void damage() {
    if (player.x == panther.x+10  && jumping == false && death == false) {
      println("av");
      player.x =player.x +-60;
      player.hp = player.hp - dmg;
    }

    if (player.x == panther.x+250 && jumping == false && death == false) {
      println("av2");
      player.x = player.x +60;
      player.hp = player.hp - dmg;
    }
  }
}
