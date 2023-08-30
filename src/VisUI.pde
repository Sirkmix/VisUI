
// [VisUI-0]

/*     NOTES

  -ajouter champ pour précisé le nombre max de bit (finir la communication avec l'arduino)
  -empecher une cam d'etre utilisé deux fois
  -finir la doc
  -faire le github
  
*/

import controlP5.*;
import processing.serial.*;
import processing.video.*;

import org.quark.jasmine.*;

// [VisUI-1]

PApplet sketchRef ;

int size_block = 100;

color default_background_color = color(54,57,63);
color default_background_plot_color = color(64,68,75);

color default_line_color = color(248,136,99);
color default_line_grad_color = color(120,120,120);
color default_text_grad_color = color(120,120,120);

int mode = 0;
/*   0 = home ; 1 = add ; 2 = resize ; 3 = move ; 4 = choose widget ; 5 = configure widget (in add mode) ; 6 = choose configure widget (in config mode) 
     7 = configure widget (in config mode) ; 8 = option mode ; 10 = cancel
*/
int old_mouseX = 0;
int old_mouseY = 0;
int[] selection = {0,0,0,0};
int[] default_selection = {0,0,0,0};
int[] modified_selection = {0,0,0,0};
int widget_to_modify = -1;

color color_mode = default_line_color;
color color_add = color(247,223,125);
color color_resize = color(117,211,149);
color color_move = color(113,135,255);
color color_cancel = color(255,98,98);
color color_configure = color(88,219,219);


int marge = 25;


PImage logo; 
PImage import_logo;
PImage add_logo;
PImage resize_logo;
PImage move_logo;
PImage cancel_logo;
PImage save_logo;
PImage configure_logo;
PImage option_logo;
PImage icon;

int widget_to_create_selected = 0;
PImage graph_logo;
PImage bar_logo;
PImage gauge_logo;
PImage graphXY_logo;
PImage model3D_logo;
PImage video_logo;
PImage state_logo;
PImage textArea_logo;
PImage compass_logo;

PImage validate_logo;

PFont default_font;
PFont big_font;
PFont title_font;


float time = 0.0;

float default_time_data = 30;
ControlP5 cp5;


Textfield Title_Textfield;

Textfield Time_data_Textfield;

Textfield FirstBit1_Textfield;
Textfield LastBit1_Textfield;
Textfield Expression1_Textfield;
ColorPicker Color1_ColorPicker;
DropdownList VariableType1;

Textfield FirstBit2_Textfield;
Textfield LastBit2_Textfield;
Textfield Expression2_Textfield;
ColorPicker Color2_ColorPicker;
DropdownList VariableType2;

Textfield FirstBit3_Textfield;
Textfield LastBit3_Textfield;
Textfield Expression3_Textfield;
ColorPicker Color3_ColorPicker;
DropdownList VariableType3;

Textfield FirstBit4_Textfield;
Textfield LastBit4_Textfield;
Textfield Expression4_Textfield;
ColorPicker Color4_ColorPicker;
DropdownList VariableType4;

Textfield Min_data_Textfield;
Textfield Max_data_Textfield;

ColorPicker DefaultColor_ColorPicker;
ColorPicker DefaultBackgroundColor_ColorPicker;
ColorPicker DefaultBackgroundPlotColor_ColorPicker;
ColorPicker DefaultGradColor_ColorPicker;
ColorPicker DefaultGradTextColor_ColorPicker;


Textfield FirstBit5_Textfield;
Textfield LastBit5_Textfield;
Textfield Expression5_Textfield;
DropdownList VariableType5;

Textfield FirstBit6_Textfield;
Textfield LastBit6_Textfield;
Textfield Expression6_Textfield;
DropdownList VariableType6;


Textfield OffsetX_Textfield;
Textfield OffsetY_Textfield;
Textfield OffsetZ_Textfield;

Textfield OffsetX_rotation_Textfield;
Textfield OffsetY_rotation_Textfield;
Textfield OffsetZ_rotation_Textfield;


