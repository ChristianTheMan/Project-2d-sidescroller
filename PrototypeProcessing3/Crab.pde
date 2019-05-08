class Crab extends Monster {

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
  


if (crabHidden == true) {
    image(Sand, crab.x, crab.y+5);
  }

  d = dist(player.x, player.y+65, crab.x, crab.y);
  if (d<100) {
    crabHidden =false;
  }


  if (crabHidden == false && death == false) {
    crab.display();

    //Crab movement
    crab.x +=crab.speedX;

    //De 2 tal krabben går imellem er 100-300

    if (crab.x <500 &&  moveRight == true) {
      crab.speedX=2;
    }
    if (crab.x >500) {
      moveRight = false;
      crab.speedX=-2;
    }
    if (crab.x < 200) {
      moveRight = true;
    }
  }
}
}
