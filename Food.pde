class Food extends GravityEntity{
  int maxQuantity;
  int Quantity;
  
  Food(PVector pos2,int quantity){
    super(pos2);
    maxQuantity = quantity;
    Quantity = quantity;
    champ = size * 2;
  }
  
  
  protected void render(){
    if(Quantity<=0){
      foods.remove(this);
      foods.createFood(1);
    }
    rect(position.x - size,position.y - size,size*2,size*2);
  }
    
}
