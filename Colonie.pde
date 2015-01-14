class Colonie extends ArrayList<Ant>{
  
  void createAnt(int number,PVector position){
    for(int i =0;i<number;i++){
      this.add(new Ant(position.x,position.y,random(-maxSpeed,maxSpeed),random(-maxSpeed,maxSpeed)));
    }
  }
  
  void run(){
    for(Ant a : this){
      a.run();
    }
  }
}

