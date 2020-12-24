Tile[][] tiles;
int size = 50;
int xoff = 80;
int yoff = 100;
Dot[] dots;

float mutationRate = 0.01;
int increaseMovesBy =5;
int numberOfSteps = 10;
int populationSize = 500;

Population testPopulation;

boolean up = false;
boolean down = false;
boolean right = false;
boolean left = false;
boolean human = false;

Player p;
ArrayList<Solid> solids;

Setting setting;

void setup(){
  size(1280,720);
  background(255);
  frameRate(60);
  solids = new ArrayList<Solid>();
  tiles = new Tile[23][11];
  for(int i = 0; i < 22; i++){
    for(int j = 0; j< 10; j++){
      tiles[i][j] = new Tile(i,j);
    }
  }
  dots = new Dot[12];
  setting = new Setting();
  setting.setLv2Walls();
  setting.setLv2Goal();
  setting.setLv2SafeZone();
  setting.setEdges();
  setting.setDots();
  setting.setSolids();
  p = new Player();
  testPopulation = new Population(populationSize);
}

void draw(){
  for(int i=0;i < 22 ;i++){
    for(int j =0; j< 10; j++){
      tiles[i][j].show();
    }
  }
  for(int i=0;i < 22 ;i++){
    for(int j =0; j< 10; j++){
      tiles[i][j].showEdges();
    }
  }
  if(human == true){
    for(int i=0;i<dots.length;i++){
      dots[i].move();
      dots[i].show();
    }
    p.human = true;
    p.show();
    p.move();
    p.checkCollisions();
    if(p.dead || p.isWin(tiles[17][4]) || p.isWin(tiles[17][4])){
       p =new Player();
       p.human = true;
    }
  }
  else if (testPopulation.allPlayersDead()) {
       testPopulation.calculateFitness();
       testPopulation.naturalSelection();
       testPopulation.mutateDemBabies();
      setting.setDots();

       if (testPopulation.gen % 5 ==0) {
         testPopulation.increaseMoves();
       }

     } else {

       for(int j = 0 ; j< 1; j++){
         for (int i = 0; i < dots.length; i ++) {
           dots[i].move();
         }
         testPopulation.update();
       }

       for (int i = 0; i < dots.length; i ++) {
         dots[i].show();
       }
       testPopulation.show();
     }
}

void keyPressed(){
  switch(keyCode){
    case UP:
      up=true;
      break;
    case DOWN:
      down=true;
      break;
    case RIGHT:
      right=true;
      break;
    case LEFT:
      left=true;
      break;
  }
  setPlayerVel();
}

void keyReleased(){
  switch(keyCode){
    case UP:
      up=false;
      break;
    case DOWN:
      down=false;
      break;
    case RIGHT:
      right=false;
      break;
    case LEFT:
      left=false;
      break;
  }
  setPlayerVel();
}

void setPlayerVel(){
  p.vel.x=0;
  p.vel.y=0;
  if(up) p.vel.y=-1;
  if(down) p.vel.y=1;
  if(right) p.vel.x=1;
  if(left) p.vel.x=-1;
}
