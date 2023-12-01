public class Height_field{
  Particle[][] Particles;
  Height_field(){
    Particles = new Particle[N][N];
  }
  
  void drawFieldQuads() {
    strokeWeight(2);
    stroke(15, 94, 156); //Watery Blue
    noFill();
    //Quads
    for(int i = 0; i < N; i++){
      beginShape();
      for(int j = 0; j < N; j++){
        vertex(Particles[i][j].position.x * Radius, Particles[i][j].position.y * Radius, Particles[i][j].position.z);
      }
      endShape();
    }
    for(int j = 0; j < N; j++){
      beginShape();
      for(int i = 0; i < N; i++){
        vertex(Particles[i][j].position.x * Radius, Particles[i][j].position.y * Radius, Particles[i][j].position.z);
      }
      endShape();
    }
  }
  
  void drawField(){
    noStroke();
    PImage img = loadImage("blue.jpg");
    textureMode(NORMAL); 
    beginShape();
    for (int i = 0; i< N-1; i++) {
      for (int j = 0; j< N-1; j++) {
        beginShape();
        texture(img);
        vertex( (Particles[i][j].position.x)*Radius, (Particles[i][j].position.y)*Radius, Particles[i][j].position.z, 0, 0 );
        vertex( (Particles[i][j].position.x+1)*Radius, (Particles[i][j].position.y)*Radius, Particles[i+1][j].position.z, 1, 0 );
        vertex( (Particles[i][j].position.x+1)*Radius, (Particles[i][j].position.y+1)*Radius, Particles[i+1][j+1].position.z, 1, 1 );
        vertex( (Particles[i][j].position.x)*Radius, (Particles[i][j].position.y+1)*Radius, Particles[i][j+1].position.z, 0, 1 );
        endShape();
      }
    } 
  }
  
  void drawFieldPoints(){ 
    strokeWeight(2);
    stroke(255);
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        point(Particles[i][j].position.x * Radius, Particles[i][j].position.y * Radius, Particles[i][j].position.z);
      }
    }
  }
  
  
  public void waveSimulation(){ 
    //Normaliser la surface pour avoir des vagues comme un ocean
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        Particles[i][j].position.z *= zCoefficient;
      }
    }
    //Créer des vagues aléatoires à partir de differents positions sur la grille
    for(int i = 0; i < nbWaves; i++){
      createWave(randomPos[i], randomPos[i+1], waveIntensity);
    }
    
    //Accumuler les forces d'un particule venant de differents particules voisins
    for(int i = 1; i < N-1; i++){
      for(int j = 1; j < N-1; j++){
        float amplitude = 0.0;
        //En dessous
        amplitude += Particles[i-1][j-1].position.z - Particles[i][j].position.z;
        amplitude += Particles[i-1][j].position.z - Particles[i][j].position.z;
        amplitude += Particles[i-1][j+1].position.z - Particles[i][j].position.z;
        //Au dessus
        amplitude += Particles[i+1][j-1].position.z - Particles[i][j].position.z;
        amplitude += Particles[i+1][j].position.z - Particles[i][j].position.z;
        amplitude += Particles[i+1][j+1].position.z - Particles[i][j].position.z;
        //Les côtes
        amplitude += Particles[i][j-1].position.z - Particles[i][j].position.z;
        amplitude += Particles[i][j+1].position.z - Particles[i][j].position.z;
        
        amplitude -= Particles[i][j+1].position.z;
        
        float z = Particles[i][j].position.z + amplitude/10;
        Particles[i][j].position.z += z;
      }
    }
    if(keyPress){ 
      //Si touche éspace appuyer, créer des vagues causé par une force qui vient du quad 
      int centerX = int(box.position.x / Radius);
      int centerY = int(box.position.y / Radius);
      //createWaveBox(centerX, centerY, waveIntensity * 6);
      createWaveBox(centerX, centerY, waveIntensity * 4);
      box.direction = new PVector(0, 0);
    }
  }
  
  public void createWave(int centerX, int centerY, float intensity){
    //Fonction pour créer des vagues venant d'une position
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        int dx = i - centerX;
        int dy = j - centerY;
        float distance = sqrt((dx * dx) + (dy * dy));
        Particles[i][j].position.z += intensity * Particles[i][j].amplitude * sin(((pow(distance,2))/ (Radius)) - timeStep);
      }
    }
  }
  public void createWaveBox(int centerX, int centerY, float intensity){
    //Fonction pour créer des vagues venant du boite
    float dispersionAngle = 0.f;
    PVector tempDir = box.direction.copy();
    float tempIntensity = 0.f;
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        int dx = i - centerX;
        int dy = j - centerY;
        float distance = sqrt((dx * dx) + (dy * dy));
        tempIntensity = abs((intensity * distance) - maxDistance);
        tempIntensity /= (Radius * 5);
        
        if(tempDir.x < 0 && i < centerX){
          tempIntensity *= zCoefficient;
        }
        if(tempDir.y < 0 && j < centerY){
          tempIntensity *= zCoefficient;
        }
        if(tempDir.x > 0 && i > centerX){
          tempIntensity *= zCoefficient;
        }
        if(tempDir.y > 0 && j > centerY){
          tempIntensity *= zCoefficient;
        }
        Particles[i][j].position.z +=  boxWaveIntensity * tempIntensity * Particles[i][j].amplitude * sin(((pow(distance,2))/ (Radius)) + timeStep*2);
      }
    }
  }
}
