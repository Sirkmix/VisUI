
// [KeyInput-0]

void mouseClicked() {
  
  // home
  if ( mouseX > width-size_block+1 && mouseY < 1*size_block+1 ){
    
    mode = 0;
    
    hide_constructor();
    
    color_mode = default_line_color;
    
    arrayCopy( default_selection , selection);
    
    
  }
  
  // load
  if ( mouseX > width-size_block+1 && mouseY > 1*size_block+1 && mouseY < 2*size_block-1 ){
    
    hide_constructor();
    
    selectInput("Select a file to write to:", "fileToLoad");
    
  }
  
  // add
  if ( mouseX > width-size_block+1 && mouseY > 2*size_block+1 && mouseY < 3*size_block-1 && mode != 5 ){
    
    mode = 1;
    
    hide_constructor();
    
    color_mode = color_add;
    
  }
  
  // resize
  if ( mouseX > width-size_block+1 && mouseY > 3*size_block+1 && mouseY < 4*size_block-1 ){
    
    mode = 2;
    
    hide_constructor();
    
    color_mode = color_resize;
    
  }
  
  // move
  if ( mouseX > width-size_block+1 && mouseY > 4*size_block+1 && mouseY < 5*size_block-1 ){
    
    mode = 3;
    
    hide_constructor();
    
    color_mode = color_move;
    
  }
  
  // save
  if ( mouseX > width-size_block+1 && mouseY > 7*size_block+1 && mouseY < 8*size_block-1 ){
    
    hide_constructor();
    
    selectOutput("Select a file to write to:", "fileToSave");
    
  }
  
  // configure
  if ( mouseX > width-size_block+1 && mouseY > 5*size_block+1 && mouseY < 6*size_block-1 ){
    
    mode = 6;
    
    hide_constructor();
    
    color_mode = color_configure;
    
  }
  
  // option
  if ( mouseX > width-size_block+1 && mouseY > 6*size_block+1 && mouseY < 7*size_block-1 ){
    
    mode = 8;
    
    hide_constructor();
    
    color_mode = default_line_color;
    
    widget_to_create_selected = 1000;
    
  }
  
  // cancel
  if ( mouseX > width-size_block+1 && mouseY > 8*size_block+1 && mouseY < 9*size_block-1 ){
    
    mode = 10;
    
    hide_constructor();
    
    color_mode = color_cancel;
    
    
  }
  
  // cancel widget
  if( mode == 10 && selection[2] != 0 && selection[3] != 0 ){
    Widget_list.remove(widget_to_modify);
    hide_constructor();
  }
  
  
  
  // select widget
  if( mode == 4 ){
    
    // [KeyInput-1]
    
    if( mouseX < 3*size_block + 35 && mouseX > 2*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 1; // 1 = graph
    }
    if( mouseX < 4*size_block + 35 && mouseX > 3*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 2; // 2 = bar
    }
    if( mouseX < 5*size_block + 35 && mouseX > 4*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 3; // 3 = gauge
    }
    if( mouseX < 6*size_block + 35 && mouseX > 5*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 4; // 4 = graph XY
    }
    if( mouseX < 7*size_block + 35 && mouseX > 6*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 5; // 5 = model 3D
    }
    if( mouseX < 8*size_block + 35 && mouseX > 7*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 6; // 6 = Video
    }
    if( mouseX < 9*size_block + 35 && mouseX > 8*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 7; // 7 = State
    }
    if( mouseX < 10*size_block + 35 && mouseX > 9*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 8; // 8 = Text area
    }
    if( mouseX < 11*size_block + 35 && mouseX > 10*size_block + 35 && mouseY < 3*size_block + 100 && mouseY > 2*size_block + 100 ){
      widget_to_create_selected = 9; // 9 = Compass
    }
    
  }
  
  
  
  // create widget after click on validate button
  if( mode == 5 || mode == 7){
    
    if( mouseX > 15*size_block && mouseX < 15*size_block + validate_logo.width && mouseY > 6*size_block && mouseY < 6*size_block + validate_logo.height ){
      
      // [KeyInput-2]
      
      int w = -1;
      if( mode == 5){
        w = Widget_list.size();
      }
      if( mode == 7){
        w = widget_to_modify;
      }
      
      // graph
      if( widget_to_create_selected == -1 ){
        if( mode == 5){
          Widget_list.add( new Graph( selection[0] , selection[1] , selection[2] , selection[3] ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        Widget_list.get( w ).setTimeData( float(Time_data_Textfield.getText()) );
        Widget_list.get( w ).setNbData( Number_of_graph + 1 );
        
        Widget_list.get( w ).setFirstBit( 0 , int(FirstBit1_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 1 , int(FirstBit2_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 2 , int(FirstBit3_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 3 , int(FirstBit4_Textfield.getText()) );
        
        Widget_list.get( w ).setLastBit( 0 , int(LastBit1_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 1 , int(LastBit2_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 2 , int(LastBit3_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 3 , int(LastBit4_Textfield.getText()) );
        
        Widget_list.get( w ).setExpression( 0 , Expression1_Textfield.getText() );
        Widget_list.get( w ).setExpression( 1 , Expression2_Textfield.getText() );
        Widget_list.get( w ).setExpression( 2 , Expression3_Textfield.getText() );
        Widget_list.get( w ).setExpression( 3 , Expression4_Textfield.getText() );
        
        Widget_list.get( w ).setDataType( 0 , (int) VariableType1.getValue() );
        Widget_list.get( w ).setDataType( 1 , (int) VariableType2.getValue() );
        Widget_list.get( w ).setDataType( 2 , (int) VariableType3.getValue() );
        Widget_list.get( w ).setDataType( 3 , (int) VariableType4.getValue() );
        
        Widget_list.get( w ).setColor( 0 , Color1_ColorPicker.getColorValue() );
        Widget_list.get( w ).setColor( 1 , Color2_ColorPicker.getColorValue() );
        Widget_list.get( w ).setColor( 2 , Color3_ColorPicker.getColorValue() );
        Widget_list.get( w ).setColor( 3 , Color4_ColorPicker.getColorValue() );
        
        Widget_list.get( w ).setShow0( show0_Toggle.getBooleanValue() );
      }
      
      // bar
      if( widget_to_create_selected == -2 ){
        if( mode == 5){
          Widget_list.add( new Bar( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        Widget_list.get( w ).setColor( Color1_ColorPicker.getColorValue() );
        Widget_list.get( w ).setMin( float(Min_data_Textfield.getText()) );
        Widget_list.get( w ).setMax( float(Max_data_Textfield.getText()) );
        
        Widget_list.get( w ).setFirstBit( int(FirstBit1_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( int(LastBit1_Textfield.getText()) );
        Widget_list.get( w ).setExpression( Expression1_Textfield.getText() );
        Widget_list.get( w ).setDataType( (int) VariableType1.getValue() );
      }
      
      // gauge
      if( widget_to_create_selected == -3 ){
        if( mode == 5){
          Widget_list.add( new Gauge( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        Widget_list.get( w ).setColor( Color1_ColorPicker.getColorValue() );
        Widget_list.get( w ).setMin( float(Min_data_Textfield.getText()) );
        Widget_list.get( w ).setMax( float(Max_data_Textfield.getText()) );
        
        Widget_list.get( w ).setFirstBit( int(FirstBit1_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( int(LastBit1_Textfield.getText()) );
        Widget_list.get( w ).setExpression( Expression1_Textfield.getText() );
        Widget_list.get( w ).setDataType( (int) VariableType1.getValue() );
      }
      
      // graph XY
      if( widget_to_create_selected == -4 ){
        if( mode == 5){
          Widget_list.add( new Graph_XY( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        Widget_list.get( w ).setColor( Color1_ColorPicker.getColorValue() );
        Widget_list.get( w ).setTimeData( float(Time_data_Textfield.getText()) );
        
        Widget_list.get( w ).setFirstBit( 0 , int(FirstBit1_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 1 , int(FirstBit2_Textfield.getText()) );
        
        Widget_list.get( w ).setLastBit( 0 , int(LastBit1_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 1 , int(LastBit2_Textfield.getText()) );
        
        Widget_list.get( w ).setExpression( 0 , Expression1_Textfield.getText() );
        Widget_list.get( w ).setExpression( 1 , Expression2_Textfield.getText() );
        
        Widget_list.get( w ).setDataType( 0 , (int) VariableType1.getValue() );
        Widget_list.get( w ).setDataType( 1 , (int) VariableType2.getValue() );
      }
      
      // model 3D
      if( widget_to_create_selected == -5 ){
        if( mode == 5){
          Widget_list.add( new Model3D( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        
        
        Widget_list.get( w ).setFirstBit( 0 , int(FirstBit1_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 1 , int(FirstBit2_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 2 , int(FirstBit3_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 3 , int(FirstBit4_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 4 , int(FirstBit5_Textfield.getText()) );
        Widget_list.get( w ).setFirstBit( 5 , int(FirstBit6_Textfield.getText()) );
        
        Widget_list.get( w ).setLastBit( 0 , int(LastBit1_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 1 , int(LastBit2_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 2 , int(LastBit3_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 3 , int(LastBit4_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 4 , int(LastBit5_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( 5 , int(LastBit6_Textfield.getText()) );
        
        Widget_list.get( w ).setExpression( 0 , Expression1_Textfield.getText() );
        Widget_list.get( w ).setExpression( 1 , Expression2_Textfield.getText() );
        Widget_list.get( w ).setExpression( 2 , Expression3_Textfield.getText() );
        Widget_list.get( w ).setExpression( 3 , Expression4_Textfield.getText() );
        Widget_list.get( w ).setExpression( 4 , Expression5_Textfield.getText() );
        Widget_list.get( w ).setExpression( 5 , Expression6_Textfield.getText() );
        
        Widget_list.get( w ).setDataType( 0 , (int) VariableType1.getValue() );
        Widget_list.get( w ).setDataType( 1 , (int) VariableType2.getValue() );
        Widget_list.get( w ).setDataType( 2 , (int) VariableType3.getValue() );
        Widget_list.get( w ).setDataType( 3 , (int) VariableType4.getValue() );
        Widget_list.get( w ).setDataType( 4 , (int) VariableType5.getValue() );
        Widget_list.get( w ).setDataType( 5 , (int) VariableType6.getValue() );
        
        
        Widget_list.get( w ).setOffset( 0 , float( OffsetX_Textfield.getText() ));
        Widget_list.get( w ).setOffset( 1 , float( OffsetY_Textfield.getText() ));
        Widget_list.get( w ).setOffset( 2 , float( OffsetZ_Textfield.getText() ));
        
        Widget_list.get( w ).setRotationOffset( 0 , float( OffsetX_rotation_Textfield.getText() ));
        Widget_list.get( w ).setRotationOffset( 1 , float( OffsetY_rotation_Textfield.getText() ));
        Widget_list.get( w ).setRotationOffset( 2 , float( OffsetZ_rotation_Textfield.getText() ));
        
        
        Widget_list.get( w ).setCamData( 0 , float(eyeX_Textfield.getText()) );
        Widget_list.get( w ).setCamData( 1 , float(eyeY_Textfield.getText()) );
        Widget_list.get( w ).setCamData( 2 , float(eyeZ_Textfield.getText()) );
        
        Widget_list.get( w ).setCamData( 3 , float(centerX_Textfield.getText()) );
        Widget_list.get( w ).setCamData( 4 , float(centerY_Textfield.getText()) );
        Widget_list.get( w ).setCamData( 5 , float(centerZ_Textfield.getText()) );
        
        Widget_list.get( w ).setCamData( 6 , float(upX_Textfield.getText()) );
        Widget_list.get( w ).setCamData( 7 , float(upY_Textfield.getText()) );
        Widget_list.get( w ).setCamData( 8 , float(upZ_Textfield.getText()) );
        
        
        Widget_list.get( w ).setFilePath( Text1.get().getText() );
        
        Widget_list.get( w ).setModel();
        
        Widget_list.get( w ).setScale( float(Scale_Textfield.getText() ) );
        
        
      }
      // Video
      if( widget_to_create_selected == -6 ){
        if( mode == 5){
          Widget_list.add( new Video( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
      }
      
      // State
      if( widget_to_create_selected == -7 ){
        if( mode == 5){
          Widget_list.add( new State( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        Widget_list.get( w ).setColor( 0 , Color1_ColorPicker.getColorValue() );
        Widget_list.get( w ).setColor( 1 , Color2_ColorPicker.getColorValue() );
        
        
        Widget_list.get( w ).setFirstBit( int(FirstBit1_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( int(LastBit1_Textfield.getText()) );
        Widget_list.get( w ).setExpression( Expression1_Textfield.getText() );
        Widget_list.get( w ).clearState();
        
        int size = State_List.getItems().size() ;
        if( size > 0 ){
          for( int i = 0 ; i < size ; i++ ){
            
            Widget_list.get( w ).addState(  (String) State_List.getItem(i).get("name")  );
            
          }
        }
        
        Widget_list.get( w ).setHideTitle( hide1_Toggle.getBooleanValue());
        Widget_list.get( w ).setHideInactiveState( hide2_Toggle.getBooleanValue());
           
      }
      
      // Text area
      if( widget_to_create_selected == -8 ){
        if( mode == 5){
          Widget_list.add( new TextArea( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        Widget_list.get( w ).setText( TextArea1.getText() );
      }
      
      // compass
      if( widget_to_create_selected == -9 ){
        if( mode == 5){
          Widget_list.add( new Compass( selection[0] , selection[1] , selection[2] , selection[3]  ) );
        }
        
        Widget_list.get( w ).setName( Title_Textfield.getText() );
        Widget_list.get( w ).setColor( Color1_ColorPicker.getColorValue() );
        
        Widget_list.get( w ).setFirstBit( int(FirstBit1_Textfield.getText()) );
        Widget_list.get( w ).setLastBit( int(LastBit1_Textfield.getText()) );
        Widget_list.get( w ).setExpression( Expression1_Textfield.getText() );
        Widget_list.get( w ).setDataType( (int) VariableType1.getValue() );
        
        Widget_list.get( w ).setHideDir( hide1_Toggle.getBooleanValue());
      }
      
      
      
      
      
      mode = 0;
      hide_constructor();
      
    }
    
  }
  
  //load file in creator mode
  if( mode == 5 || mode == 7 ){
    
    if( widget_to_create_selected == -5 && mouseX > 230 && mouseX < 230 + import_logo.width && mouseY > 570 && mouseY < 570 + import_logo.height ){
      
      selectInput("Select an obj file to load:", "objToLoad3d");
      
    }
    
  }
  
  
  
  
  // option mode
  if( mode == 8 ){
    
    if( mouseX > 15*size_block && mouseX < 15*size_block + validate_logo.width && mouseY > 6*size_block && mouseY < 6*size_block + validate_logo.height ){
      
      default_line_color = DefaultColor_ColorPicker.getColorValue();
      default_background_color = DefaultBackgroundColor_ColorPicker.getColorValue();
      default_background_plot_color = DefaultBackgroundPlotColor_ColorPicker.getColorValue();
      default_line_grad_color = DefaultGradColor_ColorPicker.getColorValue();
      default_text_grad_color = DefaultGradTextColor_ColorPicker.getColorValue();
      
      baudrate = int( Baudrate_Textfield.getText() );
      
      saveData_bool = saveData_Toggle.getBooleanValue();
      testData = testData_Toggle.getBooleanValue();
      
      try{
        myPort = new Serial(this, Serial.list() [ int(Com_List.getValue()) ] , baudrate  );
        waitToChangeCOMPort = true;
        startWaitingTime = millis();
      }
      catch( Exception e ){
        println(e);
      }
      
      
      mode = 0;
      hide_constructor();
      
    }
  }
  
  
  
  
  
  
}




void mousePressed() {
  if( (mode == 1 || mode == 2 || mode == 3)&& mouseX < width-size_block){
    
    selection_to_widget();
    
    if( selection_is_good() == 1){
      old_mouseX = ((mouseX + size_block - 1) / size_block ) * size_block;
      old_mouseY = ((mouseY + size_block - 1) / size_block ) * size_block;
      
      
    }
    
    
  }
  
  // select widget
  if( mode == 6 ){
    
    selection_to_widget();
    
    
    if( widget_to_modify != -1 ){
      if( Widget_list.get( widget_to_modify ).getClass() == Graph.class ){
        widget_to_create_selected = 1;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == Bar.class ){
        widget_to_create_selected = 2;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == Gauge.class ){
        widget_to_create_selected = 3;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == Graph_XY.class ){
        widget_to_create_selected = 4;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == Model3D.class ){
        widget_to_create_selected = 5;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == Video.class ){
        widget_to_create_selected = 6;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == State.class ){
        widget_to_create_selected = 7;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == TextArea.class ){
        widget_to_create_selected = 8;
      }
      if( Widget_list.get( widget_to_modify ).getClass() == Compass.class ){
        widget_to_create_selected = 9;
      }
    }
    

  }
  
  // default mode
  if( mode == 0 ){
    
    int i = widget_by_pos(mouseX , mouseY );
    
    
    
    if( i != -1 ){
      if( Widget_list.get( i ).getClass() == Video.class ){
        Widget_list.get( i ).nextCam();
      }
    }
    
    
  }
  
  
  
  
  
}



void mouseDragged() {
  
  if( mode == 1){
    selection[0] = ( (( min(mouseX , old_mouseX) + size_block - 1) / size_block ) * size_block - size_block )/100;
    selection[1] = ( ((min(mouseY , old_mouseY) + size_block - 1) / size_block ) * size_block - size_block )/100;
    selection[2] = min(17- selection[0], 1 + ( ((max(mouseX , old_mouseX ) + size_block - 1) / size_block ) * size_block - size_block )/100 - selection[0]);
    selection[3] = 1 + ( ((max(mouseY , old_mouseY ) + size_block - 1) / size_block ) * size_block - size_block )/100 - selection[1];
    
  }
  
  if( mode == 2 && widget_to_modify != -1 ){
    
    
    
    if(  mouseX >= size_block*(selection[0]+0.5*selection[2])  ){
      modified_selection[0] = 0;
      modified_selection[2] = ceil(((float) ( mouseX-old_mouseX)/size_block))  ;
    }
    else{
      modified_selection[0] = ceil(((float) ( mouseX-old_mouseX)/size_block))  ;
      modified_selection[2] = -modified_selection[0];
    }
    
    if(  mouseY >= size_block*(selection[1]+0.5*selection[3]) ){
      modified_selection[1] = 0;
      modified_selection[3] = ceil(((float) ( mouseY-old_mouseY)/size_block))  ;
    }
    else{
      modified_selection[1] = ceil(((float) ( mouseY-old_mouseY)/size_block))  ;
      modified_selection[3] = -modified_selection[1];
    }
    
    
    
  }
  if( mode == 3 && widget_to_modify != -1 ){
    
    modified_selection[0] = (int) ( (mouseX-old_mouseX)/size_block );
    modified_selection[1] = (int) ( (mouseY-old_mouseY)/size_block );
    modified_selection[2] = 0; 
    modified_selection[3] = 0; 
    
    
  }
  
  
  
  
  
  
}



void mouseReleased(){
  
  if( mode == 1 && selection[2] != 0 && selection[3] != 0 ){
    mode = 4;
    
    if( color_mode == color_cancel){
      mode = 0;
      hide_constructor();
    }
    
  }
  
  if( mode == 2  && selection_is_good() == 1 && widget_to_modify != -1){
    
    
    if( old_mouseX >= size_block * selection[0] && old_mouseX <= size_block * (selection[0] + selection[2]) && old_mouseY >= size_block * selection[1] && old_mouseY <= size_block * (selection[1] + selection[3])  ){
      Widget_list.get(widget_to_modify).resize( selection[0] + modified_selection[0] , selection[1] + modified_selection[1] , selection[2] + modified_selection[2] , selection[3] + modified_selection[3] );
      hide_constructor();
    }
    
    
  }
  
  if( mode == 3  && selection_is_good() == 1 && widget_to_modify != -1){
    
    
    if( old_mouseX >= size_block * selection[0] && old_mouseX <= size_block * (selection[0] + selection[2]) && old_mouseY >= size_block * selection[1] && old_mouseY <= size_block * (selection[1] + selection[3])  ){
      Widget_list.get(widget_to_modify).resize( selection[0] + modified_selection[0] , selection[1] + modified_selection[1] , selection[2] + modified_selection[2] , selection[3] + modified_selection[3] );
      hide_constructor();
    }
    
  }
  else{
    if( selection_is_good() == 0 ){
      
      hide_constructor();
    }
  }
  
  
  
}




void fileToSave(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath() );
    
    
    String widget_str;
    
    // save option
    widget_str = "Option;" + hex(default_background_color) + ";" + hex(default_background_plot_color) + ";" + hex(default_line_color) + ";" + hex(default_line_grad_color) + ";" +
    hex(default_text_grad_color) + ";" ;
    save_string_list.append( widget_str );
    
    for (int i = 0; i < Widget_list.size(); i++) {
      
      widget_str = "";
      
      // [KeyInput-3]
      
      if( Widget_list.get(i).getClass() == Graph.class){
        widget_str = "Graph;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + Widget_list.get(i).getTimeData() + ";" + Widget_list.get(i).getShow0() + ";" + Widget_list.get(i).getNbData() + ";" +
        Widget_list.get(i).getFirstBit(0) + ";" + Widget_list.get(i).getLastBit(0) + ";" + Widget_list.get(i).getDataType(0) + ";" + Widget_list.get(i).getExpression(0) + ";" + hex(Widget_list.get(i).getColor(0)) + ";" +
        Widget_list.get(i).getFirstBit(1) + ";" + Widget_list.get(i).getLastBit(1) + ";" + Widget_list.get(i).getDataType(1) + ";" + Widget_list.get(i).getExpression(1) + ";" + hex(Widget_list.get(i).getColor(1)) + ";" +
        Widget_list.get(i).getFirstBit(2) + ";" + Widget_list.get(i).getLastBit(2) + ";" + Widget_list.get(i).getDataType(2) + ";" + Widget_list.get(i).getExpression(2) + ";" + hex(Widget_list.get(i).getColor(2)) + ";" +
        Widget_list.get(i).getFirstBit(3) + ";" + Widget_list.get(i).getLastBit(3) + ";" + Widget_list.get(i).getDataType(3) + ";" + Widget_list.get(i).getExpression(3) + ";" + hex(Widget_list.get(i).getColor(3)) + ";" ;
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == Bar.class){
        widget_str = "Bar;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + hex(Widget_list.get(i).getColor()) + ";" + Widget_list.get(i).getMin() + ";" + Widget_list.get(i).getMax() +
        ";" + Widget_list.get(i).getFirstBit() + ";" + Widget_list.get(i).getLastBit() + ";" + Widget_list.get(i).getDataType() + ";" + Widget_list.get(i).getExpression() + ";" ;
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == Gauge.class){
        widget_str = "Gauge;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + hex(Widget_list.get(i).getColor()) + ";" + Widget_list.get(i).getMin() + ";" + Widget_list.get(i).getMax() +
        ";" + Widget_list.get(i).getFirstBit() + ";" + Widget_list.get(i).getLastBit() + ";" + Widget_list.get(i).getDataType() + ";" + Widget_list.get(i).getExpression() + ";" ;
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == Graph_XY.class){
        widget_str = "GraphXY;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + hex(Widget_list.get(i).getColor()) + ";" + Widget_list.get(i).getRangeTime() + ";" +  Widget_list.get(i).getShow0() +
        ";" + Widget_list.get(i).getFirstBit(0) + ";" + Widget_list.get(i).getLastBit(0) + ";" + Widget_list.get(i).getDataType(0) + ";" + Widget_list.get(i).getExpression(0) +
        ";" + Widget_list.get(i).getFirstBit(1) + ";" + Widget_list.get(i).getLastBit(1) + ";" + Widget_list.get(i).getDataType(1) + ";" + Widget_list.get(i).getExpression(1) + ";" ;
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == Model3D.class){
        widget_str = "Model3D;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + Widget_list.get(i).getFilePath() + ";" + Widget_list.get(i).getScale() + ";" +
        Widget_list.get(i).getFirstBit(0) + ";" + Widget_list.get(i).getFirstBit(1) + ";" + Widget_list.get(i).getFirstBit(2) + ";" + Widget_list.get(i).getFirstBit(3) + ";" + Widget_list.get(i).getFirstBit(4) + ";" + Widget_list.get(i).getFirstBit(5) + ";" +
        Widget_list.get(i).getLastBit(0) + ";" + Widget_list.get(i).getLastBit(1) + ";" + Widget_list.get(i).getLastBit(2) + ";" + Widget_list.get(i).getLastBit(3) + ";" + Widget_list.get(i).getLastBit(4) + ";" + Widget_list.get(i).getLastBit(5) + ";" +
        Widget_list.get(i).getDataType(0) + ";" + Widget_list.get(i).getDataType(1) + ";" + Widget_list.get(i).getDataType(2) + ";" + Widget_list.get(i).getDataType(3) + ";" + Widget_list.get(i).getDataType(4) + ";" + Widget_list.get(i).getDataType(5) + ";" +
        Widget_list.get(i).getExpression(0) + ";" + Widget_list.get(i).getExpression(1) + ";" + Widget_list.get(i).getExpression(2) + ";" + Widget_list.get(i).getExpression(3) + ";" + Widget_list.get(i).getExpression(4) + ";" + Widget_list.get(i).getExpression(5) + ";" +
        Widget_list.get(i).getOffset(0) + ";" + Widget_list.get(i).getOffset(1) + ";" + Widget_list.get(i).getOffset(2) + ";" + Widget_list.get(i).getRotationOffset(0) + ";" + Widget_list.get(i).getRotationOffset(1) + ";" + Widget_list.get(i).getRotationOffset(2) + ";" +
        Widget_list.get(i).getCamData(0) + ";" + Widget_list.get(i).getCamData(1) + ";" + Widget_list.get(i).getCamData(2) + ";" + Widget_list.get(i).getCamData(3) + ";" + Widget_list.get(i).getCamData(4) + ";" + Widget_list.get(i).getCamData(5) + ";" +
        Widget_list.get(i).getCamData(6) + ";" + Widget_list.get(i).getCamData(7) + ";" + Widget_list.get(i).getCamData(8) + ";" ;
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == Video.class){
        widget_str = "Video;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName();
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == State.class){
        widget_str = "State;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + hex(Widget_list.get(i).getColor(0)) + ";" + hex(Widget_list.get(i).getColor(1)) + ";" + Widget_list.get(i).getHideTitle() + ";" + Widget_list.get(i).getHideInactiveState() + ";" + Widget_list.get(i).getStateSize() + ";";
        
        if( Widget_list.get(i).getStateSize() > 0 ){
          
          for( int j = 0 ; j < Widget_list.get(i).getStateSize() ; j++ ){
            
            widget_str = widget_str + Widget_list.get(i).getState(j) + ";" ;
            
          }
        }
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == TextArea.class){
        widget_str = "TextArea;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + Widget_list.get(i).getText() + ";" ;
        save_string_list.append( widget_str );
      }
      if( Widget_list.get(i).getClass() == Compass.class){
        widget_str = "Compass;" + Widget_list.get(i).getXPos() + ";" + Widget_list.get(i).getYPos() + ";" + Widget_list.get(i).getXSize() + ";" + Widget_list.get(i).getYSize() + 
        ";" + Widget_list.get(i).getName() + ";" + hex(Widget_list.get(i).getColor()) +
        ";" + Widget_list.get(i).getFirstBit() + ";" + Widget_list.get(i).getLastBit() + ";" + Widget_list.get(i).getDataType() + ";" + Widget_list.get(i).getExpression() + ";" + Widget_list.get(i).getHideDir() + ";" ;
        save_string_list.append( widget_str );
      }
      
      
      
    }
    
    
    
    
    save_pathfile = selection.getAbsolutePath() ;
    //println(save_pathfile);
    saveStrings( save_pathfile , save_string_list.array() );
    
  }
}


void objToLoad3d(File selection){
  Text1.setText( selection.getAbsolutePath() );
}

void fileToLoad(File selection) {
  
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    
    
      
    println("User selected " + selection.getAbsolutePath() );
  
    String[] lines = loadStrings(selection.getAbsolutePath());
    
    
    
    for (int i = Widget_list.size()-1; i>= 0; i--) {
      Widget_list.remove(i);
    }
    
    
    for ( int i = 0 ; i < lines.length; i++){
      
      String[] thisLine = split( lines[i] , ";" );
      
      // Option loading
      if (thisLine[0].equals("Option") ){
        
        default_background_color = unhex(thisLine[1]);
        default_background_plot_color = unhex(thisLine[2]);
        default_line_color = unhex(thisLine[3]);
        default_line_grad_color = unhex(thisLine[4]);
        default_text_grad_color = unhex(thisLine[5]);
        
      }
      
      
      // [KeyInput-4]
      
      // widget creator
      if (thisLine[0].equals("Graph") ){
        
        Widget_list.add( new Graph( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setTimeData( float(thisLine[6]) );
        Widget_list.get(Widget_list.size()-1).setShow0( boolean(thisLine[7]) );
        Widget_list.get(Widget_list.size()-1).setNbData( int(thisLine[8]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( 0 , int(thisLine[9]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 0 , int(thisLine[10]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 0 , int(thisLine[11]) );
        Widget_list.get(Widget_list.size()-1).setExpression( 0 , thisLine[12] );
        Widget_list.get(Widget_list.size()-1).setColor( 0 , unhex(thisLine[13]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( 1 , int(thisLine[14]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 1 , int(thisLine[15]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 1 , int(thisLine[16]) );
        Widget_list.get(Widget_list.size()-1).setExpression( 1 , thisLine[17] );
        Widget_list.get(Widget_list.size()-1).setColor( 1 , unhex(thisLine[18]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( 2 , int(thisLine[19]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 2 , int(thisLine[20]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 2 , int(thisLine[21]) );
        Widget_list.get(Widget_list.size()-1).setExpression( 2 , thisLine[22] );
        Widget_list.get(Widget_list.size()-1).setColor( 2 , unhex(thisLine[23]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( 3 , int(thisLine[24]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 3 , int(thisLine[25]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 3 , int(thisLine[26]) );
        Widget_list.get(Widget_list.size()-1).setExpression( 3 , thisLine[27] );
        Widget_list.get(Widget_list.size()-1).setColor( 3 , unhex(thisLine[28]) );
        
      }
      if (thisLine[0].equals("Bar") ){
        
        Widget_list.add( new Bar( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setColor( unhex(thisLine[6]) );
        Widget_list.get(Widget_list.size()-1).setMin( float(thisLine[7]) );
        Widget_list.get(Widget_list.size()-1).setMax( float(thisLine[8]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( int(thisLine[9]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( int(thisLine[10]) );
        Widget_list.get(Widget_list.size()-1).setDataType(  int(thisLine[11]) );
        Widget_list.get(Widget_list.size()-1).setExpression( thisLine[12] );
      }
      if (thisLine[0].equals("Gauge") ){
        
        Widget_list.add( new Gauge( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setColor( unhex(thisLine[6]) );
        Widget_list.get(Widget_list.size()-1).setMin( float(thisLine[7]) );
        Widget_list.get(Widget_list.size()-1).setMax( float(thisLine[8]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( int(thisLine[9]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( int(thisLine[10]) );
        Widget_list.get(Widget_list.size()-1).setDataType(  int(thisLine[11]) );
        Widget_list.get(Widget_list.size()-1).setExpression( thisLine[12] );
      }
      if (thisLine[0].equals("GraphXY") ){
        
        Widget_list.add( new Graph_XY( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setColor( unhex(thisLine[6]) );
        Widget_list.get(Widget_list.size()-1).setTimeData( float(thisLine[7]) );
        Widget_list.get(Widget_list.size()-1).setShow0( boolean(thisLine[8]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( 0 , int(thisLine[9]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 0 , int(thisLine[10]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 0 , int(thisLine[11]) );
        Widget_list.get(Widget_list.size()-1).setExpression( 0 , thisLine[12] );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( 1 , int(thisLine[13]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 1 , int(thisLine[14]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 1 , int(thisLine[15]) );
        Widget_list.get(Widget_list.size()-1).setExpression( 1 , thisLine[16] );
        
      }
      if (thisLine[0].equals("Model3D") ){
        
        
        
        
        
        Widget_list.add( new Model3D( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setFilePath( thisLine[6] );
        Widget_list.get(Widget_list.size()-1).setModel();
        Widget_list.get(Widget_list.size()-1).setScale( float(thisLine[7]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( 0 , int(thisLine[8]) );
        Widget_list.get(Widget_list.size()-1).setFirstBit( 1 , int(thisLine[9]) );
        Widget_list.get(Widget_list.size()-1).setFirstBit( 2 , int(thisLine[10]) );
        Widget_list.get(Widget_list.size()-1).setFirstBit( 3 , int(thisLine[11]) );
        Widget_list.get(Widget_list.size()-1).setFirstBit( 4 , int(thisLine[12]) );
        Widget_list.get(Widget_list.size()-1).setFirstBit( 5 , int(thisLine[13]) );
        
        Widget_list.get(Widget_list.size()-1).setLastBit( 0 , int(thisLine[14]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 1 , int(thisLine[15]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 2 , int(thisLine[16]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 3 , int(thisLine[17]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 4 , int(thisLine[18]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( 5 , int(thisLine[19]) );
        
        Widget_list.get(Widget_list.size()-1).setDataType( 0 , int(thisLine[20]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 1 , int(thisLine[21]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 2 , int(thisLine[22]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 3 , int(thisLine[23]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 4 , int(thisLine[24]) );
        Widget_list.get(Widget_list.size()-1).setDataType( 5 , int(thisLine[25]) );
        
        Widget_list.get(Widget_list.size()-1).setExpression( 0 , thisLine[26] );
        Widget_list.get(Widget_list.size()-1).setExpression( 1 , thisLine[27] );
        Widget_list.get(Widget_list.size()-1).setExpression( 2 , thisLine[28] );
        Widget_list.get(Widget_list.size()-1).setExpression( 3 , thisLine[29] );
        Widget_list.get(Widget_list.size()-1).setExpression( 4 , thisLine[30] );
        Widget_list.get(Widget_list.size()-1).setExpression( 5 , thisLine[31] );
        
        
        Widget_list.get(Widget_list.size()-1).setOffset( 0 , float(thisLine[32]) );
        Widget_list.get(Widget_list.size()-1).setOffset( 1 , float(thisLine[33]) );
        Widget_list.get(Widget_list.size()-1).setOffset( 2 , float(thisLine[34]) );
        
        Widget_list.get(Widget_list.size()-1).setRotationOffset( 0 , float(thisLine[35]) );
        Widget_list.get(Widget_list.size()-1).setRotationOffset( 1 , float(thisLine[36]) );
        Widget_list.get(Widget_list.size()-1).setRotationOffset( 2 , float(thisLine[37]) );
        
        
        Widget_list.get(Widget_list.size()-1).setCamData( 0 , int(thisLine[38]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 1 , int(thisLine[39]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 2 , int(thisLine[40]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 3 , int(thisLine[41]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 4 , int(thisLine[42]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 5 , int(thisLine[43]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 6 , int(thisLine[44]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 7 , int(thisLine[45]) );
        Widget_list.get(Widget_list.size()-1).setCamData( 8 , int(thisLine[46]) );
        
      }
      if (thisLine[0].equals("Video") ){
        
        Widget_list.add( new Video( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
      }
      if (thisLine[0].equals("State") ){
        
        Widget_list.add( new State( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setColor( 0 , unhex(thisLine[6]) );
        Widget_list.get(Widget_list.size()-1).setColor( 1 , unhex(thisLine[7]) );
        Widget_list.get(Widget_list.size()-1).setHideTitle(   Boolean.parseBoolean(thisLine[8] ) );
        Widget_list.get(Widget_list.size()-1).setHideInactiveState(   Boolean.parseBoolean(thisLine[9] ) );
        
        if( int(thisLine[10]) > 0 ){
          for( int j = 0 ; j < int(thisLine[10]) ; j++ ){
            
            Widget_list.get(Widget_list.size()-1).addState( thisLine[10+j] );
            
          }
        }
      }
      if (thisLine[0].equals("TextArea") ){
        
        Widget_list.add( new Video( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setText( thisLine[6] );
      }
      if (thisLine[0].equals("Compass") ){
        
        Widget_list.add( new Compass( int(thisLine[1]), int(thisLine[2]), int(thisLine[3]) ,int(thisLine[4])  ));
        
        Widget_list.get(Widget_list.size()-1).setName( thisLine[5] );
        Widget_list.get(Widget_list.size()-1).setColor( unhex(thisLine[6]) );
        
        Widget_list.get(Widget_list.size()-1).setFirstBit( int(thisLine[7]) );
        Widget_list.get(Widget_list.size()-1).setLastBit( int(thisLine[8]) );
        Widget_list.get(Widget_list.size()-1).setDataType(  int(thisLine[9]) );
        Widget_list.get(Widget_list.size()-1).setExpression( thisLine[10] );
        Widget_list.get(Widget_list.size()-1).setHideDir(   Boolean.parseBoolean(thisLine[11] ) );
      }
      
      
      
    
    
    }
    
    
    
    
  }
  
  
}




void keyPressed() {
  if (key == ESC) {
    key = 0;  // Avoid close app if escape key
  }
}
