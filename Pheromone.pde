class Pheromone extends GravityEntity{
  final float fullLife = 10;
  float life;
  
  Ant Parent;
  
  Pheromone(Ant parent){
    super(parent.position.get());
    Parent = parent;
    life = fullLife;
    size = size*4;
    champ = size*2;
    attractStrength=0.3;
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
    noFill();
    stroke(blue(200));
    super.render();
    stroke(0);
    fill(255);
    //*/
  }
}
