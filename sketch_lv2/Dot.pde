class Dot{
  float posX, posY, startX, startY;
  float desX,desY;
  int velX,velY;
  int time;
  int wait;
  float speed;
  Tile t1,t2;
  
  Dot(Tile start, Tile des, int velX, int velY){
    this.startX = start.posX;
    this.posX = start.posX+size/2;
    this.posY = this.startY = start.posY + size/2;
    this.desX = des.posX;
    this.desY = des.posY + size/2;
    this.velX = velX;
    this.velY = velY;
    time = 10;
    wait = -1;
    speed = size/8;
    t1=start;
    t2=des;
  }
  
  void move(){
    if(time < 0 && dist(posX,posY,startX+size/2,startY) < speed){
      time = 10;
      wait = 1;
    }
    if(time < 0 && dist(posX,posY,desX+size/2,desY) < speed){
      time = 10;
      wait = 1;
    }
    if(wait == 0){
      velX*=-1;
      velY*=-1;
    }
    
    posX += velX*speed;
    posY += velY*speed;
    time--;
    wait--;
  }
  
  void show(){
    fill(0,0,255);
    stroke(0);
    strokeWeight(4);
    ellipse(posX,posY,size/2,size/2);
  }
  
  boolean collides(Point ptl, Point pbr){
    Point topLeft = new Point(this.posX-size/4, this.posY-size/4);
    Point bottomRight = new Point(this.posX+size/4, this.posY+size/4);
    float playerSize = bottomRight.x - topLeft.x;
    if((ptl.x < bottomRight.x && pbr.x > topLeft.x) && (ptl.y < bottomRight.y && pbr.y > topLeft.y)){
      if(dist(this.posX, this.posY, (ptl.x+pbr.x)/2.0, (ptl.y+pbr.y)/2.0) < size/4 + sqrt(playerSize*playerSize*2)/2){
        return true;
      }
    }
    return false;
  }
  
  void resetDot(){
    this.posX = this.startX;
    this.posY = this.startY;
    this.time = 10;
    this.wait = -1;
  }
  
  Dot clone(){
    Dot clone = new Dot(this.t1, this.t2, this.velX, this.velY);
    clone.startX = t1.posX;
    clone.posX = t1.posX+size/2;
    clone.posY = clone.startY = t1.posY + size/2;
    clone.desX = t2.posX;
    clone.desY = t2.posY + size/2;
    clone.time = 10;
    clone.wait = -1;
    clone.speed = size/8;
    return clone;
  }
}
