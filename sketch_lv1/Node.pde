class Node{
  boolean touch;
  float distance;
  Point pos;
  int w;
  int h;
  Point bottomRight;
  
  Node(Tile nodeTile){
    touch = false;
    distance = 0;
    pos= new Point(nodeTile.posX, nodeTile.posY);
    w = 50;
    h = 50;
    bottomRight = new Point(nodeTile.posX + w, nodeTile.posY + h);
  }
  
  boolean collision(Point ptl, Point pbr){ //player dimensions
    if ((ptl.x <this.bottomRight.x && pbr.x > this.pos.x) &&( ptl.y < this.bottomRight.y && pbr.y > this.pos.y)) {
      this.touch = true;
      return true;
    }else if(pbr.x < this.pos.x){
      this.touch = false;

    }
    return false;
  }
  
  void setDistanceToFinish(Node n){
    distance = n.distance + dist(this.pos.x, this.pos.y, n.pos.x, n.pos.y);
  }
}
