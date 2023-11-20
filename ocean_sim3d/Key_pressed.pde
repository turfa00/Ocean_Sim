void keyPressed() {
  if(keyPressed && key == ' ' && keyPress == false){
    println("Force enabled");
    keyPress = true;
  }
  if(keyPressed && key == 's' && keyPress == true){
    println("Force disabled");
    keyPress = false;
  }
  if(keyPressed){
    if(key == 'i'){
      waveIntensity += 0.001;
    }
    if(key == 'k'){
      waveIntensity -= 0.001;
    }
    if (key == CODED){
      move = Radius;
      if(keyCode == UP && forceQuad.position.y-1 > 0){
        forceQuad.position.y -= move;
      }
      if(keyCode == DOWN && forceQuad.position.y+1 < (N-1)*Radius){
        forceQuad.position.y += move;
      }
      if(keyCode == RIGHT && forceQuad.position.x+1 < (N-1)*Radius){
        forceQuad.position.x += move;
      }
      if(keyCode == LEFT && forceQuad.position.x > 0){
        forceQuad.position.x -= move;
      }
    }
  }
   
}
