public class Force{
  PVector position;
  float radius;
  Force(float x, float y, float r){
    this.position = new PVector(x, y, 0);
    this.radius = r;
  }
  
  void drawF(){
    pushMatrix();
    strokeWeight(2);
    fill(0, 0, 255);
    stroke(255, 0, 255);
    rect(position.x, position.y, Radius, Radius);
    popMatrix();
  }
  
  
}
