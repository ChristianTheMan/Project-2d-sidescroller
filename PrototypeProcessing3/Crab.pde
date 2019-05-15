class Crab extends Monster {
  boolean crabHidden = true;
  PImage Crab;


  Crab() {
    x=300;
    y=285;
    width=70;
    height=50;
    speedX=0;
    speedY=0;
  }

  void display() {

    Crab =loadImage("OCRAB.png");
    Crab.resize(width, height);
    image(Crab, x, y);
  }
  void draw() {

    if (crabHidden == true) {
      image(Sand, x, y+5);
    }

    d = dist(player.x, player.y+65, x, y);
    if (d<100) {
      crabHidden =false;
    }


    if (crabHidden == false && death == false) {
      display();

      //Crab movement
      x +=speedX;

      //De 2 tal krabben går imellem er 100-300

      if (x <500 &&  moveRight == true) {
        speedX=2;
      }
      if (x >500) {
        moveRight = false;
        speedX=-2;
      }
      if (x < 200) {
        moveRight = true;
      }
    }
  }
  void damage() {
  if (player.x == crab1.x -10 && jumping == false && death == false) {
    println("av");
    player.x =player.x +-60;
  }

  if (player.x == crab1.x+60 && jumping == false && death == false) {
    println("av2");
    player.x = player.x +60;
  }
}
}
