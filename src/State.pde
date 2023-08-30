
// [State-0]

class State implements Widget {
  
  
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String name;
  
  float data;
  
  StringList stateList;
  
  int first_bit;
  int last_bit;
  String dataType = "Int";
  String expression = "x";
  
  Expression expr = Compile.expression(expression, false);
  
  color[] line_color = { default_line_color , default_line_grad_color };
  
  
  int marge = 25;
  
  boolean hideTitle = false;
  boolean hideInactiveState = false;
  
  
  
  
  State( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    
    stateList = new StringList();
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
  color getColor( int n){
    return line_color[n];
  }
  void setColor(int n ,color c){
    line_color[n] = c;
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
  
  void addState( String st ){
    stateList.append( st );
  }
  String getState( int n){
    return stateList.get(n);
  }
  
  int getStateSize(){
    return stateList.size() ;
  }
  
  void setHideTitle( boolean b ){
    hideTitle = b;
  }
  boolean getHideTitle(){
    return hideTitle;
  }
  void setHideInactiveState( boolean b ){
    hideInactiveState = b;
  }
  boolean getHideInactiveState(){
    return hideInactiveState;
  }
  void clearState(){
    stateList = new StringList();
  }
  
  
  
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
  }



  void display() {
    
    
    int n = stateList.size();
    int ActiveStateHeight;
    int InactiveStateHeight;
    int OffsetY = 0;
    
    if( LoadData( first_bit , last_bit , dataType, expr ) != "NaN" ){
      data =  float(LoadData( first_bit , last_bit , dataType , expr ))    ;
    }
    if( data > stateList.size() ){
      data = 0;
    }
    if( data < 0 ){
      data = 0;
    }
    
    
    fill( default_background_color );
    stroke( default_line_color );
    rect( xPos * size_block , yPos * size_block, xSize * size_block , ySize * size_block );
    
    
    
    if( hideTitle == false ){
      
      OffsetY = marge;
      InactiveStateHeight = ((size_block * ySize) - OffsetY ) / ( n + 1 ) ;
      ActiveStateHeight = 2 * InactiveStateHeight ;
      
      textFont(title_font);
      fill(default_line_color);
      textAlign(CENTER);
      text(name , ( xPos + 0.5 * xSize ) * size_block , yPos * size_block + 0.8*marge );
      
    }
    else{
      
      InactiveStateHeight = ((size_block * ySize) ) / ( n + 1 ) ;
      ActiveStateHeight = 2 * InactiveStateHeight ;
      
    }
    
    
    if( hideInactiveState == true ){
      
      InactiveStateHeight = 0;
      
      fill( line_color[0] );
      
      if( hideTitle == false ){
        
        ActiveStateHeight = (size_block * ySize) - OffsetY ;
        
        
        rect( xPos * size_block , yPos * size_block + OffsetY , xSize * size_block , ActiveStateHeight );
        
        
        fill( 0 , 0 , 0 );
        textFont(big_font);
        textAlign(CENTER, CENTER);
        text( stateList.get( int(data) ) , (xPos + 0.5*xSize) * size_block , yPos * size_block + OffsetY + 0.5*ActiveStateHeight  );
        
      }
      else{
        ActiveStateHeight = size_block * ySize ;
        rect( xPos * size_block , yPos * size_block , xSize * size_block , ActiveStateHeight );
        
        fill( 0 , 0 , 0 );
        textFont(big_font);
        textAlign(CENTER, CENTER);
        text( stateList.get( int(data) ) , (xPos + 0.5*xSize) * size_block , yPos * size_block + OffsetY + 0.5*ActiveStateHeight );
        
      }
    }
    else{
      
      for( int i = 0 ; i < n ; i++ ){
        
        // if active state
        if( data == i ){
          
          fill( line_color[0] );
          rect( xPos * size_block , yPos * size_block + OffsetY , xSize * size_block , ActiveStateHeight );
          
          
          fill( 0 , 0 , 0 );
          textFont(big_font);
          textAlign(CENTER, CENTER);
          text( stateList.get( int(i) ) , (xPos + 0.5*xSize) * size_block , yPos * size_block + OffsetY + 0.5*ActiveStateHeight );
          
          
          OffsetY = OffsetY + ActiveStateHeight;
        }
        // if inactive state
        else{
          
          fill( line_color[1] );
          rect( xPos * size_block , yPos * size_block + OffsetY , xSize * size_block , InactiveStateHeight );
          
          
          fill( 0 , 0 , 0 );
          textFont(big_font);
          textAlign(CENTER, CENTER);
          text( stateList.get( int(i) ) , (xPos + 0.5*xSize) * size_block , yPos * size_block + OffsetY + 0.5*InactiveStateHeight );
          
          
          
          OffsetY = OffsetY + InactiveStateHeight;
          
        }
        
      }
      
      
      
    }
    
    
    
    
    
    
  }
  
  
  
  
  
  
  
}
