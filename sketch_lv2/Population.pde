class Population{
  Player[] players;
  float fitnessSum;
  int gen;
  int bestPlayer;
  int minStep =10000;
  Player[] genPlayers;
  float bestFitness;
  
  Population(int size){
    players = new Player[size];
    fitnessSum = 0.0;
    gen = 1;
    bestPlayer =0;
    minStep = 10000;
    genPlayers = new Player[size];
    bestFitness = 0;
    for(int i=0;i<size;i++)
      players[i] = new Player();
  }
  
  void show(){
    for(int i= players.length-1;i>=0;i--){
      players[i].show();
    }
    
  }
  
  void update(){
    for(int i=0;i<players.length;i++){
      if(players[i].brain.step > minStep){
        players[i].dead = true;
      }else{
        players[i].update();
      }
    }
  }
  
  void calculateFitness(){
    for(int i =0;i<players.length;i++){
      players[i].calculateFitness();
    }
  }
  
  void naturalSelection(){
    Player[] newPlayers = new Player[populationSize];
    setBestPlayer();
    calculateFitnessSum();
    
    newPlayers[0] = players[bestPlayer].giveBaby();
    newPlayers[0].isBest = true;
    for(int i=1;i<populationSize;i++){
      Player parent = selectParent();
      newPlayers[i] = parent.giveBaby();
    }
    
    players = new Player[populationSize];
    for(int i=0;i<newPlayers.length;i++){
      players[i]  = newPlayers[i];
    }
    gen++;
  }
  
  void calculateFitnessSum() {
    this.fitnessSum = 0;
    for (int i = 0; i< players.length; i++) {
      fitnessSum += players[i].fitness;
    }
  }
  
  Player selectParent() {
    float rand = random(this.fitnessSum);


    float runningSum = 0;

    for (int i = 0; i< this.players.length; i++) {
      runningSum+= this.players[i].fitness;
      if (runningSum > rand) {
        return this.players[i];
      }
    }
    return null;
  }
  
  void setBestPlayer() {
    float max = 0;
    int maxIndex = 0;
    for (int i = 0; i< this.players.length; i++) {
      if (this.players[i].fitness > max) {
        max = this.players[i].fitness;
        maxIndex = i;
      }
    }

    this.bestPlayer = maxIndex;

    if (max > this.bestFitness) {
      this.bestFitness = max;
      //this.genPlayers.push(this.players[this.bestPlayer].giveBaby());
    }

    //if this player reached the goal then reset the minimum number of steps it takes to get to the goal
    if (this.players[this.bestPlayer].reachedGoal) {
      this.minStep = this.players[this.bestPlayer].brain.step;
    }
  }
  
  void mutateDemBabies() {
    for (int i = 1; i< this.players.length; i++) {
      this.players[i].brain.mutate(this.players[i].deathByDot, this.players[i].deathAtStep);
      this.players[i].deathByDot = false;
      this.players[i].gen = this.gen;
    }
    this.players[0].deathByDot = false;
    this.players[0].gen = this.gen;
  }
  void increaseMoves() {
    if (this.players[0].brain.directions.size() < 120) {
      for (int i = 0; i< this.players.length; i++) {
        this.players[i].brain.increaseMoves();
      }
    }
  }
  
  boolean allPlayersDead() {
    for (int i = 0; i< this.players.length; i++) {
      if (!this.players[i].dead && !this.players[i].reachedGoal) {
        return false;
      }
    }
    print(gen + "  ");
    return true;
  }
}
