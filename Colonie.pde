class Colonie extends ArrayList<Ant>{
  
  void createAnt(int number,PVector position){
    for(int i =0;i<number;i++){
      this.add(new Ant(position.get(),new PVector(0,0),position));
    }
  }
  
  void run(){
    for(Ant a : this){
      a.run();
    }
  }
}

