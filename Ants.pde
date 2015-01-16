static PVector windowSize = new PVector(1270,800);
static float deltaTime;

static int backgroundCode = 51;
Nid nid;
FoodFactory foods;



void setup(){
  size((int) windowSize.x,(int) windowSize.y);
  PVector center = windowSize.get();
  center.mult(0.5);
  nid = new Nid(center);
  nid.createAnt(200,center.get());
  foods = new FoodFactory(1000);
  foods.createFood(10);
}

void draw(){
  deltaTime = 1/frameRate;
  background(backgroundCode);
  nid.run();
  foods.run();
}
