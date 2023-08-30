
// [Compass-0]

class Compass implements Widget {
  
  
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String name;
  
  float data;
  
  
  int first_bit;
  int last_bit;
  String dataType = "Int";
  String expression = "x";
  
  Expression expr = Compile.expression(expression, false);
  
  
  color line_color = default_line_color;
  
  
  float marge_circle = 0.72;
  float text_offset = 0.57;
  float margeY_haut = 7;
  
  boolean hide_dir = false;
  
  
  Compass( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
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
  color getColor(){
    return line_color;
  }
  void setColor(color c){
    line_color = c;
  }
  
  int getFirstBit(){
    return first_bit;
  }
  void setFirstBit( int b){
    first_bit = b;
  }
  int getLastBit(){
    return last_bit;
  }
  void setLastBit( int b){
    last_bit = b;
  }
  String getExpression(){
    return expression;
  }
  void setExpression( String exprt){
    expression = exprt;
    expr = Compile.expression(expression, false);
  }
  int getDataType(){
    
    if( dataType == "Int"){
      return 0;
    }
    if( dataType == "Float"){
      return 1;
    }
    if( dataType == "Half Float"){
      return 2;
    }
    return 0;
  }
  void setDataType(int t){
    if( t == 0 ){
      dataType = "Int";
    }
    if( t == 1 ){
      dataType = "Float";
    }
    if( t == 2 ){
      dataType = "Half Float";
    }
  }
  
  boolean getHideDir(){
    return hide_dir;
  }
  void setHideDir( boolean b ){
    hide_dir = b;
  }
  
  
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
  }
  
  
  void display() {
    
    if( hide_dir == true ){
      marge_circle = 0.85;
    }
    
    
    
    data = -PI/2;
    if( LoadData( first_bit , last_bit , dataType, expr ) != "NaN" ){
      data = float(LoadData( first_bit , last_bit , dataType , expr ))   ;
    }
    
    
    
    stroke(default_line_color);
    fill(default_background_color);
    rect(   xPos*size_block      ,    yPos*size_block       ,  xSize*size_block  ,  ySize*size_block  );
    
    
    textFont(title_font);
    textAlign(CENTER,CENTER);
    fill(line_color);
    
    text(   name   ,    xPos*size_block + ( xSize*size_block )*0.5      ,      yPos*size_block + 10  );
    
    
    
    ellipseMode(CENTER);
    noFill();
    stroke(default_line_grad_color);
    ellipse( xPos*size_block + 0.5 * xSize*size_block , margeY_haut + yPos*size_block + 0.5 * ySize*size_block, marge_circle*min( xSize*size_block , ySize*size_block ), marge_circle*min( xSize*size_block , ySize*size_block ) );
    
    stroke(default_line_color);
    fill(default_line_color);
    ellipse( xPos*size_block + 0.5 * xSize*size_block , margeY_haut + yPos*size_block + 0.5 * ySize*size_block, 0.05*min( xSize*size_block , ySize*size_block ), 0.05*min( xSize*size_block , ySize*size_block ) );
    
    
    
    strokeWeight(4);
    line( xPos*size_block + 0.5 * xSize*size_block , margeY_haut + yPos*size_block + 0.5 * ySize*size_block, xPos*size_block + 0.5 * xSize*size_block + 0.5*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(data) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + 0.5*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(data)  );
    strokeWeight(1);
    
    if( hide_dir == false ){
      fill(default_line_grad_color);
      text(   "E"    ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 0 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 0 * PI/4)  );
      text(   "SE"   ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 1 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 1 * PI/4)  );
      text(   "S"    ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 2 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 2 * PI/4)  );
      text(   "SO"   ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 3 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 3 * PI/4)  );
      text(   "O"    ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 4 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 4 * PI/4)  );
      text(   "NO"   ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 5 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 5 * PI/4)  );
      text(   "N"    ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 6 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 6 * PI/4)  );
      text(   "NE"   ,    xPos*size_block + 0.5 * xSize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * cos(0 + 7 * PI/4) , margeY_haut + yPos*size_block + 0.5 * ySize*size_block + text_offset*marge_circle*min( xSize*size_block , ySize*size_block ) * sin(0 + 7 * PI/4)  );
    }
    
  
  }
  
}
