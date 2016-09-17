class Layer{
  PImage image;
  Movie video;
  String label;
  float posXImage;
  float posYImage;
  float sizeXImage;
  float sizeYImage;

  float posXVideo;
  float posYVideo;
  float sizeXVideo;
  float sizeYVideo;

  Layer(float posX, float posY, PImage image, String label, float sizeX, float sizeY){
    this.posXImage = posX;
    this.posYImage = posY;
    this.image = image;
    this.label = label;
    this.sizeXImage = sizeX;
    this.sizeYImage = sizeY;
  }

  Layer(float posX, float posY, Movie video, String label, float sizeX, float sizeY){
    this.posXVideo = posX;
    this.posYVideo = posY;
    this.video = video;
    this.label = label;
    this.sizeXVideo = sizeX;
    this.sizeYVideo = sizeY;
  }

  void paintImage(){
    //println("Layer:"+label+" X:"+posX+" Y:"+posY);
    image(image, posXImage, posYImage, sizeXImage, sizeYImage);
  }

  void paintVideo(){
    //println("Layer:"+label+" X:"+posXVideo+" Y:"+posYVideo);
    //video.loop();
    video.play();
    image(video, posXVideo, posYVideo, sizeXVideo, sizeYVideo);
  }

  PImage getImage(){
    return this.image;
  }
  
  String getLabel(){
    return this.label;
  }

  Movie getVideo(){
    return this.video;
  }
}