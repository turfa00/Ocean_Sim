void keyPressed() {
  if(keyPressed && key == ' ' && keyPress == false){
    println("Box enabled");
    keyPress = true;
  }
  if(keyPressed && key == 's' && keyPress == true){
    println("Box disabled");
    keyPress = false;
  }
  if(keyPressed){
    if(key == 'i'){
      waveIntensity += 0.001;
      println("Intensity++");
    }
    if(key == 'k'){
      waveIntensity -= 0.001;
      println("Intensity--");
    }
    if (key == CODED){
      //move = Radius;
      move = Radius/10;
      boxWaveIntensity = 1;
      if(keyCode == UP && box.position.y-1 > 0){
        box.position.y -= move;
        box.direction.y = -1;
      }
      if(keyCode == DOWN && box.position.y+1 < (N-1)*Radius){
        box.position.y += move;
        box.direction.y = 1;
      }
      if(keyCode == RIGHT && box.position.x+1 < (N-1)*Radius){
        box.position.x += move;
        box.direction.x = 1;
      }
      if(keyCode == LEFT && box.position.x > 0){
        box.position.x -= move;
        box.direction.x = -1;
      }
    }
  }
  if(!keyPressed){
    boxWaveIntensity *= 0.99;
  }
   
}
