
// [Model3D-0]

class Model3D implements Widget {
  
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String name;
  String filepath = "";
  
  // camera
  float eyeX = 0.0;
  float eyeY = 0.0;
  float eyeZ = 0.0;
  float centerX = 0.0;
  float centerY = 0.0;
  float centerZ = 0.0;
  float upX = 0.0;
  float upY = 0.0;
  float upZ = 0.0;
  
  float test = 0.0;
  
  
  PGraphics model_view;
  
  PShape model;
  
  float model_scale = 1;
  float model_offsetX = 0;
  float model_offsetY = 0;
  float model_offsetZ = 0;
  float model_rotation_offsetX = 0;
  float model_rotation_offsetY = 0;
  float model_rotation_offsetZ = 0;
  
  
  float angle_start_x = PI/2;
  float angle_start_y = -PI/2;
  float angle_start_z = 0;
  
  // rotation of the model
  float rx = 0.0;
  float ry = 0.0;
  float rz = 0.0;


  // arc
  float ax = 0.0;
  float ay = 0.0;
  float az = 0.0;
  float angle_stop_x = 0.0;
  float angle_stop_y = 0.0;
  float angle_stop_z = 0.0;
  
  
  float line_width = 5;
  float arc_size = 100;
  
  int[] first_bit = {-1,-1,-1,-1,-1,-1}; // rx ; ry ; rz ; ax ; ay ; az
  int[] last_bit = {-1,-1,-1,-1,-1,-1};
  String[] dataType = {"Int","Int","Int","Int","Int","Int"};
  String[] expression = {"x","x","x","x","x","x"};
  
  
  Expression[] expr = { Compile.expression(expression[0], false) , Compile.expression(expression[1], false) , Compile.expression(expression[2], false) , Compile.expression(expression[3], false) , Compile.expression(expression[4], false) , Compile.expression(expression[5], false) } ;
  
  
  Model3D( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    
    model_view = createGraphics( xSize*size_block - 1 , ySize*size_block - 1 ,P3D);
    
    
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
  String getFilePath(){
    return filepath;
  }
  void setFilePath(String n){
    filepath = n;
  }
  float getScale(){
    return model_scale;
  }
  void setScale(float f){
    if( filepath != "" ){
      model.scale(  f/model_scale  );
    }
    
    model_scale = f;
  }
  void setModel(){
    
    //model = model_view.loadShape("Belisama_wavefront.obj");
    model = model_view.loadShape(filepath);
    
    
    if( filepath != "" ){
      model.scale(  model_scale  );
      model.translate( model_offsetX , model_offsetY , model_offsetZ );
    }
    
    
  }
  
  
  
  int getFirstBit(int n){
    return first_bit[n];
  }
  void setFirstBit(int n, int val){
    first_bit[n] = val;
  }
  int getLastBit(int n){
    return last_bit[n];
  }
  void setLastBit(int n, int val){
    last_bit[n] = val;
  }
  String getExpression( int n){
    return expression[n];
  }
  void setExpression( int n, String exprt){
    expression[n] = exprt;
    expr[n] = Compile.expression(expression[n], false);
  }
  int getDataType(int n){
    
    if( dataType[n] == "Int"){
      return 0;
    }
    if( dataType[n] == "Float"){
      return 1;
    }
    if( dataType[n] == "Half Float"){
      return 2;
    }
    return 0;
  }
  void setDataType(int n,int t){
    if( t == 0 ){
      dataType[n] = "Int";
    }
    if( t == 1 ){
      dataType[n] = "Float";
    }
    if( t == 2 ){
      dataType[n] = "Half Float";
    }
  }
  
  
  float getOffset( int n ){
    if( n == 0 ){
      return model_offsetX;
    }
    if( n == 1 ){
      return model_offsetY;
    }
    if( n == 2 ){
      return model_offsetZ;
    }
    
    return 0.0;
  }
  
  void setOffset( int n, float val ){
    if( n == 0 ){
      model_offsetX = val;
    }
    if( n == 1 ){
      model_offsetY = val;
    }
    if( n == 2 ){
      model_offsetZ = val;
    }
  }
  
  
  float getRotationOffset( int n ){
    if( n == 0 ){
      return model_rotation_offsetX;
    }
    if( n == 1 ){
      return model_rotation_offsetY;
    }
    if( n == 2 ){
      return model_rotation_offsetZ;
    }
    
    return 0.0;
  }
  
  void setRotationOffset( int n, float val ){
    if( n == 0 ){
      model_rotation_offsetX = val;
    }
    if( n == 1 ){
      model_rotation_offsetY = val;
    }
    if( n == 2 ){
      model_rotation_offsetZ = val;
    }
  }
  
  
  
  float getCamData(int n){
    if(n == 0){
      return eyeX;
    }
    if(n == 1){
      return eyeY;
    }
    if(n == 2){
      return eyeZ;
    }
    if(n == 3){
      return centerX;
    }
    if(n == 4){
      return centerY;
    }
    if(n == 5){
      return centerZ;
    }
    if(n == 6){
      return upX;
    }
    if(n == 7){
      return upY;
    }
    if(n == 8){
      return upZ;
    }
    return 0.0;
  }
  
  void setCamData(int n, float val){
    if(n == 0){
      eyeX = val;
    }
    if(n == 1){
      eyeY = val;
    }
    if(n == 2){
      eyeZ = val;
    }
    if(n == 3){
      centerX = val;
    }
    if(n == 4){
      centerY = val;
    }
    if(n == 5){
      centerZ = val;
    }
    if(n == 6){
      upX = val;
    }
    if(n == 7){
      upY = val;
    }
    if(n == 8){
      upZ = val;
    }
  }
  
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    
    model_view = createGraphics( xSize*size_block - 1 , ySize*size_block - 1 ,P3D);
  }



