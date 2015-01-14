static PVector windowSize = new PVector(1270,800);
static float deltaTime;

static int backgroundCode = 51;
Colonie colonie;


void setup(){
  size((int) windowSize.x,(int) windowSize.y);
  colonie = new Colonie();
  PVector center = windowSize.get();
  center.mult(0.5);
  colonie.createAnt(100,center.get());
  
}

void draw(){
  deltaTime = 1/(60*frameRate);
  //println(deltaTime);
  //println(frameRate);
  background(backgroundCode);
  colonie.run();
}
