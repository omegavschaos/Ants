static float maxSpeed = 5;
static float size = 8;


class Ant{
  PVector acceleration;
  PVector vitesse;
  PVector position;
  
  Ant(float x,float y,float vx, float vy){
    position = new PVector(x,y);
    vitesse = new PVector(vx,vy);
    acceleration = new PVector(0,0);
  }
  
  public PVector virtualPosition(Ant a){
   //*/
   float distance =position.dist(a.position);
   
   PVector virtualPosition = position.get();
   
   PVector pointBis = new PVector(windowSize.x,0);
   float result;
   //*/
   pointBis.add(virtualPosition);
   result = pointBis.dist(a.position);
   if(distance>result){
     virtualPosition = pointBis;
     distance = result;
   }else{
     pointBis = new PVector(-windowSize.x,0);
     pointBis.add(virtualPosition);
     result = pointBis.dist(a.position);
     if(distance>result){
       virtualPosition = pointBis;
       distance = result;
     }
   }
   //*/
  
   pointBis = new PVector(0,windowSize.y);
   pointBis.add(virtualPosition);
   result = pointBis.dist(a.position);
   if(distance>result){
     virtualPosition = pointBis;
   }else{
   pointBis = new PVector(0,-windowSize.y);
     pointBis.add(virtualPosition);
     result = pointBis.dist(a.position);
     if(distance>result){
       virtualPosition = pointBis;
     }
   }
   //*/
//   return position.get();
   return virtualPosition;
 }
  
 public float distance(Ant a){
   return(virtualPosition(a).dist(a.position));
 }
 
 
 private void loopWall(PVector windowBorder){
   if(position.x<0)position.x += windowBorder.x;
   else if(position.x>windowBorder.x) position.x -= windowBorder.x;
   
   if(position.y<0)position.y += windowBorder.y;
   else if(position.y>windowBorder.y) position.y -= windowBorder.y;
   
 }
 
 private void render(){
   PVector direction = vitesse.get();
   direction.normalize();
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
 
 private void move(){
   vitesse.add(acceleration);
   if(vitesse.magSq()>maxSpeed)vitesse.limit(maxSpeed);
   acceleration.mult(0);
   position.add(vitesse);
 }
 
 void run(){
   if(true)
     acceleration.add(new PVector(random(-1,1),random(-1,1)));
   move();
   loopWall(windowSize);
   render();
 }
 
}
