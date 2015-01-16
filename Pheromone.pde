class Pheromone extends GravityEntity{
  final float fullLife = 3;
  float life;
  
  Ant Parent;
  
  Pheromone(Ant parent){
    super(parent.position.get());
    Parent = parent;
    life = fullLife;
    size = size * 8;
    champ = size;
  }
  
  public void run(){
    
    if(life>0){
      
      life-=deltaTime;
      render();
    }else{
      Parent.Pheromones.remove(this);
    }
  }
  
  void render(){
    super.render();
    noFill();
    ellipse(position.x,position.y, size,size);
    fill(255);
  }
}
