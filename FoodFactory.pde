class FoodFactory extends ArrayList<Food>{
  int maxQuantity;
  
  FoodFactory(int quantity){
    super();
    maxQuantity = quantity;
  }
  void createFood(int number){
    for(int i =0;i<number;i++){
      this.add(new Food(new PVector(random(10,width-10),random(10,height-10)),(int)random(1,maxQuantity)));
    }
  }
  void run(){
    for(Food food: (FoodFactory) this.clone() ){
      food.render();
    }
  }
}
