class Movable extends Entity{
  final float maxSpeed = height*width * size;
  final float maxAccel = maxSpeed/10;
  
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
  
  protected void loopWall(){
   if(position.x<0)position.x += width;
   else if(position.x>width) position.x -= width;
   
   if(position.y<0)position.y += height;
   else if(position.y>height) position.y -= height;
 }
 
 private void move(){
   vitesse.add(acceleration);
   if(vitesse.magSq()>maxSpeed)vitesse.limit(maxSpeed);
   acceleration.mult(0);
   PVector trueSpeed = vitesse.get();
   trueSpeed.mult(deltaTime);
   position.add(trueSpeed);
   loopWall();
 }
 
 protected void render(){
   super.render();
 }
 
 public void run(){
   move();
   render();
 }
}
