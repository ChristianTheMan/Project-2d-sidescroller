class Monster {
  int x, y;
  int width = 80;
  int height = 100;
  int hp;
  int speedY;
  int speedX;
  int dmg;
  PImage myImage;



  Monster() {
    x = 600;
    y = 300;
    hp = 100;
  }



  Monster(String imageFilename) {
    myImage = loadImage(imageFilename);
  }

  void display() {
    myImage.resize(width, height);
    image(myImage, x, y);
  }

  void setXY(int _x, int _y) {
    x = _x;
    y = _y;
  }
}
