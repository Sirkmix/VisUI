
// [Bar-0]

class Bar implements Widget {
  
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
  
  
  int marge = 25;
  
  float min;
  float max;
  
  
  
  
  
  float margeX_gauche = 1.5*marge;
  float margeX_droite = 0.5*marge;
  
  float margeY_haut = 1*marge;
  float margeY_bas = 0.5*marge;
  
  float range;
  
  
  Bar( int x, int y, int w, int h){
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
  float getMin(){
    return min;
  }
  void setMin(float m){
    min = m;
    range = max - min;
  }
  float getMax(){
    return max;
  }
  void setMax(float m){
    max = m;
    range = max - min;
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
  
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
  }



  void display() {
    
    
    
    fill( 80,220,80 );
    stroke( 40 , 223 , 65 );
    rect( xPos * size_block , yPos * size_block, xSize * size_block , ySize * size_block );
    
    if( LoadData( first_bit , last_bit , dataType, expr ) != "NaN" ){
      data = float(LoadData( first_bit , last_bit , dataType , expr ))   ;
    }
    
    
    
    
    
    if(data < min){
      data = min;
    }
    if(data > max){
      data = max;
    }
    
    
    
    stroke(default_line_color);
    fill(default_background_color);
    rect(   xPos*size_block      ,    yPos*size_block       ,  xSize*size_block  ,  ySize*size_block  );
    
    fill(default_background_plot_color);
    rect(   xPos*size_block + margeX_gauche      ,    yPos*size_block + margeY_haut       ,  xSize*size_block - margeX_droite - margeX_gauche ,  ySize*size_block - margeY_bas - margeY_haut );
    
    
    
    textFont(title_font);
    textAlign(CENTER,CENTER);
    fill(line_color);
    
    text(   name   ,    xPos*size_block + margeX_gauche + (xSize*size_block - margeX_droite - margeX_gauche)*0.5      ,      yPos*size_block + 0.42 * margeY_haut  );
    
    
    
    rect(   xPos*size_block + margeX_gauche      ,   yPos*size_block + ySize*size_block - margeY_bas       ,  xSize*size_block - margeX_droite - margeX_gauche ,  -(data-min)*(ySize*size_block - margeY_bas - margeY_haut)/range   );
    
    float grad_grande = range/(  (float) 5*ySize);
    float grad_petite = grad_grande/(1+ySize);
    
    int size_grad_grande = 15*xSize;
    int size_grad_petite = 5*xSize;
    
    stroke(default_line_grad_color);
    
    for (int j = 0; Math.round((j-1)*grad_grande) < range ; j++){
      
      line(  xPos*size_block + margeX_gauche  ,  yPos*size_block + (ySize*size_block - 1*margeY_haut - 1*margeY_bas - 1)*(  1  -  j*grad_grande/range  ) + margeY_haut - 0  ,   xPos*size_block + margeX_gauche + size_grad_grande  ,    yPos*size_block + (ySize*size_block - 1*margeY_haut - 1*margeY_bas - 1 )*(  1  -  j*grad_grande/range  ) + margeY_haut - 0   );
      
      
      
      fill(default_text_grad_color);
      
      textFont(default_font);
      String yLabel = String.valueOf(  Math.round(j*grad_grande + min) );
      text(  yLabel   ,    xPos*size_block + 0.5*margeX_gauche      ,      yPos*size_block + (ySize*size_block - 1*margeY_haut - 1*margeY_bas - 1)*(  1  -  j*grad_grande/range  ) + margeY_haut - 0    ); 
      
      
      
      
      
      for (int k = 1; (k)*grad_petite < grad_grande  && Math.round(j*grad_grande) < range ; k++){
        
        line(  xPos*size_block + margeX_gauche ,  yPos*size_block + (ySize*size_block - 1*margeY_haut - 1*margeY_bas - 1)*(  1  -  j*grad_grande/range  - k*grad_petite/range) + margeY_haut    ,   xPos*size_block + margeX_gauche + size_grad_petite  ,    yPos*size_block + (ySize*size_block - 1*margeY_haut - 1*margeY_bas - 1)*(  1  -  j*grad_grande/range  - k*grad_petite/range) + margeY_haut    );
        
        
      }
      
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  }
  
}
