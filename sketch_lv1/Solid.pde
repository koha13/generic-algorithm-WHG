class Solid{
  int lineWidth;
  Point pos;
  int w;
  int h;
  Point bottomRight;
  
  Solid(Tile tileTopLeft, Tile tileBotRight){
    lineWidth=1;
    this.pos = new Point(tileTopLeft.posX + lineWidth, tileTopLeft.posY + lineWidth);
    this.w = tileBotRight.posX + size - tileTopLeft.posX;
    this.h = tileBotRight.posY + size - tileTopLeft.posY;
    this.bottomRight = new Point(this.pos.x + this.w, this.pos.y + this.h);
  }
  
  PVector restrictMovement(Point tl, Point br, Point currentVel){
    float x = currentVel.x, y = currentVel.y;
    Point playerTopLeft = new Point(tl.x + x, tl.y);
    Point playerBotRight = new Point(br.x + x, br.y);
    
    if((playerTopLeft.x < this.bottomRight.x && playerBotRight.x > this.pos.x) && (playerTopLeft.y < this.bottomRight.y && playerBotRight.y > this.pos.y)){
      x=0;
    }
    
    playerTopLeft = new Point(tl.x, tl.y + y);
    playerBotRight = new Point(br.x, br.y + y);
    
    if((playerTopLeft.x < this.bottomRight.x && playerBotRight.x > this.pos.x) && (playerTopLeft.y < this.bottomRight.y && playerBotRight.y > this.pos.y)){
      y=0;
    }
    
    return new PVector(x,y);
  }
  
  boolean collision(Point ptl, Point pbr){
    if ((ptl.x <this.bottomRight.x && pbr.x > this.pos.x) &&( ptl.y < this.bottomRight.y && pbr.y > this.pos.y)) {
      return true;
    }
    return false;
  }
}
