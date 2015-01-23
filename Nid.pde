class Nid extends GravityEntity {
  int food;
  ArrayList<Ant> colonie;
  
  Nid(PVector pos2){
    super(pos2);
    colonie = new ArrayList<Ant>();
    size = 3*size;
    champ = 1000;
  }
  
  void createAnt(int number,PVector position){
    for(int i =0;i<number;i++){
      colonie.add(new Ant(position.get(),new PVector(0,0),this));
    }
  }
  
  void run(){
   for(Ant a : colonie){
     for(Pheromone p:(ArrayList<Pheromone>) a.Pheromones.clone()){
       p.run();
     }
   }
   for(Ant a : colonie){
     a.run();
   }
   render();
  }
  
  void render(){
    fill(0,100,0);
    triangle(position.x-size,position.y-size,position.x+size,position.y-size, position.x,position.y+size);
    fill(255);
  }
}

