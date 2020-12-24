class Player{
  Point pos;
  Point vel;
  int size;
  float speed;
  boolean dead;
  boolean reachedGoal;
  int fadeCounter = 255;
  boolean isBest;
  boolean deathByDot;
  int deathAtStep;
  int moveCount;
  int gen;
  float fitness;
  ArrayList<Node> nodes;
  Brain brain;
  boolean human;
  boolean fading;
  
  Player(){
    this.pos = new Point(3*50 + xoff, 4*50+yoff+15);
    this.vel = new Point(0,0);
    this.size = 25;
    this.speed = (float)50/15;
    this.dead = false;
    reachedGoal = false;
    isBest = false;
    deathByDot = false;
    deathAtStep = 0;
    moveCount = 0;
    gen = 1;
    fitness = 0;
    fading = false;
    nodes = new ArrayList<Node>();
    brain = new Brain(numberOfSteps);
    setNodes();
    human = false;
  }
  
  void setNodes(){
    nodes.add(new Node(tiles[6][7]));
    nodes.add(new Node(tiles[17][2]));
    nodes.get(0).setDistanceToFinish(nodes.get(1));
  }
  
  void show(){
    fill(255,0,0,fadeCounter);
    if(isBest)
      fill(0,255,0,fadeCounter);
    stroke(0,0,0,fadeCounter);
    strokeWeight(4);
    rect(this.pos.x, this.pos.y, this.size, this.size);
    stroke(0);
  }
  
  void move(){
    if(!human){
      if(moveCount == 0){
        if(brain.directions.size() > brain.step){
          vel = brain.directions.get(brain.step);
          brain.step++;
        }else{
          dead = true;
          fading = true;
        }
        moveCount = 6;
      }else{
        moveCount--;
      }
    }
    PVector temp = new PVector(this.vel.x, this.vel.y);
    temp.normalize();
    temp.mult(this.speed);
    for(int i =0 ; i<solids.size(); i++){
      Point p = new Point(temp.x,temp.y);
      Point t = new Point(this.pos.x+this.size,this.pos.y+ this.size);
      temp = solids.get(i).restrictMovement(this.pos, t,p);
    }
    //Point temp = new Point(this.vel.x*this.speed, this.vel.y*this.speed);
    this.pos.x+=temp.x;
    this.pos.y+=temp.y;
  }
  
  void checkCollisions(){
    for(int i=0;i<dots.length;i++){
      if(dots[i].collides(this.pos, new Point(this.pos.x+this.size,this.pos.y+this.size))){
        this.dead = true;
        fading = true;
        deathByDot = true;
        deathAtStep = brain.step;
      } 
    }
    if(isWin(tiles[17][2])) reachedGoal = true;
    for(int i=0;i<nodes.size();i++){
      nodes.get(i).collision(pos, new Point(pos.x+size,pos.y+size));
    }
  }
  
  void update(){
    if(!dead && !reachedGoal){
      move();
      checkCollisions();
    }else if(fading){
      if(fadeCounter >0){
        if(human){
          fadeCounter -=10;
        }else{
          fadeCounter =0;
        }
      }
    }
  }
  
  void calculateFitness(){
    if(reachedGoal){
      fitness = 1.0/16.0 + 10000.0/(brain.step * brain.step);
    }else{
      float estimatedDistance =0;
      for(int i=nodes.size()-1;i>=0;i--){
        if(!nodes.get(i).touch){
          estimatedDistance = nodes.get(i).distance;
          estimatedDistance += dist(pos.x, pos.y, nodes.get(i).pos.x, nodes.get(i).pos.y);
        }
      }
      if(deathByDot){
        estimatedDistance *=0.9;
      }
      fitness = 1.0/(estimatedDistance * estimatedDistance);
    }
    fitness*=fitness;
  }
  
  boolean isWin(Tile t){
    Point botRight = new Point(this.pos.x + this.size, this.pos.y + this.size);
    if(botRight.x >= t.posX && botRight.x <= t.posX + 50 && botRight.y >= t.posY)
      return true;
    return false;
  }
  
  Player giveBaby(){
    Player baby = new Player();
    baby.brain = brain.clone();
    baby.deathByDot = deathByDot;
    baby.deathAtStep = deathAtStep;
    baby.gen = gen;
    return baby;
  }
}
