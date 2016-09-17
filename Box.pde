class Box {
  int indexMatrizX;
  int indexMatrizY;
  float posX;
  float posY;
  int sizeX;
  int sizeY;
  char charAt;
  boolean available = false;
  ArrayList urlVideos = new ArrayList();
  ArrayList<Movie> movies = new ArrayList<Movie>();

  /**
  Constructor
  */
  public Box(float posX,float posY,int sizeX,int sizeY, char sCharAt){
    this.posX=posX;
    this.posY=posY;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    this.charAt=sCharAt;
  }

  void paintBox(){
    rect(posX,posY,sizeX,sizeY);
  }

  void addMovie(String sUrl){
    urlVideos.add(sUrl);
  }

  /**
  En caso que no funcione el mapping
  */
  boolean isCoordXY(float x, float y){
    println("X: "+x+" Y: "+y);
    boolean resultado=false;
    
    if(x>=posX && x<=posX+sizeX){
      if(y>=posY && x<=posY+sizeY){
      resultado=true;    
      }
    }
    
    return resultado;
  }
  /*
  Metodo que verifia que el mapping es
  */
  boolean isCharAt(char charAt){
    if(this.charAt==charAt){
      return true;
    }
    return false;
  } 
  
  float getPosX(){
    return this.posX;
  }
  
  float getPosY(){
    return this.posY;
  }

  int getSizeX(){
    return this.sizeX;
  }
  
  int getSizeY(){
    return this.sizeY;
  }
  
  char getCharAt(){
    return this.charAt;
  }
  
  boolean isAvailable(){
    return available;
  }
  
  
  ArrayList getUrlVideos(){
    return urlVideos;
  }
  
  ArrayList getMovies(){
    return movies;
  }

  void setAvailable(boolean estado){
    this.available = estado ;
  }

}