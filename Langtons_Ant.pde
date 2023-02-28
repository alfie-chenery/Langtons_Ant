//import java.lang.*;

PImage grid;
int res = 10;
int iteration = 0;
int displayPer = 10;
int maxIteration = -1; //-1 for no limit
int startDir = 2; //0-3 = N-W
boolean showAnt = true;


//Set moveset and colour inside moveset file

Ant ant;

void setup(){
  //size(800,800);
  fullScreen();
  grid = createImage(floor(width/res),floor(height/res),RGB);
  grid.loadPixels();
  for(int i=0; i<grid.pixels.length; i++){
    grid.pixels[i] = colours[0];
  }
  strokeWeight(1);
  stroke(69); //grey
  
  ant = new Ant(grid.width/2,grid.height/2);
}

void draw(){
    
  for(int i=0; i<displayPer; i++){
    ant.move(); 
  }
  display();
  
  if(maxIteration != -1){
    if(iteration >= maxIteration){
      println("Done simulating");
      noLoop(); 
    }
    iteration += displayPer;
  }
}


void display(){
  //draw grid
  for (int x=0; x < grid.width; x++){
    for (int y=0; y < grid.height; y++){
      color c = grid.pixels[x + grid.width*y];
      fill(c);
      rect(x*res,y*res,res,res);
    } 
  }
  
  if(showAnt){
    //draw ant
    ant.show();
  }
}
