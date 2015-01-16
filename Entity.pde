

class Entity{
  float size = 8;
  
  PVector position;
  Entity(PVector pos2){
    position = pos2;
  }
  
  public boolean isOn(Entity ent){
    return(distance(ent)< size + ent.size);
  }
  
  public boolean isAttract(GravityEntity ge){
    return(distance(ge)< ge.champ);
  }
  
  public PVector virtualPosition(Entity entity){
   //*/
   float distance =position.dist(entity.position);
   
   PVector virtualPosition = position.get();
   
   PVector pointBis = new PVector(windowSize.x,0);
   float result;
   //*/
   pointBis.add(virtualPosition);
   result = pointBis.dist(entity.position);
   if(distance>result){
     virtualPosition = pointBis;
     distance = result;
   }else{
     pointBis = new PVector(-windowSize.x,0);
     pointBis.add(virtualPosition);
     result = pointBis.dist(entity.position);
     if(distance>result){
       virtualPosition = pointBis;
       distance = result;
     }
   }
   //*/
  
   pointBis = new PVector(0,windowSize.y);
   pointBis.add(virtualPosition);
   result = pointBis.dist(entity.position);
   if(distance>result){
     virtualPosition = pointBis;
   }else{
   pointBis = new PVector(0,-windowSize.y);
     pointBis.add(virtualPosition);
     result = pointBis.dist(entity.position);
     if(distance>result){
       virtualPosition = pointBis;
     }
   }
   //*/
//   return position.get();
   return virtualPosition;
 }
 
 public float distance(Entity entity){
   return(virtualPosition(entity).dist(entity.position));
 }
 
 protected void render(){
 }
}