Textfield eyeX_Textfield;
Textfield eyeY_Textfield;
Textfield eyeZ_Textfield;

Textfield centerX_Textfield;
Textfield centerY_Textfield;
Textfield centerZ_Textfield;

Textfield upX_Textfield;
Textfield upY_Textfield;
Textfield upZ_Textfield;

Textfield Scale_Textfield;

Textlabel Text1;
Textarea TextArea1;

DropdownList State_List;
Button add_Button;
Button suppress_Button;
Toggle hide1_Toggle;
Toggle hide2_Toggle;

Toggle saveData_Toggle;
Toggle testData_Toggle;

Toggle show0_Toggle;

DropdownList Number_of_graph_List;
int Number_of_graph = 0;


ArrayList<Widget> Widget_list = new ArrayList<Widget>();

StringList save_string_list;
String save_pathfile;


Serial myPort;   
DropdownList Com_List;
int baudrate = 9600;
Textfield Baudrate_Textfield;
boolean waitToChangeCOMPort = false;
int waitingTime = 1000; // ms
int startWaitingTime = -1; // if -1 don't wait

boolean saveData_bool = false;
int saveTiming = -1; // -1 : no save ; other : framerate at last save start
int saveTimeLimit = 600; // frame until new save file
PrintWriter output;
boolean testData = false;


byte Buffer[] ;
String Buffer_bin = "";
int nBit = 20;

