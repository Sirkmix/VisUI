
// [Widget-0]

interface Widget {
  
  
  
  void display();
  
  int getXPos();
  int getYPos();
  int getXSize();
  int getYSize();
  String getName();
  
  
  default String getExpression(){
    return "x";
  }
  default void setExpression(String expr){
  }
  default String getExpression(int n){
    return "x";
  }
  default void setExpression(int n ,String expr){
  }
  default int getDataType(){
    return 0;
  }
  default void setDataType(int t){
  }
  default int getDataType(int n){
    return 0;
  }
  default void setDataType(int n, int t){
  }
  
  // [Widget-1]
  // graph functions
  
  default void setName(String n){
  }
  default float getTimeData(){
    return 0;
  }
  default void setTimeData( float v){
  }
  default int getNbData(){
    return 0;
  }
  default void setNbData(int n){
  }
  default color getColor(int n){
    return 0;
  }
  default void setColor(int n, color c){
  }
  default int getFirstBit(int n){
    return 0;
  }
  default void setFirstBit(int n, int val){
  }
  default int getLastBit(int n){
    return 0;
  }
  default void setLastBit(int n, int val){
  }
  default float getOffset(int n){
    return 0;
  }
  default void setOffset(int n, float val){
  }
  default boolean getShow0(){
    return false;
  }
  default void setShow0( boolean s ){
  }
  
  
  // Bar functions
  
  default color getColor(){
    return 0;
  }
  default void setColor( color c){
  }
  default float getMin(){
    return 0;
  }
  default void setMin(float v){
  }
  default float getMax(){
    return 0;
  }
  default void setMax(float v){
  }
  default int getFirstBit(){
    return 0;
  }
  default void setFirstBit(int n){
  }
  default int getLastBit(){
    return 0;
  }
  default void setLastBit(int n){
  }
  default float getOffset(){
    return 0;
  }
  default void setOffset(float v){
  }
  
  // graph XY functions
  default float getRangeTime(){
    return 0;
  }
  
  
  // model 3D functions
  default void setFilePath(String n){
  }
  default String getFilePath(){
    return "";
  }
  default float getScale(){
    return 0.0;
  }
  default void setScale(float f){
  }
  default void setModel(){
  }
  default float getCamData(int n){
    return 0.0;
  }
  default void setCamData(int n, float val){
  }
  default float getRotationOffset( int n ){
    return 0.0;
  }
  default void setRotationOffset( int n, float val ){
  }
  
  
  
  // Video functions
  default void nextCam(){
  }
  
  // State functions
  default void addState( String st){
  }
  default String getState( int n ){
    return "";
  }
  default int getStateSize(){
    return 0;
  }
  default void setHideTitle( boolean b){
  }
  default boolean getHideTitle(){
    return false;
  }
  default void setHideInactiveState( boolean b){
  }
  default boolean getHideInactiveState(){
    return false;
  }
  default void clearState(){
  }
  
  // Text area functions
  default void setText( String t){
  }
  default void matcher(String in, String find){
  }
  default String getText(){
    return "";
  }
  default String getConstructorText(){
    return "";
  }
  
  // Compass functions
  default void setHideDir( boolean b ){
  }
  default boolean getHideDir(){
    return false;
  }
  
  
  
  void resize( int x, int y, int w, int h);
  
  
}



int selection_is_good(){
  
  int good = 1;
  
  boolean widthIsPositive;
  boolean heightIsPositive;
  
  
    
  if( size_block*(selection[0]+modified_selection[0]) < 0 || size_block*(selection[1]+modified_selection[1]) < 0 || size_block*(selection[0]+modified_selection[0]) + size_block*(selection[2]+modified_selection[2]) > width-size_block  || size_block*(selection[1]+modified_selection[1]) + size_block*(selection[3]+modified_selection[3]) > height  ){
    good = 0;
    return good;
  }
  
  
  
  
  for (int i = 0; i < Widget_list.size(); i++) {
    
    widthIsPositive = min(size_block*(selection[0]+modified_selection[0]+selection[2]+modified_selection[2]), size_block * ( Widget_list.get(i).getXPos() + Widget_list.get(i).getXSize() ) ) > max(size_block*(selection[0]+modified_selection[0]),  size_block * Widget_list.get(i).getXPos()   );
    heightIsPositive = min(size_block*(selection[1]+modified_selection[1]+selection[3]+modified_selection[3]),   size_block * ( Widget_list.get(i).getYPos() + Widget_list.get(i).getYSize() )   ) > max(size_block*(selection[1]+modified_selection[1]),   size_block * Widget_list.get(i).getYPos()   );
  
    good = ( widthIsPositive && heightIsPositive )? 0 : 1;
    
    
      
      
    if( mode == 1 && good == 0){
      return good;  
    }
  
    if( mode == 2 && i != widget_to_modify && good == 0){
      good = 0;
      return good;
    }
    if( mode == 2 && i == widget_to_modify && good == 0){
      
      good = 1;
    }
  
    if( mode == 3 && i != widget_to_modify && good == 0){
      
      return good;
    }
    if( mode == 3 && i == widget_to_modify && good == 0){
      
      good = 1;
    }
    if( ( mode == 6 || mode == 7 ) && i != widget_to_modify && good == 0){
      
      return good;
    }
    if( ( mode == 6 || mode == 7 ) && i == widget_to_modify && good == 0){
      
      good = 1;
    }
    
    if( mode == 10 && i != widget_to_modify && good == 0){
      
      return good;
    }
    if( mode == 10 && i == widget_to_modify && good == 0){
      
      good = 1;
    }
    
      
    
  }
  
  return good;
}

// set selection value at mouse over widget position and size
void selection_to_widget(){
  
  if ( !mousePressed || (mouseButton != LEFT)) {
  
    arrayCopy( default_selection , selection);
    
  
    for (int i = 0; i < Widget_list.size(); i++) {
    
      
    
      if( mouseX < size_block * (Widget_list.get(i).getXPos() + Widget_list.get(i).getXSize()) && mouseX > size_block * Widget_list.get(i).getXPos() && mouseY < size_block * (Widget_list.get(i).getYPos() + Widget_list.get(i).getYSize()) && mouseY > size_block * Widget_list.get(i).getYPos() ){
        selection[0] = Widget_list.get(i).getXPos();
        selection[1] = Widget_list.get(i).getYPos();
        selection[2] = Widget_list.get(i).getXSize();
        selection[3] = Widget_list.get(i).getYSize();
        
        widget_to_modify = i;
        
      }
    }
    
  }
  
}



int widget_by_pos( int x , int y){
  
  int result = -1;
  
  
  for (int i = 0; i < Widget_list.size(); i++) {
    
    if(    ( Widget_list.get(i).getXPos()*size_block < x && x < (Widget_list.get(i).getXPos() + Widget_list.get(i).getXSize())*size_block )   &&  ( Widget_list.get(i).getYPos()*size_block < y && y < (Widget_list.get(i).getYPos() + Widget_list.get(i).getYSize())*size_block )   ){
      
      result = i;
      return i;
      
    }
    
  }
  
  
  
  
  
  return result;
}
