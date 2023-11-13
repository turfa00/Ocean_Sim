public class Particle{
  PVector position;
  PVector velocity;
  float amplitude;
  float radius;
  float li;
  
  Particle(float x, float y, float z, float r, float a){
    this.position = new PVector(x, y, z);
    this.velocity = new PVector();
    this.radius = r;
    this.amplitude = a;
  }
  
  void setAmplitude(float a){
    this.amplitude = a;
  }
  
  void setVelocity(PVector v){ 
    this.velocity = v;
  }
}
