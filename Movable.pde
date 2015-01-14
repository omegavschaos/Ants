class Movable extends Entity{
  final float maxSpeed = 10;
  
  PVector acceleration;
  PVector vitesse;
  
  Movable(PVector pos2,PVector vit2){
    super(pos2);    
    vitesse = vit2;
    acceleration = new PVector(0,0);
  }
  
  public PVector getDirection(){
   PVector direction = vitesse.get();
   direction.normalize();
   return(direction);
  }
  
  protected void loopWall(PVector windowBorder){
   if(position.x<0)position.x += windowBorder.x;
   else if(position.x>windowBorder.x) position.x -= windowBorder.x;
   
   if(position.y<0)position.y += windowBorder.y;
   else if(position.y>windowBorder.y) position.y -= windowBorder.y;
 }
 
 private void move(){
   vitesse.add(acceleration);
   if(vitesse.magSq()>maxSpeed)vitesse.limit(maxSpeed);
   acceleration.mult(0);
   position.add(vitesse);
   loopWall(windowSize);
 }
 
 protected void render(){
   super.render();
 }
 
 public void run(){
   move();
   render();
 }
}
