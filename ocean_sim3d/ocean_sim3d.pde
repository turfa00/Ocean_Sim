int N = 60;
int nbWaves = 5;
int Radius = 60;
int minAmplitude = 5, maxAmplitude = 15;
float move, randomForce;
float wave;
int [] randomPos = new int[nbWaves*2];
float waveIntensity = 0.08;
float zCoefficient = 0.4;
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
  cam.setMinimumDistance(-20000);
  cam.setMaximumDistance(200000000);
  heightField = new Height_field();
  forceQuad = new Force(0, 0, Radius);
  for(int i = 0; i < N; i++){
    for(int j = 0; j < N; j++){
      //Tout les particules ont le même rayon
      Particle p = new Particle(i, j, random(-1, 1), Radius, random(minAmplitude,maxAmplitude));
      heightField.Particles[i][j] = p;
    } 
  }
  for(int i = 0; i < nbWaves*2; i++){
    //Créer des positions aléatoires où les vagues seront créer
    randomPos[i] = int(random(0,N));
  }
  startTime = millis();
}


void draw(){
  background(0);
  lights();
  directionalLight(126, 126, 126, 0, 0.5, -1);
  heightField.waveSimulation();
  heightField.drawField();
  //heightField.drawFieldPoints();
  forceQuad.drawQuad();
  keyPressed();
  timeStep = (millis() - timeStep) / 1000;
}
