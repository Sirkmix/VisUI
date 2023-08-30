

// [Video-0]

class Video implements Widget {
  
  
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  
  String name;
  
  int actuCam;
  
  Capture cam;
  String[] camList = Capture.list();
  
  
  Video( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    
    camList = Capture.list();
    
    println( camList.length );
    if (camList.length != 0) {
      cam = new Capture( sketchRef , camList[0]);
      cam.start(); 
      
    }
    
  }
  
  int getXPos(){
    return xPos;
  }
  int getYPos(){
    return yPos;
  }
  int getXSize(){
    return xSize;
  }
  int getYSize(){
    return ySize;
  }
  String getName(){
    return name;
  }
  void setName(String n){
    name = n;
  }
  
  void nextCam(){
    
    camList = Capture.list();
    
    if( actuCam >= camList.length-1 ){
      actuCam = 0;
    }
    else{
      actuCam = actuCam + 1;
    }
    
    cam.stop(); 
    cam = new Capture( sketchRef , camList[actuCam]);
    cam.start(); 
    
  }
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
  }
  
  
  
  
  void display() {
    
    fill( 0,0,0 );
    stroke( default_line_color );
    rect( xPos * size_block , yPos * size_block, xSize * size_block , ySize * size_block );
    
    textFont(big_font);
    fill(default_line_color);
    textAlign(CENTER);
    text("No camera available" , ( xPos + 0.5 * xSize ) * size_block , ( yPos + 0.5 * ySize ) * size_block );
    
    try{
      
      cam.read();
      image(cam,  xPos * size_block , yPos * size_block, xSize * size_block , ySize * size_block );
    
    }catch( Exception e){
    }
    
    
    
    
    
    
    textFont(title_font);
    fill(default_line_color);
    textAlign(CENTER);
    text(name , ( xPos + 0.5 * xSize ) * size_block , yPos * size_block + 25 );
    
    noFill( );
    stroke( default_line_color );
    rect( xPos * size_block , yPos * size_block, xSize * size_block , ySize * size_block );
    
  }
  
  
}
