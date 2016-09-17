void keyPressed(){
}


void keyReleased() {
  try{
    //println("Movieminto de usuario: " + findByKey(key).posX + findByKey(key).available);
      int posX = 0;
      int posY = 0;
      
      // Estos son para el control mago del ADMIN
      if (keyCode == LEFT){
          posX += -1;
      }else if (keyCode == RIGHT){
          posX += +1;
      }else if (keyCode == UP){
          posY += -1;
      }else if (keyCode == DOWN){
          posY += +1;
      }
      
      // Los 4 del A y B
      if (keyCode == 's' || keyCode == 'k'){
          posX += -1;
      }else if (keyCode == 'd' || keyCode == 'l'){
          posX += +1;
      }else if (keyCode == 'a' || keyCode == 'j'){
          posY += -1;
      }else if (keyCode == 'w' || keyCode == 'i'){
          posY += +1;
      }
      
    if(status_game.contains("location_users")){
      //println("key arrow:" + posX + " " + posY );
        if(status_game.contains("userA")){  
          userA.setPosition(posX, posY);
          userA.moveUser(findByPosition(userA.getPosX(),userA.getPosY()).getCharAt(),userA.getPosX(),userA.getPosY());
           if (keyCode == ENTER){
               status_game="location_users:userB";
               setAvailableBox(userA.getPosX(),userA.getPosY());
             }

        } else if(status_game.contains("userB")){
          userB.setPosition(posX, posY);
          userB.moveUser(findByPosition(userB.getPosX(),userB.getPosY()).getCharAt(),userB.getPosX(),userB.getPosY());
          
          if (keyCode == ENTER){ 
            status_game="location_users"; // Ya no deja hacer mas movimientos
            setTimer( 2 ,"game");
            setAvailableBox(userB.getPosX(),userB.getPosY());

      setAvailableAll(true);
           }
        }
    } else if(status_game.contains("game_1_init")){

        //println("key arrow:" + posX + " " + posY );
        if(status_game.contains("userA")){
              userA.setPosition(posX, posY);
              userA.moveUser(findByPosition(userA.getPosX(),userA.getPosY()).getCharAt(),userA.getPosX(),userA.getPosY());
              dolorA=true;
              status_game="game_1_init:userB";
              setTimer(3 ,"turno"); // Espero que el otro jugador juegue
           
        } else if(status_game.contains("userB")){
               userB.setPosition(posX, posY);
               userB.moveUser(findByPosition(userB.getPosX(),userB.getPosY()).getCharAt(),userB.getPosX(),userB.getPosY());
               dolorB=true;
               status_game="game_1_init:userA";
             setTimer(3 ,"turno"); // Espero que el otro jugador juegue
        }
    } else if(status_game.contains("game_2_init")){

        //println("key arrow:" + posX + " " + posY );
        if(status_game.contains("userA")){
              userA.setPosition(posX, posY);
              userA.moveUser(findByPosition(userA.getPosX(),userA.getPosY()).getCharAt(),userA.getPosX(),userA.getPosY());
              dolorA=false;
              status_game="game_2_init:userB";
              setTimer(2 ,"turno"); // Espero que el otro jugador juegue
           
        } else if(status_game.contains("userB")){
               userB.setPosition(posX, posY);
               userB.moveUser(findByPosition(userB.getPosX(),userB.getPosY()).getCharAt(),userB.getPosX(),userB.getPosY());
               dolorB=true;
               status_game="game_2_init:userA";
               setTimer(2 ,"turno"); // Espero que el otro jugador juegue
        }
    }
  } catch (Exception e){
    println("Error: "+e.getMessage() + " " +status_game);
  }
}



void mouseClicked() {
  if(debug){
    println("mouseX: "+mouseX+" mouseY: "+mouseY);
  }
}