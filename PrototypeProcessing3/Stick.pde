class Stick {
 int x, y, w, h, dmg;



  Stick() {
    x= 250;
    y=320;
    w=70;
    h=5;
    dmg=25;
  }

  Stick(int _x, int _y, int _w, int _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }


  void display() {
    fill(0, 255, 0);
    rect(x, y, w, h);
  }
}
