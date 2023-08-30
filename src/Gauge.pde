
// [Gauge-0]

class Gauge implements Widget {
  
  
  float data;
  
  String name;
  
  color line_color = default_line_color;
  
  
  int marge = 25;
  
  int xPos;
  int yPos;
  
  int xSize;
  int ySize;
  
  float min;
  float max;
  
  
  
  float arc_marge = 5;
  
  float rayon_out;
  float rayon_in;
  
  float range;
  
  
  int first_bit;
  int last_bit;
  String dataType = "Int";
  String expression = "x";
  
  
  Expression expr = Compile.expression(expression, false);
  
  
  Gauge( int x, int y, int w, int h){
    
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
  }
  float getMax(){
    return max;
  }
  void setMax(float m){
    max = m;
  }
  int getFirstBit(){
    return first_bit;
  }
  void setFirstBit(int b){
    first_bit = b;
  }
  int getLastBit(){
    return last_bit;
  }
  void setLastBit(int b){
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
    
    
    
    if( LoadData( first_bit , last_bit , dataType , expr ) != "NaN" ){
      data =  float(LoadData( first_bit , last_bit , dataType , expr ))   ;
    }
    
    
    
    if(data < min){
      data = min;
    }
    if(data > max){
      data = max;
    }
    range = max - min;
    
    
    stroke(default_line_grad_color);
    
    fill(default_background_color);
    rect(   xPos*size_block      ,    yPos*size_block       ,  xSize*size_block  ,  ySize*size_block  );
    
    fill(default_background_plot_color);
    arc( xPos*size_block + xSize*size_block / 2    ,    yPos*size_block + ySize*size_block - marge     ,  xSize*size_block - 2 * marge ,  2*ySize*size_block - 4 * marge, PI, TWO_PI);
    
    
    float arc_min;
    float arc_max;
    
    if ( data < 0){
      
      arc_max = (-min/range)*PI -PI ;
      
      arc_min =  -PI/2 + (2*(data-min)/range -1)*PI/2 ;
      
    }
    else{
      
      arc_min = (-min/range)*PI -PI ;;
      
      arc_max =  -PI/2 + (2*(data-min)/range -1)*PI/2; 
      
    }
    
    
    fill(line_color);
    arc( xPos*size_block + xSize*size_block / 2    ,    yPos*size_block + ySize*size_block - marge     ,  xSize*size_block - 2 * marge ,  2*ySize*size_block - 4 * marge , arc_min , arc_max );
    
    
    // graduations
    
    int nb_grad = 20;
    float grad_X = range / nb_grad;
    
    
    
    for (int i = 1; i*grad_X < range ; i++){
      
      float zer1 = 0.37 * ( xSize*size_block - 2 * marge );
      float zer2 = 0.37 * ( 2*ySize*size_block - 4 * marge );
      
      line(   xPos*size_block + xSize*size_block / 2    ,     yPos*size_block + ySize*size_block - marge  - 1    ,  (float) ( xPos*size_block + xSize*size_block / 2  + zer1 * Math.cos(-PI + i*PI/nb_grad)  )   , (float) (  yPos*size_block + ySize*size_block - marge  + zer2 * Math.sin(-PI + i*PI/nb_grad)  )    );
      
      
    }
    
    
    // arc de cercle intérieur
    
    
    fill(default_background_color);
    arc( xPos*size_block + xSize*size_block / 2    ,    yPos*size_block + ySize*size_block - marge     ,  xSize*size_block*0.5 ,  2*ySize*size_block*0.5 , PI, TWO_PI);
    
    line( xPos*size_block + xSize*size_block - marge, yPos*size_block + ySize*size_block - marge ,  xPos*size_block + xSize*size_block - xSize*size_block/4  , yPos*size_block + ySize*size_block - marge );
    
    line( xPos*size_block + marge, yPos*size_block + ySize*size_block - marge ,  xPos*size_block + xSize*size_block - 3*xSize*size_block/4   , yPos*size_block + ySize*size_block - marge );
    
    
    // valeurs graduation
    textFont(default_font);
    textAlign(CENTER,CENTER);
    
    
    fill(default_text_grad_color);
    text (  String.valueOf(  Math.round( min ) )   , xPos*size_block + xSize*size_block / 2  -  0.23 * ( xSize*size_block - 2 * marge )    ,     yPos*size_block + ySize*size_block - marge  - 1    );
    text (  String.valueOf(  Math.round( max ) )   , xPos*size_block + xSize*size_block / 2  +  0.23 * ( xSize*size_block - 2 * marge )   ,     yPos*size_block + ySize*size_block - marge  - 1    );
    text (  String.valueOf(  Math.round( min + 0.5*(max-min) ) )   , xPos*size_block + xSize*size_block / 2    ,     yPos*size_block + ySize*size_block - marge  - 1  - 0.25 * ( 2*ySize*size_block - 4 * marge )   );
    
    // affichage valeur actuelle
    
    textFont(big_font);
    fill(line_color);
    text (  String.valueOf(  Math.round( data ) )   , xPos*size_block + xSize*size_block / 2    ,     yPos*size_block + ySize*size_block - marge  - marge/3    );
    
    
    
    stroke(default_line_color);
    
    // contour du widget
    line(xPos*size_block,yPos*size_block,(xPos+xSize)*size_block,yPos*size_block);
    line(xPos*size_block,(yPos+ySize)*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    line(xPos*size_block,yPos*size_block,xPos*size_block,(yPos+ySize)*size_block );
    line( (xPos+xSize)*size_block,yPos*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    
    textFont(title_font);
    textAlign(CENTER,CENTER);
    fill(line_color);
    
    text(   name   ,    xPos*size_block + 0.5*xSize*size_block      ,      yPos*size_block + 0.42 * marge  );
    
    
  
    
    
  }
  
}
