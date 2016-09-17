import processing.video.*;

  //Sace
  private String nameUserA = "Andres1";
  private String nameUserB = "Andres2";

  private int DIMENSION_BOX_NUM_X = 9;
  private int DIMENSION_BOX_NUM_Y = 5;
  private int VIDA_REDUCCION = 2;
  private int maxLevelLayer = 70;
  private boolean check = false;
  private float scalePercent = 0.7; // 00.8
  private int sizeWindowX = (int)(1600*scalePercent);
  private int sizeWindowY = (int)(600*scalePercent);

  private int marginTop = 70;  //60
  private boolean debug = true;
  private boolean paintUser = true;
  private boolean dolorA = false;
  private boolean dolorB = false;
  

  // Mapping keys
  private char[] mapping = {'A','B','C','D','E','F','G','H','I','J','K','l','M','N','O','P','Q','R','S','T','V','W','X','Y','Z', // 25
                '0','1','2','3','4','5','6','7','8','9',  // 10
                //'/','*','-','+','[',']','{','}',';','''}; // 10
                '`','~','!','@','#','$','%','^','&','*', //10
                '(',')','-','_','=','+','[',']','{','}', //10
                '|',';',':','.','<','>','?'}; //8

  private Box[][] tableGame = new Box[DIMENSION_BOX_NUM_X][DIMENSION_BOX_NUM_Y];

  private int[] timers = new int[] {200,5,7,8};; // Set locations | turnos | olas | inundacion
  
  private User userA;
  private User userB;

  // Some parameters
  private int sizeBoxX = (int)(200*scalePercent); // 180:1
  private int sizeBoxY = (int)(120*scalePercent); // 120:1


  // Game variables
  private String status_game = ""; // s (userA|userB) | game_1_init (userA|userB) | game_2_init (userA|userB)
  private String turno;
  float timerTime_game;
  float timerTime_turno;
  float timerTime_inundacion;
  float timerTime_false;
  float timerTime_dolorA;
  float timerTime_dolorB;
  
  private int waveCount;
  private int subwaveCountA = 4;
  private int subwaveCountB = 5;
  private double timer;

  //Images
  private ArrayList<Layer> layersBackground = new ArrayList<Layer>();
  //Videos
  private ArrayList<Layer> layersVideo = new ArrayList<Layer>();


void setup(){
  //SizeWindow
  //size(1610, 740); // grande 2
  size(1300, 700);  // grande 1


  background(0,0,0);
  setTimer(timers[0],"game"); // Inicio segs para q se acomoden los usuarios
  initTableGame();

  // Condiciones inciales todo: cambiar y q sea dinamica la salia
  userA = new User(nameUserA, 1, 1,findByPosition(1-1,1-1).getCharAt()); // Por default
  userB = new User(nameUserB, 9, 5,findByPosition(8-1,4-1).getCharAt()); // Por default
}


void draw(){
  // Pinta el tablero en su estado
  background(0,0,0);
  //checkTimer("game");
  //checkTimer("turno");

  //paintAnimation("pics");
  paintAnimation("videos");
  paintTableGame();

  check("move");
  paintAnimation("dolor");
  controllerGame(status_game);
  controllerEvents(); // metodo que hace el trigger de eventos de animacion
}


/** ---------------------------------------------------- Paint init ----------------------------------------------------------------*/

void paintAnimation(String animacionTipo){
  //Pinta video
  int index = 0;
  if(animacionTipo.equalsIgnoreCase("pics")){
    for(Layer layer : layersBackground){
      if(index > maxLevelLayer){
        break;
      }
      layer.paintImage();
      index++;
    }
  }else if(animacionTipo.equalsIgnoreCase("videos")){
    for(Layer layer : layersVideo){
      if(index > maxLevelLayer){
        break;
      }
      layer.paintVideo();
      index++;
    }
  }else if(animacionTipo.equalsIgnoreCase("dolor")){
    if(userA.dolor == true){
      fill(255,0,0,150);
      rect(0, 0, height, width/2); //TODO:DOLOR A UNO SOLO
      userA.dolor = false;
    }
    if(userB.dolor == true){
      fill(255,0,0,150);
      rect(width/2, 0, height, width/2); //TODO:DOLOR A UNO SOLO
      userB.dolor = false;
    }
  }
}




/** ---------------------------------------------------- Paint end ----------------------------------------------------------------*/

