void keyPressed() {
  if(key == ' '){
    //println(forceQuad.position);
    randomForce = random(10, 30);
  }
  if(keyPressed)
    keyPress = true;
  if (key == CODED && keyPress){
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
