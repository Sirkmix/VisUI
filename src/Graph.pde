
// [Graph-0]

class Graph implements Widget {
  
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String name;
  
  
  int[] first_bit = {-1,-1,-1,-1};
  int[] last_bit = {-1,-1,-1,-1};
  String[] dataType = {"Int","Int","Int","Int"};
  String[] expression = {"x","x","x","x"};
  
  Expression[] expr = { Compile.expression(expression[0], false) , Compile.expression(expression[1], false) , Compile.expression(expression[2], false) , Compile.expression(expression[3], false) } ;
  
  int nb_data = 1;
  
  color[] line_color = { default_line_color , color(94,146,255) , color(50,185,85) , color(255,255,89) };
  
  
  int marge = 25;
  
  
  
  float max_data;
  float min_data;
  
  float range_data;
  float min_range = 10^-6;
  
  float rangeT = 30;
  
  boolean show0 = false;
  
  
  FloatList[] data = new FloatList[2];
  
  
  
  Graph( int x, int y, int w, int h){
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
  float getTimeData(){
    return rangeT;
  }
  void setTimeData(float t){
    rangeT = t;
  }
  int getNbData(){
    return nb_data;
  }
  void setNbData(int n){
    nb_data = n;
    data = new FloatList[2*nb_data];
    for(int i = 0; i < data.length; i++) {
      FloatList fl = data[i] = new FloatList();
      fl.append(time);
    }
  }
  color getColor(int n){
    return line_color[n];
  }
  void setColor(int n, color c){
    line_color[n] = c;
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
  boolean getShow0(){
    return show0;
  }
  void setShow0( boolean s ){
    show0 = s;
  }
  
  
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
  }
  

  void display() {
    
    
    
    // a modif
    for( int i = 0; i < nb_data; i++ ){
      
      
      //println( first_bit[i] + "    " + last_bit[i] + "    " + LoadData( first_bit[i] , last_bit[i] ) + "    " + LoadData( first_bit[i] , last_bit[i] )   );
      if( LoadData( first_bit[i] , last_bit[i] , dataType[i] , expr[i] ).equals("NaN") == false ){
        data[2*i].append( (float) millis()/1000 );
        data[2*i+1].append(       float(LoadData( first_bit[i] , last_bit[i] , dataType[i] , expr[i]  ) )       );
      }
      
    }
    
    //println(LoadData( first_bit[0] , last_bit[0] ) );
    //printArray(data);
    
    
    
    
    
    for (int j = 0; j < nb_data; j++ ){
      
      
      for (int i = 0; i < data[2*j].size()-1; i++) {
        
        if (data[2*j].get(i) < time -  rangeT ) {
          
          data[2*j].remove(i); // time
          data[2*j + 1].remove(i); // data
          
        }
        
      }
      
    }
    
    
    // min max et range
    
    max_data = data[2*nb_data-1].max();
    min_data = data[2*nb_data-1].min();
    
    for (int i = 0; i < nb_data; i++ ){
      
      if( max_data < data[2*i+1].max() ){
        max_data = data[2*i+1].max();
      }
      
      if( min_data > data[2*i+1].min() ){
        min_data = data[2*i+1].min();
      }
      
    }
    if( show0 ){
      if( min_data > 0 ){
        min_data = 0;
      }
      if( max_data < 0 ){
        max_data = 0;
      }
    }
    
    
    range_data = max_data - min_data;
    if (range_data < min_range){
      range_data = min_range;
    }
    
    
    
    fill(default_background_color);
    rect(   xPos*size_block      ,    yPos*size_block       ,  xSize*size_block  ,  ySize*size_block  );
    
    fill(default_background_plot_color);
    rect(   xPos*size_block + 2*marge      ,    yPos*size_block + marge       ,  xSize*size_block - 2*marge  ,  ySize*size_block - 2*marge );
    
    
    textFont(title_font);
    textAlign(CENTER,CENTER);
    
    fill(default_line_color);
    
    text(   name   ,    xPos*size_block + 2*marge + (xSize*size_block - 2*marge)*0.5      ,      yPos*size_block + 0.42 * marge  ); 
    
    
    
    // plot
    
    // ligne verticale
    
    float grad_X = (float) Math.round(100*rangeT/5)/100;
    
    //float grad_X = 4.0;
    
    
    
    for(int j = 1; (float) j*grad_X < rangeT; j++){
      
      
      stroke(default_line_grad_color);
      
      line( xPos*size_block + (xSize*size_block - 2*marge) * ( 1 - j*grad_X/rangeT ) + 2*marge    ,   yPos*size_block + marge    ,   xPos*size_block + (xSize*size_block - 2*marge) * ( 1 - j*grad_X/rangeT ) + 2*marge  ,   yPos*size_block + ySize*size_block  - marge );
      
      
      
      fill(default_text_grad_color);
      
      String xLabel = String.valueOf(j*grad_X);
      textFont(default_font);
      text(   xLabel   ,    xPos*size_block + (xSize*size_block - 2*marge) * ( 1 - j*grad_X/rangeT ) + 2*marge       ,      yPos*size_block + ySize*size_block  - 0.6*marge); 
      
    }
    
    
    
    
    
    
    
    // ligne horizontale
    
    
    float grad_Y =  5 * ( (float) Math.pow(10, (int) Math.floor( Math.log10(range_data) ) - 1 ) );
    
    if (grad_Y/range_data < 0.1){
      
      grad_Y =  10 * ( (float) Math.pow(10, (int) Math.floor( Math.log10(range_data) ) - 1 ) );
      
    }
    
    
    
    int j_begin = (int) Math.floor(min_data/grad_Y);
    
    
    
    for(int j = j_begin+1;  j*grad_Y < range_data + min_data    ; j++){
      
      stroke(default_line_grad_color);
      
      line( xPos*size_block + 2*marge  ,   yPos*size_block + (ySize*size_block - 2 * marge) * ( 1  -  (j*grad_Y-min_data)/(range_data-0*min_data))  + marge  ,   xPos*size_block + xSize*size_block - 0*marge  ,   yPos*size_block + (ySize*size_block - 2 * marge )  *  ( 1  -  (j*grad_Y-min_data)/(range_data-0*min_data))  + marge );
      
      textFont(default_font);
      
      fill(default_text_grad_color);
      
      String yLabel = String.valueOf(j*grad_Y);
      text(   yLabel   ,    xPos*size_block + 1*marge       ,      yPos*size_block + (ySize*size_block - 2 * marge) * ( 1  -  (j*grad_Y-min_data)/(range_data-0*min_data))  + marge    ); 
    }
  
  
  
  // affichage graph
  
  
    for (int i = 0; i < nb_data; i++ ){
      
      stroke(line_color[i]);
      
      for(int j = 1; j < data[2*i+1].size() ; j++ ){
        
        line( xPos*size_block      +   (  (float) ( (  data[2*i].get(j-1) - (time - rangeT) ) *  float(xSize*size_block-2*marge)  )/rangeT  )    +     2*marge  ,    yPos*size_block + (ySize*size_block -2*marge)*(  1  -   (data[2*i+1].get(j-1)-min_data)/range_data ) + marge   ,  xPos*size_block      +    (  (  (float) ( (  data[2*i].get(j) - (time - rangeT)  ) *  float(xSize*size_block-2*marge)  )/rangeT  ) )      +     2*marge   ,   yPos*size_block + (ySize*size_block-2*marge)*(  1  -   (data[2*i+1].get(j)-min_data)/range_data  ) + marge    );
        
        
        
      }
      
      
      
      
    }
    
    stroke(default_line_color);
    
    // contour du graph
    line(  xPos*size_block + 2*marge  ,  yPos*size_block + marge       ,  xPos*size_block + xSize*size_block  ,  yPos*size_block + marge  );
    line(  xPos*size_block + 2*marge  ,  yPos*size_block + ySize*size_block - marge       ,  xPos*size_block + xSize*size_block  ,  yPos*size_block + ySize*size_block - marge  );
    line(  xPos*size_block + 2*marge  ,  yPos*size_block + marge       ,  xPos*size_block + 2*marge  ,  yPos*size_block + ySize*size_block - marge  );
    line(  xPos*size_block + xSize*size_block  ,  yPos*size_block + marge       ,  xPos*size_block + xSize*size_block  ,  yPos*size_block + ySize*size_block - marge   );
    
    
    // contour du widget
    line(xPos*size_block,yPos*size_block,(xPos+xSize)*size_block,yPos*size_block);
    line(xPos*size_block,(yPos+ySize)*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    line(xPos*size_block,yPos*size_block,xPos*size_block,(yPos+ySize)*size_block );
    line( (xPos+xSize)*size_block,yPos*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    
    
    
    
    
    
    
  }
  
}




//------------------------------------------------------------------------------------------------------------------------------------------------------------




class Graph_XY implements Widget {
  
  
  String name;
  
  color line_color = default_line_color ;
  
  
  int marge = 25;
  
  int xPos;
  int yPos;
  
  int xSize;
  int ySize;
  
  float max_data_x;
  float min_data_x;
  float max_data_y;
  float min_data_y;
  
  float range_data_x;
  float range_data_y;
  float min_range = 2;
  
  float rangeT = 30;
  boolean show0;
  
  int[] first_bit = {-1,-1};
  int[] last_bit = {-1,-1};
  String[] dataType = {"int","int"};
  String[] expression = {"x","x"};
  
  Expression[] expr = { Compile.expression(expression[0], false) , Compile.expression(expression[1], false) } ;
  
  
  FloatList[] data = new FloatList[2];
  
  Graph_XY(int x, int y, int w, int h){
    
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;

    
    
    data = new FloatList[3];
    for(int i = 0; i < data.length; i++) {
      FloatList fl = data[i] = new FloatList();
      fl.append(0);
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
  float getTimeData(){
    return rangeT;
  }
  void setTimeData(float t){
    rangeT = t;
  }
  color getColor(){
    return line_color;
  }
  void setColor(color c){
    line_color = c;
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
  
  float getRangeTime(){
    return rangeT;
  }
  boolean getShow0(){
    return show0;
  }
  void setShow0( boolean s ){
    show0 = s;
  }
  
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
  }
  
  
  void display(){
    
    if( LoadData( first_bit[0] , last_bit[0] , dataType[0] , expr[0] ) != "NaN" && LoadData( first_bit[1] , last_bit[1] , dataType[1] , expr[1] ) != "NaN" ){
      data[0].append( time );
      data[1].append(       float(LoadData( first_bit[0] , last_bit[0] , dataType[0] , expr[0]  ) )          );
      data[2].append(       float(LoadData( first_bit[1] , last_bit[1] , dataType[1] , expr[1]  ) )          );
    }
    
    
    for (int i = 0; i < data[0].size(); i++) {
      
      if (data[0].get(i) < time -  rangeT ) {
        
        data[0].remove(i); // time
        data[1].remove(i); // data x
        data[2].remove(i); // data y
      }
      
      
    }
    
    
    
    // min max et range
    
    try{
      
      max_data_x = data[1].max();
      min_data_x = data[1].min();
    
      max_data_y = data[2].max();
      min_data_y = data[2].min();
     
    }catch(RuntimeException e){
      
      max_data_x = 1;
      min_data_x = 0;
      max_data_y = 1;
      min_data_y = 0;
      
    }
    
    
    if( show0 ){
      if( min_data_x > 0 ){
        min_data_x = 0;
      }
      if( max_data_x < 0 ){
        max_data_x = 0;
      }
      if( min_data_y > 0 ){
        min_data_y = 0;
      }
      if( max_data_y < 0 ){
        max_data_y = 0;
      }
    }
    
    
    
    range_data_x = max_data_x - min_data_x;
    range_data_y = max_data_y - min_data_y;
    
    if (range_data_x < min_range){
      range_data_x = min_range;
    }
    if (range_data_y < min_range){
      range_data_y = min_range;
    }
    
    
    fill(default_background_color);
    rect(   xPos*size_block      ,    yPos*size_block       ,  xSize*size_block  ,  ySize*size_block  );
    
    fill(default_background_plot_color);
    rect(   xPos*size_block + 2*marge      ,    yPos*size_block + marge       ,  xSize*size_block - 3*marge  ,  ySize*size_block - 2*marge );
    
    
    textFont(title_font);
    textAlign(CENTER,CENTER);
    fill(line_color);
    
    text(   name   ,    xPos*size_block + 2*marge + (xSize*size_block - 3*marge)*0.5      ,      yPos*size_block + 0.42 * marge  ); 
    
    
    
    
    // ligne verticale
   
   
    float grad_X =  5 * ( (float) Math.pow(10, (int) Math.floor( Math.log10(range_data_x) ) - 1 ) );
    
    if (grad_X/range_data_x < 0.1){
      
      grad_X =  10 * ( (float) Math.pow(10, (int) Math.floor( Math.log10(range_data_x) ) - 1 ) );
      
    }
    
    
    int j_begin = (int) Math.floor(min_data_x/grad_X);
    
    
    
    for(int j = j_begin+1; (float) j*grad_X < range_data_x + min_data_x ; j++){
      
      
      stroke(default_line_grad_color);
      
      line( xPos*size_block + (xSize*size_block - 3*marge) * ( 0 + (j*grad_X-min_data_x)/range_data_x ) + 2*marge    ,   yPos*size_block + marge    ,   xPos*size_block + (xSize*size_block - 3*marge) * ( 0 + (j*grad_X-min_data_x)/range_data_x ) + 2*marge  ,   yPos*size_block + ySize*size_block  - marge );
      
      
      
      fill(default_text_grad_color);
      
      String xLabel = String.valueOf(j*grad_X);
      textFont(default_font);
      text(   xLabel   ,    xPos*size_block + (xSize*size_block - 3*marge) * ( 0 + (j*grad_X-min_data_x)/range_data_x ) + 2*marge       ,      yPos*size_block + ySize*size_block  - 0.6*marge); 
      
    }
  
    
    
    
    
    
    
    
    
    
    
    
    // ligne horizontale
    
    
    float grad_Y =  5 * ( (float) Math.pow(10, (int) Math.floor( Math.log10(range_data_y) ) - 1 ) );
    
    if (grad_Y/range_data_y < 0.1){
      
      grad_Y =  10 * ( (float) Math.pow(10, (int) Math.floor( Math.log10(range_data_y) ) - 1 ) );
      
    }
    
    
    
    
    j_begin = (int) Math.floor(min_data_y/grad_Y);
    
    
    
    for(int j = j_begin+1;  j*grad_Y < range_data_y + min_data_y    ; j++){
      
      stroke(default_line_grad_color);
      
      line( xPos*size_block + 2*marge  ,   yPos*size_block + (ySize*size_block - 2 * marge) * ( 1  -  (j*grad_Y-min_data_y)/(range_data_y-0*min_data_y))  + marge  ,   xPos*size_block + xSize*size_block - 1*marge  ,   yPos*size_block + (ySize*size_block - 2 * marge )  *  ( 1  -  (j*grad_Y-min_data_y)/(range_data_y-0*min_data_y))  + marge );
      
      textFont(default_font);
      
      fill(default_text_grad_color);
      
      String yLabel = String.valueOf(j*grad_Y);
      text(   yLabel   ,    xPos*size_block + 1*marge       ,      yPos*size_block + (ySize*size_block - 2 * marge) * ( 1  -  (j*grad_Y-min_data_y)/(range_data_y-0*min_data_y))  + marge    ); 
    }
  
  
  
  // affichage graph
  
  stroke(line_color);
  
  for(int j = 1; j < data[0].size() ; j++ ){
    
    line( xPos*size_block      +   ( (data[1].get(j-1)-min_data_x)/range_data_x ) * float(xSize*size_block-3*marge)   +     2*marge  ,    yPos*size_block + (ySize*size_block -2*marge)*(  1  -   (data[2].get(j-1)-min_data_y)/range_data_y ) + marge   ,  xPos*size_block      +   ( (data[1].get(j)-min_data_x)/range_data_x ) * float(xSize*size_block-3*marge)   +     2*marge   ,   yPos*size_block + (ySize*size_block-2*marge)*(  1  -   (data[2].get(j)-min_data_y)/range_data_y  ) + marge    );
    
  }
  
  if(  data[0].size() > 0 ){
    circle( xPos*size_block      +   ( (data[1].get(data[0].size()-1)-min_data_x)/range_data_x ) * float(xSize*size_block-3*marge)   +     2*marge   ,    yPos*size_block + (ySize*size_block -2*marge)*(  1  -   (data[2].get(data[0].size()-1)-min_data_y)/range_data_y ) + marge , 3 );
  }
  
    
    stroke(default_line_color);
    
    // contour du graph
    line(  xPos*size_block + 2*marge  ,  yPos*size_block + marge       ,  xPos*size_block + xSize*size_block-marge  ,  yPos*size_block + marge  );
    line(  xPos*size_block + 2*marge  ,  yPos*size_block + ySize*size_block - marge       ,  xPos*size_block + xSize*size_block-marge  ,  yPos*size_block + ySize*size_block - marge  );
    line(  xPos*size_block + 2*marge  ,  yPos*size_block + marge       ,  xPos*size_block + 2*marge  ,  yPos*size_block + ySize*size_block - marge  );
    line(  xPos*size_block + xSize*size_block-marge  ,  yPos*size_block + marge       ,  xPos*size_block + xSize*size_block-marge  ,  yPos*size_block + ySize*size_block - marge   );
    
    
    // contour du widget
    line(xPos*size_block,yPos*size_block,(xPos+xSize)*size_block,yPos*size_block);
    line(xPos*size_block,(yPos+ySize)*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    line(xPos*size_block,yPos*size_block,xPos*size_block,(yPos+ySize)*size_block );
    line( (xPos+xSize)*size_block,yPos*size_block,(xPos+xSize)*size_block,(yPos+ySize)*size_block );
    
    
  
  }
  
}
