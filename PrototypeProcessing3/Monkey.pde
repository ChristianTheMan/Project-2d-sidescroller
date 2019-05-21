class Monkey extends Monster {
  PImage Monkey;
  boolean moveUp = true; 
  

  Monkey () {
    x=375;
    y=275;
    width=70;
    height=50;
    speedX=0;
    speedY=0;
  }
  void display() {
    Monkey = loadImage("monkey.png");
    Monkey.resize(width, height);
    image(Monkey, x, y);
  }
  void draw() {
    stone.draw();
     speedY = 1;
     if(y > 100 && moveUp == true){
      y = y - speedY;
      if(y == 100){
      moveUp = false;
      }
     }
     if (y < 275 && moveUp == false){
         y = y + speedY;
         if (y == 275){
         moveUp = true;
         }
     }
        
         
  }
  
}
