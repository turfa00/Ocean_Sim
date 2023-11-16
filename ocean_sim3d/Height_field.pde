public class Height_field{
  //ArrayList <Particle> Particles;
  Particle[][] Particles;
  float [][] zValues;
  Height_field(){
    Particles = new Particle[N][N];
  }
  
  void drawField() {
    strokeWeight(1);
    stroke(0, 255, 255);
    noFill();
    //Quads
    for(int i = 0; i < N; i++){
      beginShape();
      for(int j = 0; j < N; j++){
        vertex(Particles[i][j].position.x * Radius, Particles[i][j].position.y * Radius, Particles[i][j].position.z);
        //vertex(i*Radius, j*Radius, 0);
      }
      endShape();
    }
    for(int j = 0; j < N; j++){
      beginShape();
      for(int i = 0; i < N; i++){
        vertex(Particles[i][j].position.x * Radius, Particles[i][j].position.y * Radius, Particles[i][j].position.z);
        //vertex(j*Radius, i*Radius, 0);
      }
      endShape();
    }
  }
  
  void drawFieldPoints(){ 
    strokeWeight(4);
    stroke(255);
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        point(Particles[i][j].position.x * Radius, Particles[i][j].position.y * Radius, Particles[i][j].position.z);
      }
    }
  }
  
  
  void waveTest3(){ 
    //Normalize height grid to have ocean like waves
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        Particles[i][j].position.z *= zCoefficient;
      }
    }
    //Create random waves from different positions on the grid
    for(int i = 0; i < nbWaves; i++){
      createWave(randomPos[i], randomPos[i+1], waveAmplitudeCoefficient);
    }
    for(int i = 1; i < N-2; i++){
      for(int j = 1; j < N-2; j++){
        float amplitude = 0.0;
        amplitude += Particles[i-1][j-1].position.z - Particles[i][j].position.z;
        amplitude += Particles[i-1][j].position.z - Particles[i][j].position.z;
        amplitude += Particles[i-1][j+1].position.z - Particles[i][j].position.z;
        //over
        amplitude += Particles[i+1][j-1].position.z - Particles[i][j].position.z;
        amplitude += Particles[i+1][j].position.z - Particles[i][j].position.z;
        amplitude += Particles[i+1][j+1].position.z - Particles[i][j].position.z;
        //sidene
        amplitude += Particles[i][j-1].position.z - Particles[i][j].position.z;
        amplitude += Particles[i][j+1].position.z - Particles[i][j].position.z;
        
        amplitude -= Particles[i][j+1].position.z;
        float z = Particles[i][j].position.z * 0.995 + amplitude/10; //First Test
        //float z = Particles[i][j].position.z * 0.995 + amplitude/100; //Second Test
        //Particles[i][j].position.z += z  * sin(((pow(distance,2))/ (Radius)) - timeStep);
        Particles[i][j].position.z += z;
      }
    }
    if(keyPress){ 
      int centerX = int(forceQuad.position.x);
      int centerY = int(forceQuad.position.y);
      //Particles[centerX][centerY].position.z += 100;
      //Particles[centerX][centerY].amplitude += 100;
      createWave2(centerX, centerY, 4);
    }
  }
  
  public void createWave(int centerX, int centerY, float coefficient){
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        int dx = i - centerX;
        int dy = j - centerY;
        float distance = sqrt((dx * dx) + (dy * dy));
        Particles[i][j].position.z += coefficient * Particles[i][j].amplitude * sin(((pow(distance,2))/ (Radius)) - timeStep);
      }
    }
  }
  public void createWave2(int centerX, int centerY, float coefficient){
    //for(int i = centerX; i < N; i = i+1 % N){
      //for(int j = centerY; j < N; j = j+1 % N){
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        int dx = i - centerX;
        int dy = j - centerY;
        float distance = sqrt((dx * dx) + (dy * dy));
        Particles[i][j].position.z += coefficient * sin(((-pow(distance,2))/ (Radius)) - timeStep);
      }
    }
  }
}
