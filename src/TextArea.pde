
// [TextArea-0]

class TextArea implements Widget {
  
  
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String name;
  
  
  color line_color = default_line_color;
  
  
  int marge = 25;
  
  Textarea TextArea;
  String text = "";
  String constructorText = "";
  String textToShow = "";
  
  String regex = "[ifh][{][\\dx/*+-]+[\\[][\\d]+[-][\\d]+[\\]][}]" ;
  IntList matchIndex;
  
  
  
  
  String[] dataType ;
  String[] expression ;
  int[] first_bit;
  int[] last_bit;
  Expression[] expr ;
  
  
  TextArea( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    
    matchIndex = new IntList();
    TextArea = cp5.addTextarea("TextArea"+str( random(0,100))).setPosition(xPos * size_block + 0.5*marge , yPos * size_block + marge).setSize(xSize * size_block - 1*marge, ySize * size_block - int(1.5*marge)).setColor(color(default_line_color)).setText("").setFont(title_font);;
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
  color getColor( ){
    return line_color;
  }
  void setColor(color c){
    line_color = c;
  }
  void setText( String t){
    
    matchIndex.clear();
    text = t;
    constructorText = t;
    
    matcher( text , regex );
    
  }
  String getText(){
    return text;
  }
  String getConstructorText(){
    return constructorText;
  }
  
  
  
  // thanks to https://forum.processing.org/two/discussion/11350/question-regarding-indexof.html
  void matcher(String in, String re){
    int index = 0;
    int last = -1;
    
    String[][] m = matchAll( in , re );
    
    
    
    
    if( m != null ){
      
      dataType = new String[m.length];
      expression = new String[m.length];
      expr = new Expression[m.length];
      first_bit = new int[m.length];
      last_bit = new int[m.length];
      
      
      for( int i = 0 ; i < m.length ; i++ ){
        
        index = in.indexOf( m[i][0] , 0 );
        if( index != -1 ){
          
          matchIndex.append(index);
          in = in.replaceFirst(re,"");
          text = text.replaceFirst(re,"");
          last = index;
          
          // get all parameter from tag
          if( m[i][0].substring(0,1).equals("i") ){
             dataType[i] = "Int";
          }
          if( m[i][0].substring(0,1).equals("f") ){
             dataType[i] = "Float";
          }
          if( m[i][0].substring(0,1).equals("h") ){
             dataType[i] = "Half Float";
          }
          
          
          expression[i] = m[i][0].substring(m[i][0].indexOf("{") + 1);
          expression[i] = expression[i].substring(0, expression[i].indexOf("["));
          expr[i] = Compile.expression(expression[i], false);
          String temp = m[i][0].substring(m[i][0].indexOf("[") + 1);
          first_bit[i] = int( temp.substring(0, temp.indexOf("-")) );
          temp = m[i][0].substring(m[i][0].indexOf("-") + 1);
          last_bit[i] = int( temp.substring(0, temp.indexOf("]")) );
          
          
        }
        
        
      }
      
      
    }
    
  }
  
  
  
  void resize( int x, int y, int w, int h){
    xPos = x;
    yPos = y;
    xSize = w;
    ySize = h;
    TextArea.setPosition(xPos * size_block + 0.5*marge , yPos * size_block + marge).setSize(xSize * size_block - 1*marge, ySize * size_block - int(1.5*marge));
  }



  void display() {
    
    
    fill( default_background_color );
    stroke( default_line_color );
    rect( xPos * size_block , yPos * size_block, xSize * size_block , ySize * size_block );
    
    if( mode == 0 ){
      TextArea.setVisible(true);
    }
    else{
      TextArea.setVisible(false);
    }
    
    
    textToShow = text ;
    
    
    if( matchIndex.size() > 0 ){
      
      for( int i = matchIndex.size()-1 ; i > -1 ; i-- ){
        
        float data;
        if( LoadData( first_bit[i] , last_bit[i] , dataType[i], expr[i] ) != "NaN" ){
          data = float(LoadData( first_bit[i] , last_bit[i] , dataType[i] , expr[i] ));
          textToShow = textToShow.substring(0,matchIndex.get(i) ) + data + textToShow.substring(matchIndex.get(i)  ) ;
        }
        else{
          textToShow = textToShow.substring(0,matchIndex.get(i) ) + "NaN" + textToShow.substring(matchIndex.get(i)  ) ;
        }
        
        
      }
      
      
    }
    
    TextArea.setText( textToShow );
    
    
    textFont(title_font);
    fill(default_line_color);
    textAlign(CENTER);
    text(name , ( xPos + 0.5 * xSize ) * size_block , yPos * size_block + 0.8*marge );
    
    
  }
  
  
  
}
