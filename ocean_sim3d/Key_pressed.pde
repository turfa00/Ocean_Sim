void keyPressed() {
  if(key == ' '){
    timeStepForce = 0.f;
  }
  if(keyPressed && key == ' ')
    keyPress = true;
  if (key == CODED){
    move = Radius;
    if(keyCode == UP){
      forceQuad.position.y -= move;
    }
    if(keyCode == DOWN){
      forceQuad.position.y += move;
    }
    if(keyCode == RIGHT){
      forceQuad.position.x += move;
    }
    if(keyCode == LEFT){
      forceQuad.position.x -= move;
    }
    keyPress = false;
  } 
}
