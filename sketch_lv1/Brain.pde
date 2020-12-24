class Brain{
  ArrayList<Point> directions;
  int step;
  
  Brain(int size){
    directions = new ArrayList<Point>();
    step = 0;
    randomize(size);
  }
  
  void randomize(int size){
    for(int i = 0 ; i < size ; i++)
      directions.add(getRandom()) ;
  }
  
  Point getRandom(){
    int randomNumber = (int)random(9);
    switch(randomNumber) {
    case 0:
      return new Point(0, 1);
    case 1:
      return new Point(1, 1);
    case 2:
      return new Point(1, 0);
    case 3:
      return new Point(1, -1);
    case 4:
      return new Point(0, -1);
    case 5:
      return new Point(-1, -1);
    case 6:
      return new Point(-1, 0);
    case 7:
      return new Point(-1, 1);
    case 8:
      return new Point(0, 0);
    }
    return new Point(-2,-2);
  }
  
  Brain clone(){
    Brain clone = new Brain(directions.size());
    for(int i=0; i<directions.size();i++){
      clone.directions.set(i,directions.get(i));
    }
    return clone;
  }
  
  void mutate(boolean died, int deathStep){
    for(int i=0;i<directions.size();i++){
      float ran = random(1);
      if(died && i>deathStep-10){
        ran = random(0.2);
      }
      
      if(ran<mutationRate){
        directions.set(i,getRandom());
      }
    }
  }
  
  void increaseMoves(){
    for(int i=0;i<increaseMovesBy;i++){
      directions.add(getRandom());
    }
  }
}
