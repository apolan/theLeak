/*
*  Se hace set timer en segundos
*/
void setTimer(float seconds, String xTimer){
  if(xTimer.equalsIgnoreCase("game")){
    if(this.timerTime_game == 0){
      timerTime_game = millis() + ( seconds * 1000);
      return;
    }else{
      this.timerTime_game = 0;
      setTimer(seconds,xTimer);
    }
  }else if(xTimer.equalsIgnoreCase("turno")){
    if(this.timerTime_turno == 0){
      this.timerTime_turno = millis() + ( seconds * 1000);
      return;
    }else{
      this.timerTime_turno = 0;
      setTimer(seconds,xTimer);
    }
  }else if(xTimer.equalsIgnoreCase("inundacion")){
    if(this.timerTime_inundacion == 0){
      this.timerTime_inundacion = millis() + ( seconds * 1000);
      return;
    }else{
      this.timerTime_inundacion = 0;
      setTimer(seconds,xTimer);
    }
  }else if(xTimer.equalsIgnoreCase("inundacion_row")){
    if(this.timerTime_false == 0){
      this.timerTime_false = millis() + ( seconds * 1000);
      return;
    }else{
      this.timerTime_false = 0;
      setTimer(seconds,xTimer);
    }
  }else if(xTimer.equalsIgnoreCase("dolorA")){
    if(this.timerTime_dolorA == 0){
      this.timerTime_dolorA = millis() + ( seconds * 1000);
      return;
    }else{
      this.timerTime_dolorA = 0;
      setTimer(seconds,xTimer);
    }
  }else if(xTimer.equalsIgnoreCase("dolorB")){
    if(this.timerTime_dolorB == 0){
      this.timerTime_dolorB = millis() + ( seconds * 1000);
      return;
    }else{
      this.timerTime_dolorB = 0;
      setTimer(seconds,xTimer);
    }
  }
 }

/**
Cuando es true se resetea es del timer
*/
boolean checkTimer(String check){
  boolean resultado = false;
  if(check.equalsIgnoreCase("game")){
    if(timerTime_game != 0){
      if( millis() >= timerTime_game ){
      resultado = true;
      timerTime_game = 0; // Se resetea el timer -- Mientras diga true el juego no avanza de estado
      }
    }
  }else if(check.equalsIgnoreCase("turno")){
    if(timerTime_turno != 0){
      if( millis() >= timerTime_turno ){
        resultado = true;
        timerTime_turno = 0; // Se resetea el timer de turno para el siguiente -- Mientras diga true el juego no avanza de estado
      }
    }  
  } else if(check.equalsIgnoreCase("inundacion")){
    if(timerTime_inundacion != 0){
      if( millis() >= timerTime_inundacion ){
        resultado = true;
        timerTime_inundacion = 0; // Se resetea el timer de la inundacion
      }
    }  
  }else if(check.equalsIgnoreCase("timerTime_false")){
    if(timerTime_false != 0){
      if( millis() >= timerTime_false ){
        resultado = true;
        timerTime_false = 0; // Se resetea el timer de la inundacion
      }
    }  
  }else if(check.equalsIgnoreCase("dolorA")){
    if(timerTime_dolorA != 0){
      if( millis() >= timerTime_dolorA ){
        resultado = true;
        timerTime_dolorA = 0; // Se resetea el timer de la dolor
      }
    }  
  }else if(check.equalsIgnoreCase("dolorB")){
    if(timerTime_dolorB != 0){
      if( millis() >= timerTime_dolorB ){
        resultado = true;
        timerTime_dolorB = 0; // Se resetea el timer de la dolor
      }
    }  
  }

  return resultado;
}