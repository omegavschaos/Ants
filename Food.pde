class Food extends GravityEntity{
  int maxQuantity;
  int Quantity;
  
  Food(PVector pos2,int quantity){
    super(pos2);
    maxQuantity = quantity;
    Quantity = quantity;
    attractStrength = quantity*100;
    champ = size*3;
  }
  
  
  public void render(){
    if(Quantity<=0){
      foods.remove(this);
      foods.createFood(1);
    }
    
    noFill();
    stroke(0,0,100);
    super.render();
    stroke(0);
    fill(88, 41, 0);
    rect(position.x - size/2,position.y - size/2,size,size);
    fill(255);
  }
    
}