/**

*/
void initTableGame (){
  //Centra el tablero
  int indexLetter = 0;
  float posX = (width/2)-((float)DIMENSION_BOX_NUM_X/2 * sizeBoxX);
  float posY = (height/2)-((float)DIMENSION_BOX_NUM_Y/2 * sizeBoxY) - marginTop;

  //println("posX: "+posX+" - posY: "+posY );
  //println("height/2: "+height/2+" - DIMENSION_BOX_NUM_Y/2: "+(float)DIMENSION_BOX_NUM_Y/2 +" sizeBoxY " + sizeBoxY );
  println("width: "+posX+" - posY: "+posY );


  for(int row=0; row < tableGame.length; row++){
    for(int column=0; column < tableGame[row].length; column++){
      tableGame[row][column] = new Box(posX + (sizeBoxX * row),
                      posY + (sizeBoxY * column),
                      sizeBoxX,
                      sizeBoxY,
                      mapping[indexLetter]
                      );
      tableGame[row][column].indexMatrizX = row;
      tableGame[row][column].indexMatrizY = column;
      //println("CREATE: "+tableGame[row][column]+" Row:"+row+" Column:"+column+" "+mapping[indexLetter]); 
      indexLetter++;
    }
  }
  
  // Cuales son los las espacios fijos 
  //0.0 | 3.1 | 4.5 | 5.4 | 7.1 | 9.5
    

  //PImage bk = loadImage("./pics/map-theCity[1].png");
  PImage bk = loadImage("./pics/map2.jpg");
  layersBackground.add(new Layer(posX,
              posY,
              bk,
              "background1",
              DIMENSION_BOX_NUM_X*sizeBoxX,
              DIMENSION_BOX_NUM_Y*sizeBoxY
              ));


  //layersVideo.add(createLayer(posX, posY, "ciudad"));

  status_game = "location_users:userA";
  
}


/**
*/
Box findByKey(char xKey){
  for(int row = 0; row < tableGame.length; row++){
    for(int column = 0; column < tableGame[row].length; column++){     
      //println("buscar:"+ tableGame[row][column].getCharAt() );
      if(tableGame[row][column].getCharAt() == xKey){
        //println(" se encontró:"+ xKey );
        return tableGame[row][column];
      }
    }
  }
  return null;
}

/**
*/
Box findByPosition(int posX, int posY){
    return tableGame[posX][posY];
}



/**
*/
void setAvailableBox (int posX, int posY ){
  findByPosition(posX,posY).setAvailable(true);
}

/**
*/
void setAvailableAll(boolean estado){
  for(int row = 0; row < tableGame.length; row++){
    for(int column = 0; column < tableGame[row].length; column++){
      tableGame[row][column].setAvailable(estado);
    }
  }
}

/**
*/
void setAvailableColumn(int index,boolean estado){
  for(int column = 0; column < tableGame[index].length; column++){
      tableGame[index][column].setAvailable(estado);
    }
  }

void movieEvent(Movie m) {
  m.read();
}

