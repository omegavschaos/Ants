class Pheromone extends Entity{
  final float fullLife = 100;
  float life;
  
  Ant Parent;
  
  Pheromone(Ant parent){
    super(parent.position);
    Parent = parent;
    life = fullLife;
    size = size * 10;
  }
  
  protected void render(){
    super.render();
    fill(200,life/fullLife);
    ellipse(position.x,position.y,size,size);
  }
  
  public void run(){
    if(life>0){
      life=-deltaTime;
      render();
    }
  }
}
