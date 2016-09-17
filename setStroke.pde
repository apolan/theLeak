/**
* Metodo que hace el set del texto
*/
void setStroke(String action){
  if(action=="paintTableGame"){
    strokeWeight(2);
    stroke(100);
    fill(153,153,153,5);
  } else if(action=="userA"){
    strokeWeight(2);
    stroke(0);
    fill(0,255,153,255);
  } else if(action=="userB"){
    strokeWeight(2);
    stroke(0);
    fill(255,153,0,255);
  } else if(action=="debugMapping"){
    textSize(20);
    fill(255, 0, 0);
  }else if(action=="debugMappingInfoTable"){
    textSize(14);
    fill(255, 255, 255);
  }else if(action=="boxAvailable"){
    textSize(20);
    fill(0, 255, 0);
  }else if(action=="indexBox"){
    textSize(9);
    fill(255, 255, 255);
  }
}