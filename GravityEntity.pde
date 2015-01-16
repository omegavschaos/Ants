class GravityEntity extends Entity{
    float attractStrength = 1;
    float champ = size;
    GravityEntity(PVector pos2){
      super(pos2);
    }
    
    
  public void attract(Movable mov,float attractStrength){
    //*/
     PVector temp = virtualPosition(mov);
     temp.sub(mov.position);
     temp.normalize();
     temp.mult(attractStrength);
     mov.acceleration.add(temp);
  //*/
  }
  
  
}
