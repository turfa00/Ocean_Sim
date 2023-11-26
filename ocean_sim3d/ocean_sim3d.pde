int N = 80; //Nombre de particules = (N-1)^2
int nbWaves = 10; //Nombres de vagues qui seront générer aléatoirement sur la surface
int Radius = 60; //Rayon de chaque particule
int minAmplitude = 0, maxAmplitude = 20; //Valeurs minimal et maximal de l'amplitude que peut avoir une vague au création
float move, boxWaveIntensity; //Mouvement du boite
int [] randomPos = new int[nbWaves*2];
float waveIntensity = 0.08; //Valeur pour régler l'intensite de vagues
float maxDistance = sqrt(2 * (N * N)); //Distance maximale du point (0,0) jusqu'a (N,N)
float zCoefficient = 0.4; //Valeur pour régler la hauteur de la surface
float startTime, timeStep, timeStepForce; //Valeurs de temps
boolean keyPress = false;
import peasy.*;
PeasyCam cam;
Height_field heightField;
Box box;

void setup(){
  fullScreen(P3D);
  //size(1000, 900, P3D);
  frameRate(60);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(-20000);
  cam.setMaximumDistance(200000000);
  heightField = new Height_field();
  //Géneration de tout particules
  for(int i = 0; i < N; i++){
    for(int j = 0; j < N; j++){
      //Tout les particules ont le même rayon pour une meilleure simulation
      Particle p = new Particle(i, j, random(-1, 1), Radius, random(minAmplitude,maxAmplitude));
      heightField.Particles[i][j] = p;
    } 
  }
  box = new Box(0, 0, Radius, heightField);
  for(int i = 0; i < nbWaves*2; i++){
    //Créer des positions aléatoires où les vagues seront créer
    randomPos[i] = int(random(0,N));
  }
  startTime = millis();
  println("Keys");
  println("----");
  println("Space: Enable movable box");
  println("s: Disable movable box");
  println("i: Increase wave intensity");
  println("k: Decrease wave intensity");
  println("arrow keys: Move box");
}


void draw(){
  background(0);
  lights();
  heightField.waveSimulation();
  heightField.drawField();
  //heightField.drawFieldPoints();
  box.drawBox();
  keyPressed();
  timeStep = (millis() - timeStep) / 1000;
}
