public class Particle{
  PVector position;
  float amplitude;
  float radius;
  
  Particle(float x, float y, float z, float r, float a){
    this.position = new PVector(x, y, z);
    this.radius = r;
    this.amplitude = a;
  }
  
  void setAmplitude(float a){
    this.amplitude = a;
  }
}
