static PVector windowSize = new PVector(1270,800);

static int backgroundCode = 51;
Colonie colonie;


void setup(){
  size((int) windowSize.x,(int) windowSize.y);
  colonie = new Colonie();
  PVector center = windowSize.get();
  center.mult(0.5);
  colonie.createAnt(250,center.get());
  
}

void draw(){
  background(backgroundCode);
  colonie.run();
}
