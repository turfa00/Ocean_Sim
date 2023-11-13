int N = 60;
int NbWaves = 1;
int Radius = 40;
int minAmplitude = 5, maxAmplitude = 15;
float move, randomForce;
float theta = 0.0;
float startTime, timeStep, timeStepForce;
boolean keyPress = false;
import peasy.*;
PeasyCam cam;
Height_field heightField;
Force forceQuad = new Force(0, 0, Radius);

void setup(){
  fullScreen(P3D);
  //size(1000, 800, P3D);
  frameRate(60);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(-2000);
  cam.setMaximumDistance(20000000);
  heightField = new Height_field();
  forceQuad = new Force(0, 0, Radius);
  for(int i = 0; i < N; i++){
    for(int j = 0; j < N; j++){
      Particle p = new Particle(i, j, 0, Radius, random(minAmplitude,maxAmplitude));
      heightField.Particles[i][j] = p;
      //heightField.Particles.add(new Particle(i, j, 0, Radius));
    } 
  }
  startTime = millis();
}


void draw(){
  background(0);
  lights();
  directionalLight(126, 126, 126, 0, 0.5, -1);
  //heightField.waveTest2();
  heightField.waveTest3();
  heightField.drawField();
  //heightField.drawFieldPoints();
  forceQuad.drawF();
  keyPressed();
  timeStep = (millis() - timeStep) / 1000;
}
public float rectangleFunction(float t, float a){
    float v = 0;
    if(abs(t) > a/2)
      v = 0;
    if(abs(t) == a/2)
      v = 0.5;
    if(abs(t) < a/2)
      v = 1;
    return v;
}
