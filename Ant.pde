class Ant extends Movable{
  final float maxCountdownPheromone = 10;
  float countdownPheromone;
  ArrayList<Pheromone> Pheromones;
  PVector nid;
  
  Ant(PVector pos2,PVector vit2,PVector nid){
    super(pos2,vit2);
    this.nid = nid;
    countdownPheromone = 0;
    Pheromones = new ArrayList<Pheromone>();
  }

 void run(){
   if(true){
     PVector randomAccel = new PVector(random(-1,1),random(-1,1));
     randomAccel.mult(maxAccel*deltaTime);
     acceleration.add(randomAccel);
   }
   if(countdownPheromone>0)
     countdownPheromone=-deltaTime;
   super.run();
 }
 
 void createPheromone(){
   if(countdownPheromone<=0){
     new Pheromone(this);
     countdownPheromone=maxCountdownPheromone;
   }
 }
 
 protected void render(){
   super.render();
   PVector direction = getDirection();
   direction.mult(size);
   PVector pointe = position.get();
   pointe.add(direction);
   PVector directionOrtho = new PVector(-direction.y, direction.x);
   directionOrtho.normalize();
   PVector aile = position.get();
   direction.mult(-1);
   aile.add(direction);
   PVector plop = directionOrtho.get();
   plop.mult(size);
   PVector aile2 = aile.get();
   aile.add(plop);
   plop.mult(-1);
   aile2.add(plop);
   triangle(pointe.x,pointe.y,aile.x,aile.y,position.x,position.y);
   triangle(pointe.x,pointe.y,aile2.x,aile2.y,position.x,position.y);
 }
 
}