void setup() {
  
  // [VisUI-1]
  
  surface.setTitle("VisUI");
  surface.setResizable(true);
  surface.setLocation(50, 50);
  
  frameRate(60);
  
  logo = loadImage("images/VisUI_logo.png");
  import_logo = loadImage("images/import_logo.png");
  add_logo = loadImage("images/add_logo.png");
  resize_logo = loadImage("images/resize_logo.png");
  move_logo = loadImage("images/move_logo.png");
  cancel_logo = loadImage("images/cancel_logo.png");
  save_logo = loadImage("images/save_logo.png");
  configure_logo = loadImage("images/configure_logo.png");
  option_logo = loadImage("images/option_logo.png");
  icon = loadImage("images/VisUI_icon.png");
  
  graph_logo = loadImage("images/graph_logo.png");
  bar_logo = loadImage("images/bar_logo.png");
  gauge_logo = loadImage("images/gauge_logo.png");
  graphXY_logo = loadImage("images/graphXY_logo.png"); 
  model3D_logo = loadImage("images/3d_logo.png"); 
  video_logo = loadImage("images/video_logo.png"); 
  state_logo = loadImage("images/state_logo.png");
  textArea_logo = loadImage("images/textArea_logo.png");
  compass_logo = loadImage("images/compass_logo.png");
  
  validate_logo = loadImage("images/validate_logo.png");
  
  
  default_font = createFont("Lucida Sans Unicode", 10);
  big_font = createFont("Lucida Sans Unicode", 35);
  title_font = createFont("Lucida Sans Unicode", 14);
  
  ((PGraphicsOpenGL) g).textureSampling(2);
  sketchRef = this;
  
  
   cp5 = new ControlP5(this);
   
   
  Title_Textfield = cp5.addTextfield("Title").setPosition(-1000, -1000);
  
  Time_data_Textfield = cp5.addTextfield("Time data").setPosition(-1000, -1000);
  
  FirstBit1_Textfield = cp5.addTextfield("First bit1").setPosition(-1000, -1000);
  LastBit1_Textfield = cp5.addTextfield("Last bit1").setPosition(-1000, -1000);
  Expression1_Textfield = cp5.addTextfield("Offset1").setPosition(-1000, -1000);
  Color1_ColorPicker = cp5.addColorPicker("Color1").setPosition(-1000, -1000);
  VariableType1 = cp5.addDropdownList("Type").setPosition(-1000, -1000);
  
  FirstBit2_Textfield = cp5.addTextfield("First bit2").setPosition(-1000, -1000);
  LastBit2_Textfield = cp5.addTextfield("Last bit2").setPosition(-1000, -1000);
  Expression2_Textfield = cp5.addTextfield("Offset2").setPosition(-1000, -1000);
  Color2_ColorPicker = cp5.addColorPicker("Color2").setPosition(-1000, -1000);
  VariableType2 = cp5.addDropdownList("Type ").setPosition(-1000, -1000);
  
  FirstBit3_Textfield = cp5.addTextfield("First bit3").setPosition(-1000, -1000);
  LastBit3_Textfield = cp5.addTextfield("Last bit3").setPosition(-1000, -1000);
  Expression3_Textfield = cp5.addTextfield("Offset3").setPosition(-1000, -1000);
  Color3_ColorPicker = cp5.addColorPicker("Color3").setPosition(-1000, -1000);
  VariableType3 = cp5.addDropdownList("Type  ").setPosition(-1000, -1000);
  
  FirstBit4_Textfield = cp5.addTextfield("First bit4").setPosition(-1000, -1000);
  LastBit4_Textfield = cp5.addTextfield("Last bit4").setPosition(-1000, -1000);
  Expression4_Textfield = cp5.addTextfield("Offset4").setPosition(-1000, -1000);
  Color4_ColorPicker = cp5.addColorPicker("Color4").setPosition(-1000, -1000);
  VariableType4 = cp5.addDropdownList("Type   ").setPosition(-1000, -1000);
  
  Number_of_graph_List = cp5.addDropdownList("Number of different value").setPosition(-1000, -1000);
  
  Min_data_Textfield = cp5.addTextfield("Min data").setPosition(-1000, -1000);
  Max_data_Textfield = cp5.addTextfield("Max data").setPosition(-1000, -1000);
  
  DefaultColor_ColorPicker = cp5.addColorPicker("Default color color picker").setPosition(-1000, -1000);
  DefaultBackgroundColor_ColorPicker = cp5.addColorPicker("Default background color color picker").setPosition(-1000, -1000);
  DefaultBackgroundPlotColor_ColorPicker = cp5.addColorPicker("Default background plotColor color picker").setPosition(-1000, -1000);
  DefaultGradColor_ColorPicker = cp5.addColorPicker("Default grad color color picker").setPosition(-1000, -1000);
  DefaultGradTextColor_ColorPicker = cp5.addColorPicker("Default grad text color color picker").setPosition(-1000, -1000);
  
  
  FirstBit5_Textfield = cp5.addTextfield("First bit5").setPosition(-1000, -1000);
  LastBit5_Textfield = cp5.addTextfield("Last bit5").setPosition(-1000, -1000);
  Expression5_Textfield = cp5.addTextfield("Offset 5").setPosition(-1000, -1000);
  VariableType5 = cp5.addDropdownList("Type    ").setPosition(-1000, -1000);
  
  FirstBit6_Textfield = cp5.addTextfield("First bit6").setPosition(-1000, -1000);
  LastBit6_Textfield = cp5.addTextfield("Last bit6").setPosition(-1000, -1000);
  Expression6_Textfield = cp5.addTextfield("Offset 6").setPosition(-1000, -1000);
  VariableType6 = cp5.addDropdownList("Type     ").setPosition(-1000, -1000);
  
  
  OffsetX_Textfield = cp5.addTextfield("Offset X").setPosition(-1000, -1000);
  OffsetY_Textfield = cp5.addTextfield("Offset Y").setPosition(-1000, -1000);
  OffsetZ_Textfield = cp5.addTextfield("Offset Z").setPosition(-1000, -1000);
  
  OffsetX_rotation_Textfield = cp5.addTextfield("Offset Rotation X").setPosition(-1000, -1000);
  OffsetY_rotation_Textfield = cp5.addTextfield("Offset Rotation Y").setPosition(-1000, -1000);
  OffsetZ_rotation_Textfield = cp5.addTextfield("Offset Rotation Z").setPosition(-1000, -1000);
  
  
  eyeX_Textfield = cp5.addTextfield("Eye X").setPosition(-1000, -1000);
  eyeY_Textfield = cp5.addTextfield("Eye Y").setPosition(-1000, -1000);
  eyeZ_Textfield = cp5.addTextfield("Eye Z").setPosition(-1000, -1000);
  
  centerX_Textfield = cp5.addTextfield("Center X").setPosition(-1000, -1000);
  centerY_Textfield = cp5.addTextfield("Center Y").setPosition(-1000, -1000);
  centerZ_Textfield = cp5.addTextfield("Center Z").setPosition(-1000, -1000);
  
  upX_Textfield = cp5.addTextfield("Up X").setPosition(-1000, -1000);
  upY_Textfield = cp5.addTextfield("Up Y").setPosition(-1000, -1000);
  upZ_Textfield = cp5.addTextfield("Up Z").setPosition(-1000, -1000);
  
  State_List = cp5.addDropdownList("State list").setPosition(-1000, -1000);
  add_Button = cp5.addButton("add Button").setPosition(-1000, -1000);
  suppress_Button = cp5.addButton("suppress Button").setPosition(-1000, -1000);
  hide1_Toggle = cp5.addToggle("hide 1").setPosition(-1000, -1000);
  hide2_Toggle = cp5.addToggle("hide 2").setPosition(-1000, -1000);
  
  
  
  Scale_Textfield = cp5.addTextfield("Scale").setPosition(-1000, -1000);
  
  Text1 = cp5.addTextlabel("Filepath","",-1000,-1000);
  TextArea1 = cp5.addTextarea("TextArea 1").setPosition(-1000, -1000);
  
  Baudrate_Textfield = cp5.addTextfield("Baudrate").setPosition(-1000, -1000);
  saveData_Toggle = cp5.addToggle("Save data").setPosition(-1000, -1000);
  testData_Toggle = cp5.addToggle("Test data").setPosition(-1000, -1000);
  
  show0_Toggle = cp5.addToggle("Show 0").setPosition(-1000, -1000);
  
  
  Com_List = cp5.addDropdownList("Com port").setPosition(-1000, -1000);
  

  
  save_string_list = new StringList();
}


