class Rock {
  int x;
  int y;
  int w;
  int speedX;
  int speedY;
  int life = 255;
  boolean rocksVisible = false;
  
  Rock(){
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

  
  void display(){
    fill(200);
    noStroke();
    ellipse(x,y,w,w);
}
}
