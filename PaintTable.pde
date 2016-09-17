/**
*/
void paintTableGame(){
  // Modifica el stroke
  setStroke("paintTableGame");
  for(int row = 0; row < tableGame.length; row++){
    for(int column = 0; column < tableGame[row].length; column++){
      setStroke("paintTableGame");
      tableGame[row][column].paintBox();
      if(debug){
        setStroke("debugMapping");

        text(tableGame[row][column].getCharAt(),
          (tableGame[row][column].getPosX() + tableGame[row][column].getSizeX()/2),
          (tableGame[row][column].getPosY() + tableGame[row][column].getSizeY()/2)
          );

        if(tableGame[row][column].isAvailable()){
        setStroke("boxAvailable");
        }

        text(String.valueOf(tableGame[row][column].isAvailable()),
          tableGame[row][column].getPosX() + tableGame[row][column].getSizeX()/2 - 20,
          tableGame[row][column].getPosY() + tableGame[row][column].getSizeY()/2 + 20
          );

        setStroke("indexBox");
        text(tableGame[row][column].indexMatrizX+"-"+tableGame[row][column].indexMatrizY,
        tableGame[row][column].getPosX() + tableGame[row][column].getSizeX()/2 - 40,
        tableGame[row][column].getPosY() + tableGame[row][column].getSizeY()/2 + 35
          );
        
        
      }
    //println("Paint: X"+tableGame[row][column].getPosX()+" Y:"+tableGame[row][column].getPosY()+" sizeX:"+tableGame[row][column].getSizeX()+" sizeY:"+tableGame[row][column].getSizeY());
    
    }
  }

  // Pinta al usuario
  if(paintUser){
    setStroke("userA");
    userA.paintUser();
    setStroke("userB");
    userB.paintUser();
  }
  debugger("infoTableGame");
}