/**
*/
boolean check(String event){
  boolean resultado = false;
  try{
    if(event.equalsIgnoreCase("move")){
      if(!status_game.contains("location_users") ){ // no es locaciones
        if(status_game.contains("userB")){
            if(!findByKey(userA.currentPosition).available){

            Box box = findByKey(userA.lastPosition); //lo de vuelve al anterior
            println("User A posi: "+ userA.getPosX() + " " + userA.getPosY());
            println("User A Last: "+ box.indexMatrizX + " " + box.indexMatrizY);
            println("User A char: "+ userA.currentPosition + " " + userA.lastPosition);
            println(" find last: " + findByPosition(userA.getPosX(), userA.getPosY()).getCharAt());
            println(" find new: " + findByPosition(box.indexMatrizX, box.indexMatrizY).getCharAt());
      
            if(checkTimer("dolorA")){
              userA.setPositionBack(box.indexMatrizX, box.indexMatrizY);
              userA.moveUser(findByPosition(userA.getPosX(), userA.getPosY()).getCharAt(), userA.getPosX(), userA.getPosY());
              dolorA=false;
              //todo: Animacion o algo para quitar vida*/
            }else{
              if(!dolorA){
                userA.perderVida();
                setTimer(0.2,"dolorA");
                dolorA=true;
              }
            }
          }
        } else if(status_game.contains("userA")){
          if(!findByKey(userB.currentPosition).available){

            Box box = findByKey(userB.lastPosition); //lo de vuelve al anterior
            println("User B posi: "+ userB.getPosX() + " " + userB.getPosY());
            println("User B Last: "+ box.indexMatrizX + " " + box.indexMatrizY);
            println("User B char: "+ userB.currentPosition + " " + userB.lastPosition);
            println(" find last: " + findByPosition(userB.getPosX(), userB.getPosY()).getCharAt());
            println(" find new: " + findByPosition(box.indexMatrizX, box.indexMatrizY).getCharAt());
            
            if(dolorA){
              if(checkTimer("dolorB")){
                userB.setPositionBack(box.indexMatrizX, box.indexMatrizY);
                userB.moveUser(findByPosition(userB.getPosX(), userB.getPosY()).getCharAt(), userB.getPosX(), userB.getPosY());
                userB.dolor = true;
                dolorB=false;
                //todo: Animacion o algo para quitar vida*/
              }else{
              if(!dolorA){
                userB.perderVida();
                setTimer(0.2,"dolorB");
                dolorB=true;
              }
            }
          }
        }
      }
    }
  }catch(Exception e){
    println("error check");
    
  }

  return resultado;
}


/**
*/
Layer createLayer(float posX, float posY, String layerTipo){
  Movie movie = null;
  int dimensionX = 0;
  int dimensionY = 0;

  if(layerTipo.equalsIgnoreCase("inundacion")){
    movie = new Movie(this, "inundacion.mp4");
    dimensionX = sizeBoxX;
    dimensionY = sizeBoxY;
    } else   if(layerTipo.equalsIgnoreCase("ciudad")){
    movie = new Movie(this, "Black Solid 1 Comp 1.mp4");
    dimensionX = DIMENSION_BOX_NUM_X * sizeBoxX;
    dimensionY = DIMENSION_BOX_NUM_Y * sizeBoxY;
  }

  //println("create layer: " + posX + " - "+ posY + " TIPO:" + layerTipo);

  return new Layer(posX,
          posY,
          movie,
          "Video",
          dimensionX,
          dimensionY
          );

}


/**
animacion1
*/
void controllerEvents(){
  // Animacion aggua 1
  if(status_game.contains("game_1_init")){
    if(checkTimer("inundacion")){
      //layersVideo.get(subwaveCount);
      // hace play de algo todo:
      if(subwaveCountA != -1 ){ 
 
        for(int i = 0; i <= 4 ; i++){
          layersVideo.add(createLayer(findByPosition(subwaveCountA,i).getPosX()-1, findByPosition(subwaveCountA,i).getPosY(), "inundacion"));
        }
        setAvailableColumn(subwaveCountA,false);
        //println("Countwave: " + subwaveCount);
        subwaveCountA--;
      }

      if(subwaveCountB != 9 ){
        for(int i = 0; i <= 4 ; i++){
          layersVideo.add(createLayer(findByPosition(subwaveCountB,i).getPosX()-1, findByPosition(subwaveCountB,i).getPosY(), "inundacion"));
        }
        setAvailableColumn(subwaveCountB,false);
        
        subwaveCountB++;
      }

      setTimer(timers[3],"inundacion");
    }
  }else if(status_game.contains("game_2_init")){
    
  }
}


/**
Posibles estados location_users | game_1_init | game_2_init | end_game

Este es el unico que mueve los estados del juego|
*/
void controllerGame(String status_game){
  if(status_game.contains("location_users")){
    // Los usuarios escogen puestos
    if(checkTimer("game")){
      this.status_game = "game_1_init";
      turno = "userA";
      userA.setTurno(true);
      userB.setTurno(false);

      setTimer(timers[2]*3,"game"); // Es el timer de la ola lol!! y del limite par ael segundo juego que es obligatorio
      setTimer(timers[1],"turno"); // Se establece el tiempo para el primer turno !!
      waveCount++;

      setTimer(timers[3],"inundacion");

    }
  } else if(status_game.contains("game_1_init")){ // Primera Parte
    if(checkTimer("turno") ){
      if(status_game.contains("userA")){
        this.status_game = "game_1_init:userB";
        turno = "userA";
        userA.setTurno(true);
        userB.setTurno(false);
        setTimer(timers[1],"turno");
      } else{
        this.status_game = "game_1_init:userA";
        turno = "userB";
        userA.setTurno(false);
        userB.setTurno(true);
        setTimer(timers[1],"turno");
      }
    }
    if(checkTimer("game")){ // Inicio jeugo dos
      //EDIIFICIOS BIEN
      setAvailableBox(0,0);
      setAvailableBox(3,1);
      setAvailableBox(4,4);
      setAvailableBox(5,4);
      setAvailableBox(7,3);
      setAvailableBox(8,4);

      if(turno.equalsIgnoreCase("userA")){
        this.status_game = "game_2_init:userB";
      }else{
        this.status_game = "game_2_init:userA";
      }
    }

  } else if(status_game.contains("game_2_init")){ // Segunda Parte
    if(checkTimer("game")){
      setTimer(timers[2]*3,"game");
      waveCount++;
    }
  }
}