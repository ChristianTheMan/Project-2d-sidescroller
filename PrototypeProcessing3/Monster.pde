class Monster {
  int x,y;
  int wide = 80;
  int high = 100;
  int hp;
  int speedY;
  int speedX;
  PImage myImage; 
  
  
  Monster(){
    x = 600;
    y = 300;
    hp = 100;
  }
  
  Monster(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  Monster(String imageFilename){
    myImage = loadImage(imageFilename);
  }
  
  void display(){
    myImage.resize(wide,high);
    image(myImage,x,y);  
  }
  
  void setXY(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  
  
}
