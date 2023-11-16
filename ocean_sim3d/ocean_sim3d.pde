int N = 60;
int nbWaves = 5;
int Radius = 60;
int minAmplitude = 5, maxAmplitude = 15;
float move, randomForce;
float wave;
int [] randomPos = new int[nbWaves*2];
float waveAmplitudeCoefficient = 0.05;
float zCoefficient = 0.4;
float [][] waveTypes = new float [4][4];
float startTime, timeStep, timeStepForce;
boolean keyPress = false;
import peasy.*;
PeasyCam cam;
Height_field heightField;
Force forceQuad = new Force(0, 0, Radius);

void setup(){
  //fullScreen(P3D);
  size(1000, 800, P3D);
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
  for(int i = 0; i < nbWaves*2; i++){
    randomPos[i] = int(random(0,N));
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
