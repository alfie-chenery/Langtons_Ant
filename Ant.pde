class Ant{
  int x;
  int y;
  int dir;
  /*dir 0=N
        1=E
        2=S
        3=W
  */
  
  Ant(int X, int Y){
    x = X;
    y = Y;
    dir = startDir;
  }
  
  void move(){
    //set pixel to new colour
    color col = grid.get(x,y);
    int index = -1;
    for(int i=0; i<colours.length; i++){
       if(col == colours[i]){
         index = i; 
       }
    }
    
    //if index is still -1 at this point it means the ant is off the
    //screen because it wasnt able to get the grid colour
    if(index != -1){

    char chr = moveset[index];
      
      grid.set(x,y,colours[(index+1)%colours.length]);
      
      //turn as necessary
      if(chr == 'L'){
        turn(-1);
      }else if(chr == 'R'){
        turn(1);
      //}else if(chr == 'F'){ //do nothing
      }else if(chr == 'B'){
        turn(2);
      }else if(chr == 'N'){
        face(0);
      }else if(chr == 'E'){
        face(1);
      }else if(chr == 'S'){
        face(2);
      }else if(chr == 'W'){    
        face(3);
      }
      
      moveForward();
      
    }else{//ant is offscreen
      noLoop();
    }
  }
  
  void show(){
    fill(antColour);
    rect(x*res,y*res,res,res);
  }
  
  void moveForward(){
    if(dir == 0){//N
      y++;
    }else if(dir == 1){//E
      x++;
    }else if(dir == 2){//S
      y--;
    }else if(dir == 3){//W
      x--;
    }
  }
  
  void turn(int change){
    //+1 for clockwise
    //-1 for anticlockwise
    dir = dir+=change;
    if(dir > 3){
      dir = 0; //4 loops to 0
    }else if(dir < 0){
      dir = 3; //-1 loop to 3
    }
  }
  
  void face(int direction){
    dir = direction; 
  }
}
