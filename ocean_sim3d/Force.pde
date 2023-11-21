public class Box{
  PVector position;
  PVector direction;
  float radius;
  Height_field heightfield;
  Box(float x, float y, float r, Height_field hf){
    this.position = new PVector(x, y, 0);
    this.radius = r;
    heightfield = hf;
    direction = new PVector(0, 0);
  }
  
  void drawBox(){
    if(keyPress){
      //Prendre la hauteur du particule courant
      position.z = heightfield.Particles[int(position.x/radius)][int(position.y/radius)].position.z;
      pushMatrix();
      strokeWeight(2);
      fill(150, 75, 0);
      stroke(150, 75, 0);
      translate(Radius/2 + position.x, Radius/2 + position.y, Radius/2 + position.z);
      box(Radius, Radius, Radius);
      popMatrix();
    }
    
  }
  
  
}
