class User {
  int posX; // equivale al index de la matriz X
  int posY; // equivale al index de la matriz Y
  int vida = 100;
  int puntaje = 0;
  char lastPosition;
  char currentPosition;
  String name;
  boolean turno = false;
  boolean dolor = false;

  public User(String name, int posX, int posY, char currentPosition){
    this.name = name;
    this.posX = posX - 1;
    this.posY = posY - 1;
    this.currentPosition = currentPosition;
  }
   
  void setPosition(int posX, int posY ){
  if(this.posX+posX>=0 && this.posX+posX<=DIMENSION_BOX_NUM_X-1 && this.posY+posY>=0 && this.posY+posY<=DIMENSION_BOX_NUM_Y-1 ){
    this.posX += posX;
    this.posY += posY;
    println(" [setPosition] Usuario:"+ this.name +" setPosX:"+this.posX +" setPosY:"+this.posY + " lastPosition:" + this.lastPosition + " currentPosition:" + this.currentPosition   );
    }
  }
  
    void setPositionBack(int posX, int posY ){
  if(this.posX+posX>=0 && this.posX+posX<=DIMENSION_BOX_NUM_X-1 && this.posY+posY>=0 && this.posY+posY<=DIMENSION_BOX_NUM_Y-1 ){
    this.posX = posX;
    this.posY = posY;
    println(" [setPositionBack] Usuario:"+ this.name +" setPosX:"+this.posX +" setPosY:"+this.posY + " lastPosition:" + this.lastPosition + " currentPosition:" + this.currentPosition   );
    }
  }
  
  void moveUser(char newPosition, int posX, int posY ){
    this.posX = posX;
    this.posY = posY;
    this.lastPosition = this.currentPosition;
    this.currentPosition = newPosition;
    println(" [moveUser] Cambio posicion: "+ this.name + " lastPosition: " + this.lastPosition + " currentPosition: " + this.currentPosition);

  }
  
  void paintUser(){
    float posX = (width/2)-((float)DIMENSION_BOX_NUM_X/2 * sizeBoxX);
    float posY = (height/2)-((float)DIMENSION_BOX_NUM_Y/2 * sizeBoxY) - marginTop;
    
    ellipse( posX +(this.getPosX()* sizeBoxX)+(sizeBoxX/2), posY +(this.getPosY()*sizeBoxY)+(sizeBoxY/2), 30, 30);
    //ellipse( 300, 300, 30, 30);

  }

  void perderVida(){
    if(!status_game.contains("location_users")){
      vida-=VIDA_REDUCCION;
      puntaje-=VIDA_REDUCCION;
    }
  }

  void setLastPosition(char position) {
    this.lastPosition=position;
  }
  
  int getPosX(){
    return this.posX;
  }
  
  int getPosY(){
    return this.posY;
  }
  
  boolean isTurno(){
    return this.turno;
  }

  
  int getVida(){
  return this.vida;
  }
  
  char getLastPosition(){
  return lastPosition;
  }
  
  String getNombre(){
  return this.name;
  }
  
  void setTurno(boolean turno){
    this.turno = turno;
  }



  int getPuntaje(){
  return this.puntaje;
 }
} 