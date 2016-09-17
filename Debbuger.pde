void debugger(String action){
  if(debug){
    if(action.equalsIgnoreCase("infoTableGame")){
      // Pinta el numX-numY
      float x = (width/2)-((float)DIMENSION_BOX_NUM_X/2 * sizeBoxX);
      float y = (height/2)-((float)DIMENSION_BOX_NUM_Y/2 * sizeBoxY) - 50 - marginTop;
      setStroke("debugMappingInfoTable");
      // Columna 1
      text("MATRIZ: " + DIMENSION_BOX_NUM_X+" x "+DIMENSION_BOX_NUM_Y + " = " + DIMENSION_BOX_NUM_X*DIMENSION_BOX_NUM_Y,
        x,
        y+(20*1));
      text("SizeSquare: X:" + sizeBoxX+" Y:"+sizeBoxY,
        x,
        y+(20*2));
      // Columna 2
      text("Tiempo: " + millis(),
        x + 175,
        y+(20*1));
      text("Timer game: " + timerTime_game,
        x + 175,
        y+(20*2));
      // Columna 3
      text("Estado juego: " + status_game,
        x + 350,
        y+(20*0));
      text("Timer turno: " + timerTime_turno,
        x + 350,
        y+(20*1));
      text("Timer inundacion: " + timerTime_inundacion,
        x + 350,
        y+(20*2));
      // Columna 4
      text("Ola contador: " + waveCount,
        x + 600,
        y+(20*1));
      // Columna 5
      text("Puntaje A: " + userA.getPuntaje(),
        x + 730,
        y+(20*1));
      text("Puntaje B: " + userB.getPuntaje(),
        x + 730,
        y+(20*2));
      // Columna 5
      text("TM. DolorA: " + timerTime_dolorA,
        x + 930,
        y+(20*1));
      text("TM. DolorB: " + timerTime_dolorB,
        x + 930,
        y+(20*2));
     }
  }
}