class Ant extends Movable{
  final float maxCountdownPheromone = 0.5;
  final int maxFood=10;
  float countdownPheromone;
  ArrayList<Pheromone> Pheromones;
  Nid nid;
  int food;
  
  Ant(PVector pos2,PVector vit2,Nid nid){
    super(pos2,vit2);
    this.nid = nid;
    countdownPheromone = 0;
    Pheromones = new ArrayList<Pheromone>();
    food = 0;
  }

 void run(){
   if(isEmpty()){
     searchFood();
     if(isEmpty()){
       randomMove();
     }
   }else{
     createPheromone();
     goBack();
   }
   
   if(countdownPheromone>0)
     countdownPheromone-=deltaTime;
   
   
   for(Pheromone p:(ArrayList<Pheromone>) Pheromones.clone()){
     p.run();
   }
   
   super.run();
 }
 
 boolean isEmpty(){
   return(food==0);
 }
 
 void goBack(){
   if(isOn(nid))
     give();
   else
     goTo(this.nid.position);
 }
 
 void searchFood(){
   for(Ant ant:nid.colonie){
     for(Pheromone phe:ant.Pheromones){
       if(isAttract(phe))
          phe.attract(this,phe.attractStrength);
     }
   }
      
   for(Food food:foods){
     if(isAttract(food)){
       food.attract(this,food.attractStrength);
       if(isOn(food)){
         take(food);
       }
     }
   }
 }
 
 void take(Food food){
   int foodQuantity = min(food.Quantity,maxFood-this.food);
   food.Quantity-=foodQuantity;
   this.food += foodQuantity;
 }
 
 void give(){
   this.nid.food += this.food;
   this.food = 0;
 }
 
 void createPheromone(){
   if(countdownPheromone<=0){
     Pheromones.add(new Pheromone(this));
     countdownPheromone=maxCountdownPheromone;
   }
 }
 
 protected void render(){
   super.render();
   if(!isEmpty())
     fill(red(255));
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
   fill(255);
 }
 
}
