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
        //Particles[i][j].position.z += Particles[i][j].amplitude * sin((distance / Radius) - timeStep); //Second test
        //Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x /Radius - timeStep / Radius); //First test
        //Particles[j][i].position.z += Particles[j][i].amplitude * sin(Particles[j][i].position.x / Radius * 4 - timeStep); //Second test
        Particles[i][j].position.z += Particles[i][j].amplitude * sin((Particles[i][j].position.x / Radius) + timeStep); //Second test
        Particles[i][j].position.z += Particles[i][j].amplitude * sin((Particles[i][j].position.y / Radius) + timeStep); //Second test
        Particles[i][j].amplitude *=0.997;
      }
    }
    if(keyPressed && key == ' '){
      keyPress = true;
      
    }
      if(keyPress){
        //timeStepForce = 0.f;
        PVector waveStart = forceQuad.position;
        int centerX = int(forceQuad.position.x);
        int centerY = int(forceQuad.position.y);
        float amplitudeF;
        timeStepForce = (millis() - timeStepForce) / 1000;
        println(timeStepForce);
        for(int i = 0; i < N; i++){
          amplitudeF = random(30/timeStepForce,40/timeStepForce);
          for(int j = 0; j < N; j++){
            int dx = i - centerX;
            int dy = j - centerY;
            float distance = sqrt(dx * dx + dy * dy);
            
            Particles[i][j].position.z += amplitudeF * sin((distance / Radius) - timeStep); //Second test
            //Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x /Radius - timeStep / Radius); //First test
            //Particles[j][i].position.z += Particles[j][i].amplitude * sin(Particles[j][i].position.x / Radius * 4 - timeStep); //Second test
            //Particles[i][j].position.z += Particles[i][j].amplitude * sin((Particles[i][j].position.x / Radius) + timeStep); //Second test
            //Particles[i][j].position.z += Particles[i][j].amplitude * cos((Particles[i][j].position.y / Radius) + timeStep); //Second test
            //amplitudeF *= 0.8f;
            //Particles[i][j].amplitude *=0.997;
          }
          //amplitudeF = 0.f;
        }
      }
  }
}
