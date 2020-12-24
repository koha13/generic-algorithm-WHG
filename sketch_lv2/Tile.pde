class Tile{
  int x,y;
  boolean wall = false;
  boolean safezone = false;
  boolean goal = false;
  int posX, posY;
  IntList edges = new IntList();
  
  Tile(int x, int y){
    this.x = x;
    this.y = y;
    this.posX = x*size + xoff;
    this.posY = y*size + yoff;
  }
  
  void show(){
    if((this.x + this.y) % 2 == 0){
      fill(247,247,255);
    } else{
      fill(230,230,255);
    }
    if(this.wall){
      fill(180,181,254);
    }
    if (this.goal || this.safezone) {
      fill(181, 254, 180);
    }
    noStroke();
    rect(this.posX,this.posY,size,size);
  }
  
  void showEdges(){
    for(int i = 0; i < edges.size(); i++){
      stroke(0);
      strokeWeight(4);
      switch(this.edges.get(i)){
        case 4:
          line(this.posX, this.posY, this.posX + size, this.posY);
          break;
        case 3:
          line(this.posX, this.posY, this.posX, this.posY + size);
          break;
        case 1:
          line(this.posX + size, this.posY, this.posX + size, this.posY + size);
          break;
        case 2:
          line(this.posX, this.posY + size, this.posX + size, this.posY + size);
          break;
      }
    }
  }
}