void settings() {
  size(1800, 900,P2D);
  noSmooth();
  
  PJOGL.setIcon("images/VisUI_icon.png");
}



void draw() {
  
  
    
  time = (float) millis()/1000;
  
  background(default_background_color);
  
  image(logo, width-size_block+1, 0);
  image(import_logo, width-size_block+1, size_block);
  image(add_logo, width-size_block+1, 2*size_block);
  image(resize_logo, width-size_block+1, 3*size_block);
  image(move_logo, width-size_block+1, 4*size_block);
  image(save_logo, width-size_block+1, 7*size_block);
  image(cancel_logo, width-size_block+1, 8*size_block);
  image(configure_logo, width-size_block+1, 5*size_block);
  image(option_logo, width-size_block+1, 6*size_block);
  
  
  
  
  stroke(color_mode);
  for (int j = 0; (j-1)*size_block < width; j++) {
    
    line(j*size_block , 0, j*size_block, height);
    
    
    for (int i = 0; (i-1)*size_block < height; i++) {
      
      line(0 , i*size_block, width, i*size_block);
      
    }
  }
  
  
  // récupération des données
  
  if( waitToChangeCOMPort ){
    if( millis() - startWaitingTime > waitingTime ){
      waitToChangeCOMPort = false;
    }
  }
  else{
    thread("requestData");
  }
  
  
  
  
  
  // affichage des widgets
  
  for (int i = 0; i < Widget_list.size(); i++) {
    
    Widget_list.get(i).display();
    textAlign(BASELINE,BASELINE);
    
  }
  
  
  
  
  // affichage selection
  
  if( mode != 0 && selection[2] != 0 && selection[3] != 0 ){
    
    
    if( selection_is_good() == 0){
      color_mode = color_cancel;
    }
    else{
      if( mode == 1){
        color_mode = color_add;
      }
      if( mode == 2){
        color_mode = color_resize;
        selection_to_widget();
      }
      if( mode == 3){
        color_mode = color_move;
        selection_to_widget();
      }
      if( mode == 6){
        color_mode = color_configure;
        selection_to_widget();
      }
      if( mode == 10){
          color_mode = color_cancel;
          selection_to_widget();
      }
    }
    
    
    strokeWeight(4);
    fill( red(color_mode) , green(color_mode) , blue(color_mode) , 100 );
    stroke( red(color_mode) , green(color_mode) , blue(color_mode) , 180);
    
    rect( size_block*(selection[0] + modified_selection[0]), size_block*(selection[1] + modified_selection[1]), size_block*(selection[2] + modified_selection[2]), size_block*(selection[3] + modified_selection[3]) );
    strokeWeight(1);
  }else{
    
    if( mode == 1 || mode == 2 || mode == 3 || mode == 6 || mode == 10){
      
      
      if( selection_is_good() == 0){
        color_mode = color_cancel;
      }
      else{
        if( mode == 1){
        color_mode = color_add;
        }
        if( mode == 2){
          color_mode = color_resize;
          selection_to_widget();
        }
        if( mode == 3){
          color_mode = color_move;
          selection_to_widget();
        }
        if( mode == 6){
          color_mode = color_configure;
          selection_to_widget();
        }
        if( mode == 10){
          color_mode = color_cancel;
          selection_to_widget();
        }
      }
      
      strokeWeight(4);
      fill( red(color_mode) , green(color_mode) , blue(color_mode) , 100 );
      stroke( red(color_mode) , green(color_mode) , blue(color_mode) , 180);
      
      rect( ((mouseX + size_block - 1) / size_block ) * size_block - size_block , ((mouseY + size_block - 1) / size_block ) * size_block - size_block , size_block , size_block );
      strokeWeight(1);
    }
  }
  
  
  
  // creator mode
  if( mode == 4 ){
    
    // [VisUI-2]
    
    strokeWeight(4);
    fill(default_background_color);
    stroke(default_line_color);
    rect( 2*size_block , 2*size_block , 14*size_block , 5*size_block );
    strokeWeight(1);
    
    
    textFont(big_font);
    fill( default_line_color );
    text("Choose a widget", 2*size_block + 30 , 2*size_block + 50 );
    
    
    image(graph_logo, 2*size_block + 35 , 2*size_block + 100 );
    image(bar_logo, 3*size_block + 35 , 2*size_block + 100 );
    image(gauge_logo, 4*size_block + 35 , 2*size_block + 100 );
    image(graphXY_logo, 5*size_block + 35 , 2*size_block + 100 );
    image(model3D_logo, 6*size_block + 35 , 2*size_block + 100 );
    image(video_logo, 7*size_block + 35 , 2*size_block + 100 );
    image(state_logo, 8*size_block + 35 , 2*size_block + 100 );
    image(textArea_logo, 9*size_block + 35 , 2*size_block + 100 );
    image(compass_logo, 10*size_block + 35 , 2*size_block + 100 );
    
    
    
    if( mouseX < 3*size_block + 35 && mouseX > 2*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("Graph", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 4*size_block + 35 && mouseX > 3*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("Bar", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 5*size_block + 35 && mouseX > 4*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("Gauge", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 6*size_block + 35 && mouseX > 5*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("Graph XY", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 7*size_block + 35 && mouseX > 6*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("3D model", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 8*size_block + 35 && mouseX > 7*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("Video", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 9*size_block + 35 && mouseX > 8*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("State", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 10*size_block + 35 && mouseX > 9*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("Text area", 2*size_block + 30 , 6*size_block + 80 );
    }
    if( mouseX < 11*size_block + 35 && mouseX > 10*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      textFont(big_font);
      fill( default_line_color );
      text("Compass", 2*size_block + 30 , 6*size_block + 80 );
    }
    
  }
  
  
  if( widget_to_create_selected != 0 ){
      Constructor ( widget_to_create_selected );
  }
  
  
  
  
  
  
  
}




void exit() {
  
  
  super.exit(); // Stops the program
  
}
