public class Height_field{
  //ArrayList <Particle> Particles;
  Particle[][] Particles;
  float [][] zValues;
  Height_field(){
    //Particles = new ArrayList <Particle>();
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
  
  void waveTest1(){
    theta += 0.02;
    float period = random(100,300); // How many pixels before the wave repeats
    float dx = (TWO_PI / period);
    for(int i = 0; i < N; i++){
      float x = theta;
      for(int j = 0; j < N; j++){
        if(i % 2 == 0){
          Particles[i][j].position.z += sin(x) * random(1,3);
        }
        else{
          //Particles[i][j].position.z += cos(x) * random(1, 3);
          Particles[i][j].position.z += sin(x) * random(1,3);
        }
        x += dx;
      }
    }
  }
  
  void waveTest2(){ 
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        //Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x /Radius - timeStep / Radius); //First test
        Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x - timeStep); //Second test
        Particles[i][j].amplitude*=0.997;
        //Particles[i][j].position.z = (0.5) * cos((2 * PI * Particles[i][j].amplitude / Radius) + 1) ;//* rectangleFunction(Particles[i][j].amplitude / Radius); 
      }
    }
  }
  void waveTest3(){ 
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        //Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x /Radius - timeStep / Radius);
        Particles[j][i].position.z = Particles[j][i].amplitude * cos(Particles[j][i].position.x - timeStep);
        if(i > N/2)
          Particles[j][i].position.z = Particles[j][i].amplitude * cos(Particles[j][i].position.x - timeStep * sqrt(Radius));
      }
    }
  }
  
  void waveTest4(){
    if(keyPressed){
      if(key == ' ' && keyPress){
        PVector waveStart = forceQuad.position;
        //int i = int(forceQuad.position.x);
        int ip = int(forceQuad.position.x);
        //int j = int(forceQuad.position.y);
        int jp = int(forceQuad.position.y);
        Particles[ip/Radius][jp/Radius].position.z = random(1,10);
        //while(i > 0 || ip < N-1){
          //while(j > 0 || jp < N-1){
        for(int i = 1; i < N-2; i++){
          for(int j = 1; j < N-2; j++){
            float force = 0.0;
            force += Particles[i-1][j-1].position.z - Particles[i][j].position.z;
            force += Particles[i-1][j].position.z - Particles[i][j].position.z;
            force += Particles[i-1][j+1].position.z - Particles[i][j].position.z;
            //over
            force += Particles[i+1][j-1].position.z - Particles[i][j].position.z;
            force += Particles[i+1][j].position.z - Particles[i][j].position.z;
            force += Particles[i+1][j+1].position.z - Particles[i][j].position.z;
            //sidene
            force += Particles[i][j-1].position.z - Particles[i][j].position.z;
            force += Particles[i][j+1].position.z - Particles[i][j].position.z;
            
            force -= Particles[i][j+1].position.z / 8;
            
            Particles[i][j].position.z += force / 1; 
          }
        }
        println(forceQuad.position);
      }
    }
  }
  /*
  for(int i = 1; i < N-2; i++){
          for(int j = 1; j < N-2; j++){
            Particles[i-1][j-1].position.z = Particles[i-1][j-1].amplitude * cos(Particles[i][j].position.x - timeStep);
            Particles[i-1][j].position.z = Particles[i-1][j].amplitude * cos(Particles[i][j].position.x - timeStep);
            Particles[i-1][j+1].position.z = Particles[i-1][j+1].amplitude * cos(Particles[i][j].position.x - timeStep);
            //over
            Particles[i+1][j-1].position.z = Particles[i+1][j-1].amplitude * cos(Particles[i][j].position.x - timeStep);
            Particles[i+1][j].position.z = Particles[i+1][j].amplitude * cos(Particles[i][j].position.x - timeStep);
            Particles[i+1][j+1].position.z = Particles[i+1][j+1].amplitude * cos(Particles[i][j].position.x - timeStep);
            //sidene
            Particles[i][j-1].position.z = Particles[i][j-1].amplitude * cos(Particles[i][j].position.x - timeStep);
            Particles[i][j+1].position.z = Particles[i][j+1].amplitude * cos(Particles[i][j].position.x - timeStep);
          }
        }*/
  
  void waveTest6(){ 
    for(int i = 0; i < N; i++){
      for(int j = 0; j < N; j++){
        //Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x /Radius - timeStep / Radius); //First test
        Particles[i][j].position.z = Particles[i][j].amplitude * cos(Particles[i][j].position.x - timeStep); //Second test
        //Particles[i][j].position.z = (0.5) * cos((2 * PI * Particles[i][j].amplitude / Radius) + 1) ;//* rectangleFunction(Particles[i][j].amplitude / Radius); 
      }
    }
  }
}
