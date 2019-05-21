class Player {

  boolean h0Display = true;
  boolean h1Display = true;
  boolean h2Display = true;
  int x, y, w, h, hp;


  Player() {
    x= 100;
    y=250;
    w=30;
    h=70;
    hp=30;
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
    void heart() {
    
   

    Heart[0].resize(40, 30);
    Heart[1].resize(40, 30);
    Heart[2].resize(40, 30);
    
    if(h0Display ==true){
    image(Heart[0], player.x, 10);
    }
    if(h1Display ==true){
    image(Heart[1], player.x+40, 10);
    }
    if(h2Display ==true){
    image(Heart[2], player.x +80, 10); 
    }
    
    if(player.hp < 21){
    h2Display = false;
    }
    if(player.hp < 11){
    h1Display = false;
    }
    if(player.hp <= 0){
    h0Display = false;
    println("DEATH");
    }

    
      }
}
