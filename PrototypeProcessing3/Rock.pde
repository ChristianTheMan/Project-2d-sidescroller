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
void draw() {
  // rock
  rock.y += rock.speedY;
  if (rock.y >= 325) {
    rock.speedY =0;
    rock.y = 325;
  } else { //item falls to the ground and doesnt fall forever
    rock.speedY = +6;
  }
  /* Equips item ( If the player is close to the stick,
   and presses 'e', the sticks coordinates
   are set to the fit the player)
   */
  if (!rockEquipped && player.x > rock.x-20 && player.x < rock.x +70 && key == 'e') {
    rock.x = player.x + 30;
    rock.y = player.y +30;
    rockEquipped = true;
  }
  //Item stays connected to player
  if (rockEquipped) {
    rock.x = player.x;
    rock.y = player.y+30;
  }
  //Unequip
  if (rockEquipped && key =='o') {
    rockEquipped = false;
  }

  //Attacking (If the stick is equipped, and ' ' is pressed, then stick.x +30)
  rock.x += rock.speedX;
  if (rockEquipped && key == ' ' && atkPressed == true) {
    rock.speedX = +30;
  } else {
    rock.speedX =0;
    atkPressed= false;
  }
  if (rock.x > player.x+60 && rockEquipped==true) {
    rock.speedX = 0;
    rock.x --;
    atkPressed = false;
  }
  if ( rockEquipped == true ){
      
    for (int i = 0 ; i < 15; i++){
      rock.speedX = 0 + i;
      if (key == ' '){
        rockEquipped = false; 
        rock.x = rock.x + rock.speedX;
        if (i == 12 ){
         rock.speedY = 0 ;
       
        }
      }
    }
  }
}
}
