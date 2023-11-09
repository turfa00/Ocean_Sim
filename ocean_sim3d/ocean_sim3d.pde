int N = 60;
int Radius = 10;
float move, randomForce;
float theta = 0.0;
float startTime, timeStep;
boolean keyPress = false;
import peasy.*;
PeasyCam cam;
Height_field heightField;
Force forceQuad = new Force(0, 0, Radius);

void setup(){
  //fullScreen(P3D);
  size(1000, 800, P3D);
  frameRate(60);
  pixelDensity(2);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000);
  heightField = new Height_field();
  forceQuad = new Force(0, 0, Radius);
  for(int i = 0; i < N; i++){
    for(int j = 0; j < N; j++){
      Particle p = new Particle(i, j, 0, Radius, random(1,15));
      heightField.Particles[i][j] = p;
      //heightField.Particles.add(new Particle(i, j, 0, Radius));
    } 
  }
  startTime = millis();
}


void draw(){
  background(0);
  lights();
  //heightField.waveTest1();
  heightField.waveTest2();
  //heightField.waveTest3();
  //heightField.waveTest4();
  heightField.drawField();
  //heightField.drawFieldPoints();
  forceQuad.drawF();
  keyPressed();
  timeStep = (millis() - timeStep) / 1000;
}

public float rectangleFunction(float u){
    float x = 0.0;
    if(abs(u) > 0.5)
      x = 0;
    if(abs(u) == 0.5)
      x = 0.5;
    if(abs(u) < 0.5)
      x = 1;
    return x;
}