  void display() {
    
    if( LoadData( first_bit[0] , last_bit[0] , dataType[0] , expr[0] ) != "NaN" ){
      rx = float(LoadData( first_bit[0] , last_bit[0] , dataType[0] , expr[0] )) ;
    }
    if( LoadData( first_bit[1] , last_bit[1] , dataType[1] , expr[1] ) != "NaN" ){
      ry = float(LoadData( first_bit[1] , last_bit[1] , dataType[1] , expr[1] )) ;
    }
    if( LoadData( first_bit[2] , last_bit[2] , dataType[2] , expr[2] ) != "NaN" ){
      rz = float(LoadData( first_bit[2] , last_bit[2] , dataType[2] , expr[2] )) ;
    }
    

    if( LoadData( first_bit[3] , last_bit[3] , dataType[3] , expr[3] ) != "NaN" ){
      ax = float(LoadData( first_bit[3] , last_bit[3] , dataType[3] , expr[3] )) ;
    }
    if( LoadData( first_bit[4] , last_bit[4] , dataType[4] , expr[4] ) != "NaN" ){
      ay = float(LoadData( first_bit[4] , last_bit[4] , dataType[4] , expr[4] )) ;
    }
    if( LoadData( first_bit[5] , last_bit[5] , dataType[5] , expr[5] ) != "NaN" ){
      az = float(LoadData( first_bit[5] , last_bit[5] , dataType[5] , expr[5] )) ;
    }
    
    
    model_view.shapeMode(CENTER);
    model_view.beginDraw();
    model_view.background( default_background_color );
    
    
    model_view.camera(  eyeX , eyeY , eyeZ , centerX , centerY , centerZ , upX , upY , upZ );
    
    model_view.rotateZ(PI);
    
    
    if( filepath != "" ){
      model_view.pushMatrix();
      
      
      model_view.stroke( color(255,0,0) );
      model_view.strokeWeight(3);
      model_view.line( 0 , 0 , 0 , 10 , 0 , 0 );
      model_view.stroke( color(0,255,0) );
      model_view.line( 0 , 0 , 0 , 0 , 10 , 0 );
      model_view.stroke( color(0,0,255) );
      model_view.line( 0 , 0 , 0 , 0 , 0 , 10 );
      model_view.strokeWeight(1);
      
      
      
      rx = rx + 3; // a enlever
      
      model_view.translate( -model_offsetX , -model_offsetY , -model_offsetZ ); // position of the model
      model_view.rotateX( radians( rx ) );
      model_view.rotateY( radians( ry ) );
      model_view.rotateZ( radians( rz ) );
      model_view.translate( -model_rotation_offsetX - model_offsetX , -model_rotation_offsetY - model_offsetY , -model_rotation_offsetZ - model_offsetZ );  // center of rotation
      
      model_view.shape(model, 0 , 0 );
      
      
      
      model_view.popMatrix();
    }
    
    
    angle_stop_x = map( ax  , -1 , 1 , -PI , PI );
    angle_stop_y = map( ay  , -1 , 1 , -PI , PI );
    angle_stop_z = map( az  , -1 , 1 , -PI , PI );
    
    // arc -----------------------
       
    model_view.noFill();
    model_view.strokeWeight(5);
    
    model_view.pushMatrix();
    model_view.stroke(255, 0, 0);
    model_view.translate(0,0,0);
    if (angle_stop_x > 0){
      model_view.arc(0, 0, arc_size,arc_size, angle_start_x , angle_stop_x + angle_start_x );
    }else{
      model_view.arc(0, 0, arc_size,arc_size, angle_start_x + angle_stop_x , angle_start_x );
    }
    model_view.popMatrix();
       
    model_view.pushMatrix();
    model_view.stroke(0, 255, 0);
    model_view.translate(0,0,0);
    model_view.rotateX(PI*0.5);
    if (angle_stop_y > 0){
      model_view.arc(0, 0, arc_size,arc_size, angle_start_y , angle_stop_y + angle_start_y );
    }else{
      model_view.arc(0, 0, arc_size,arc_size, angle_start_y + angle_stop_y , angle_start_y );
    }
    model_view.popMatrix();
    
    model_view.pushMatrix();
    model_view.stroke(0, 0, 255);
    model_view.translate(0,0,0);
    model_view.rotateY(PI*0.5);
    if (angle_stop_z > 0){
      model_view.arc(0, 0, arc_size,arc_size, angle_start_z , angle_stop_z + angle_start_z );
    }else{
      model_view.arc(0, 0, arc_size,arc_size, angle_start_z + angle_stop_z , angle_start_z );
    }
    model_view.popMatrix();
    
    
    
    
    model_view.endDraw();
    
    image( model_view , xPos*size_block + 1 , yPos*size_block + 1 );
    
    textFont(title_font);
    textAlign(CENTER,CENTER);
    fill( default_line_color );
    text(   name   ,    xPos*size_block + 0.5*xSize*size_block      ,      yPos*size_block + 10   );
    
    
    
    // contour du widget
    stroke(default_line_color);
    line(xPos*size_block,yPos*size_block,(xPos+xSize)*size_block,yPos*size_block);
    line(xPos*size_block,(yPos+ySize)*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    line(xPos*size_block,yPos*size_block,xPos*size_block,(yPos+ySize)*size_block );
    line( (xPos+xSize)*size_block,yPos*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    
    
    
    
  }
  
  
  
}
