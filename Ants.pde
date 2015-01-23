static PVector windowSize = new PVector(1270,800);
static float deltaTime;

static int backgroundCode = 51;
Nid nid;
FoodFactory foods;
boolean RenderPheromone;


void setup(){
  size((int) windowSize.x,(int) windowSize.y);
  PVector center = windowSize.get();
  center.mult(0.5);
  nid = new Nid(center);
  nid.createAnt(100,center.get());
  foods = new FoodFactory(10000);
  foods.createFood(10);
}

void draw(){
  deltaTime = RenderPheromone?1/30f:1/frameRate;
  background(backgroundCode);
  drawRenderMode();
  foods.run();
  nid.run();
}

void drawRenderMode(){
  textSize(32);  
  String msg = "Le rendu des phéromones est ";
  if(RenderPheromone){
    fill(0,200,0);
    msg += "activé";
  }else{
    fill(200,0,0);
    msg += "désactivé";
  }
  text(msg, 10, 30);
  fill(255);
}

void keyPressed() {
  if (keyPressed) {
    if (key == 'y' || key == 'Y') {
      RenderPheromone = true;
    }else if (key == 'n' || key == 'N'){
      RenderPheromone = false;
    }else if (key == ' '){
      RenderPheromone = !RenderPheromone;
    }
  }
}
