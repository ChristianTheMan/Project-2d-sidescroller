class Stone {

  int y ;
  int x ;
  int width; 
  int sy;
  int sx; 
  int dmg;
  Stone() {
    
    width = 10; 
    sy = 1;
    sx = 1; 
    dmg = 10;
    y = monkey.y + 40;
    x = monkey.x +10;
  }
  void draw() {
    float d = dist(monkey.x, monkey.y, player.x,player.y); 

    fill(255, 0, 0);
    ellipse(x, y, width, width);
  
     if ( d < 150){
            stone.x = stone.x - stone.sx;
         }
         println(d);
       }
}
