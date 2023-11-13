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
  
  void waveTest2(){ 
    int center = N/2;
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        Particles[i][j].position.z = 0;
      }
    }
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        int dx = i - center;
        int dy = j - center;
        float distance = sqrt(dx * dx + dy * dy);
        Particles[i][j].position.z += Particles[i][j].amplitude * sin((distance / Radius) - timeStep); //Second test
        Particles[i][j].position.z += Particles[i][j].amplitude * sin((distance / Radius) - timeStep); //Second test
        //Particles[i][j].position.z += Particles[i][j].amplitude * sin((Particles[i][j].position.x / Radius) + timeStep);
        //Particles[i][j].position.z += Particles[i][j].amplitude * sin((Particles[i][j].position.y / Radius) + timeStep); //First test
        //Particles[i][j].position.z += Particles[i][j].amplitude * 0.5 * cos((2 * PI * Particles[i][j].position.x / Radius)+ 1 - timeStep);
        //Particles[i][j].position.z += Particles[i][j].amplitude * 0.5 * cos((2 * PI * Particles[i][j].position.y / Radius)+ 1 - timeStep); //Second test
        //Particles[i][j].amplitude *= 0.997;
      }
    }
    //createWave(N/2, N/2);
    if(keyPressed && key == ' '){
      keyPress = true;
      
    }
      if(keyPress){
        //timeStepForce = 0.f;
        PVector waveStart = forceQuad.position;
        int centerX = int(N/2);
        int centerY = int(N/2);
        float amplitudeF;
        timeStepForce = (millis() - timeStepForce) / 1000;
        println(timeStepForce);
        for(int i = 0; i < N; i++){
          amplitudeF = random(30,40);
          for(int j = 0; j < N; j++){
            int dx = i - centerX;
            int dy = j - centerY;
            float distance = sqrt(dx * dx + dy * dy);
            
            Particles[i][j].position.z += amplitudeF * sin((distance / Radius) - timeStepForce); //Second test
            //Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x /Radius - timeStep / Radius); //First test
            //Particles[j][i].position.z += Particles[j][i].amplitude * sin(Particles[j][i].position.x / Radius * 4 - timeStep); //Second test
            //Particles[i][j].position.z += Particles[i][j].amplitude * sin((Particles[i][j].position.x / Radius) + timeStep); //Second test
            //Particles[i][j].position.z += Particles[i][j].amplitude * cos((Particles[i][j].position.y / Radius) + timeStep); //Second test
            //amplitudeF *= 0.8f;
            //Particles[i][j].amplitude *=0.997;
          }
          //amplitudeF = 0.f;
        }
        keyPress = false;
      }
  }
  void waveTest3(){ 
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        //Particles[i][j].position.z = 0;
        Particles[i][j].position.z *= 0.4;
        //Particles[i][j].position.z *= 0.3;
      }
    }
    int centerXX = int(random(0, N));
    int centerYY = int(random(0,N));
    for(int i = 0; i < 1; i++)
      createWave(int(random(0,N)), int(random(0,N)));
    /*for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        int dx = i - centerXX;
        int dy = j - centerYY;
        float distance = sqrt(dx * dx + dy * dy);
        Particles[i][j].position.z += Particles[i][j].amplitude * sin(((distance)/ sqrt(Radius)) - timeStep);
      }
    }*/
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
        
        float z = Particles[i][j].position.z * 0.995 + amplitude/10;
        //Particles[i][j].position.z += z * sin((Particles[i][j].position.x / Radius) - timeStep);
        Particles[i][j].position.z += z;
        //Particles[i][j].position.z = amplitude;
      }
    }
    if(keyPress){ 
      //int centerX = int(N/2);
      //int centerY = int(N/2);
      int centerX = int(random(0,N));
      int centerY = int(random(0,N));
      for(int i = 0; i < N; i++){
          //amplitudeF = random(30,40);
          for(int j = 0; j < N; j++){
            int dx = i - centerX;
            int dy = j - centerY;
            float distance = sqrt(dx * dx + dy * dy);
            Particles[i][j].amplitude = random(minAmplitude, maxAmplitude);
            Particles[i][j].position.z += Particles[i][j].amplitude * sin((distance / Radius) - timeStep); //Second test
            //Particles[i][j].position.z += Particles[i][j].amplitude * sin((distance / Radius) - timeStep); //Second test
            //Particles[i][j].position.z += amplitudeF * sin((distance / Radius) - timeStepForce); //Second test
            //Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x /Radius - timeStep / Radius); //First test
            //Particles[j][i].position.z += Particles[j][i].amplitude * sin(Particles[j][i].position.x / Radius * 4 - timeStep); //Second test
            //Particles[i][j].position.z += Particles[i][j].amplitude * sin((Particles[i][j].position.x / Radius) + timeStep); //Second test
            //Particles[i][j].position.z += Particles[i][j].amplitude * cos((Particles[i][j].position.y / Radius) + timeStep); //Second test
            //amplitudeF *= 0.8f;
            //Particles[i][j].position.z *= 1;
          }
          //amplitudeF = 0.f;
        }
      /*float waveOrNot = 5;
      Particles[N/2][N/2].position.z = waveOrNot*10;
      Particles[N/2+1][N/2+1].position.z = waveOrNot*5;
      Particles[N/2+1][N/2].position.z = waveOrNot*10;
      Particles[N/2+1][N/2-1].position.z = waveOrNot*5;
      Particles[N/2][N/2-1].position.z = waveOrNot*10;
      Particles[N/2-1][N/2+1].position.z = waveOrNot*5;
      Particles[N/2-1][N/2].position.z = waveOrNot*10;
      Particles[N/2-1][N/2-1].position.z = waveOrNot*5;*/
      //waveOrNot = 0;
      keyPress = false;
    }
  }
  
  public void createWave(int centerX, int centerY){
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        int dx = i - centerX;
        int dy = j - centerY;
        float distance = sqrt(dx * dx + dy * dy);
        //Particles[i][j].position.z += Particles[i][j].amplitude * sin((distance/ (Radius)) - timeStep);
        Particles[i][j].position.z += Particles[i][j].amplitude * sin(((pow(distance,2))/ (Radius)) - timeStep);
        Particles[i][j].amplitude *=0.999;
      }
    }
    
    
  }
}
