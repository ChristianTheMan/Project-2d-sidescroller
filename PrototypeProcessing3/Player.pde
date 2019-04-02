class Player {
  int x, y, w, h;


  Player() {
    x= 100;
    y=250;
    w=30;
    h=70;
  }

  Player(int _x, int _y, int _w, int _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }

  void display() {
    fill(255);
    rect(x, y, w, h);
  }
}
