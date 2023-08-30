
// [Constructor-0]

void Constructor( int widget ){
  
  
  if( mode == 4 ){
    mode = 5;
  }
  if( mode == 6 ){
    mode = 7;
  }
  
  
  strokeWeight(4);
  fill(default_background_color);
  stroke(default_line_color);
  rect( 2*size_block , 2*size_block , 14*size_block , 5*size_block );
  strokeWeight(1);
  
  
  

  // [Constructor-1]
  if( widget == 1 ){
    
    Number_of_graph = 0;
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    Time_data_Textfield.setPosition(930, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText(str(default_time_data))  ;
    
    FirstBit1_Textfield.setPosition(230, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit1_Textfield.setPosition(310, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression1_Textfield.setPosition(230, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    Color1_ColorPicker.setPosition(230, 590).setSize(255, 30).setColorValue(default_line_color).setLabel("Color");
    VariableType1.setPosition(390, 430).setSize(80, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    FirstBit2_Textfield.setPosition(530, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setVisible(false).setLabel("First bit").setText("")  ;
    LastBit2_Textfield.setPosition(610, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setVisible(false).setLabel("Last bit").setText("")  ;
    Expression2_Textfield.setPosition(530, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setVisible(false).setLabel("Expression")  ;
    Color2_ColorPicker.setPosition(530, 590).setSize(255, 30).setColorValue(color(94,146,255)).setVisible(false).setLabel("Color");
    VariableType2.setPosition(690, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setVisible(false);
    
    FirstBit3_Textfield.setPosition(830, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setVisible(false).setLabel("First bit").setText("")  ;
    LastBit3_Textfield.setPosition(910, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setVisible(false).setLabel("Last bit").setText("")  ;
    Expression3_Textfield.setPosition(830, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setVisible(false).setLabel("Expression")  ;
    Color3_ColorPicker.setPosition(830, 590).setSize(255, 30).setColorValue(color(50,185,85)).setVisible(false).setLabel("Color");
    VariableType3.setPosition(990, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setVisible(false);
    
    FirstBit4_Textfield.setPosition(1130, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setVisible(false).setLabel("First bit").setText("")  ;
    LastBit4_Textfield.setPosition(1210, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setVisible(false).setLabel("Last bit").setText("")  ;
    Expression4_Textfield.setPosition(1130, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setVisible(false).setLabel("Expression")  ;
    Color4_ColorPicker.setPosition(1130, 590).setSize(255, 30).setColorValue(color(255,255,89)).setVisible(false).setLabel("Color");
    VariableType4.setPosition(1290, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setVisible(false);
    
    Number_of_graph_List.setPosition(675, 283).setSize(150, 120).clear().addItem("1",0).addItem("2",1).addItem("3",2).addItem("4",3).setOpen(false).setItemHeight(20).setBarHeight(25).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setValue(0);
    
    show0_Toggle.setPosition(1200, 280).setSize(30, 30).setLabel("Show 0").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font);
    show0_Toggle.setValue( false );
    
    widget_to_create_selected = -widget_to_create_selected;
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      Time_data_Textfield.setText( str( Widget_list.get( widget_to_modify ).getTimeData() ) );
      
      FirstBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit(0) ) );
      LastBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit(0) ) );
      Expression1_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(0)  );
      Color1_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor(0)   );
      VariableType1.setValue( Widget_list.get( widget_to_modify ).getDataType(0) );
      
      FirstBit2_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit(1) ) );
      LastBit2_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit(1) ) );
      Expression2_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(1)  );
      Color2_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor(1)   );
      VariableType2.setValue( Widget_list.get( widget_to_modify ).getDataType(1) );
      
      FirstBit3_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit(2) ) );
      LastBit3_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit(2) ) );
      Expression3_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(2)  );
      Color3_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor(2)   );
      VariableType3.setValue( Widget_list.get( widget_to_modify ).getDataType(2) );
      
      FirstBit4_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit(3) ) );
      LastBit4_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit(3) ) );
      Expression4_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(3)  );
      Color4_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor(3)   );
      VariableType4.setValue( Widget_list.get( widget_to_modify ).getDataType(3) );
      
      Number_of_graph_List.setType( Widget_list.get( widget_to_modify ).getNbData() );
      Number_of_graph = Widget_list.get( widget_to_modify ).getNbData()-1;
      
      show0_Toggle.setValue( Widget_list.get( widget_to_modify ).getShow0() );
    }
    
    
  }
  if( widget == 2 ){
    textFont(big_font);
    fill( default_line_color );
    text("Configure bar", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    
    FirstBit1_Textfield.setPosition(230, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit1_Textfield.setPosition(310, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression1_Textfield.setPosition(230, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    Color1_ColorPicker.setPosition(230, 590).setSize(255, 30).setColorValue(default_line_color).setLabel("Color");
    VariableType1.setPosition(390, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    Min_data_Textfield.setPosition(780, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("0")  ;
    Max_data_Textfield.setPosition(1030, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("100")  ;
    
    widget_to_create_selected = -widget_to_create_selected;
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      
      FirstBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit() ) );
      LastBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit() ) );
      Expression1_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression()  );
      Color1_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor()   );
      VariableType1.setValue( Widget_list.get( widget_to_modify ).getDataType() );
      
      Min_data_Textfield.setText( str( Widget_list.get( widget_to_modify ).getMin() ) );
      Max_data_Textfield.setText( str( Widget_list.get( widget_to_modify ).getMax() ) );
    }
    
  }
  if( widget == 3 ){
    textFont(big_font);
    fill( default_line_color );
    text("Configure gauge", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    
    FirstBit1_Textfield.setPosition(230, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit1_Textfield.setPosition(310, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression1_Textfield.setPosition(230, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    Color1_ColorPicker.setPosition(230, 590).setSize(255, 30).setColorValue(default_line_color).setLabel("Color");
    VariableType1.setPosition(390, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    Min_data_Textfield.setPosition(780, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("-100")  ;
    Max_data_Textfield.setPosition(1030, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("100")  ;
    
    widget_to_create_selected = -widget_to_create_selected;
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      
      FirstBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit() ) );
      LastBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit() ) );
      Expression1_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression()  );
      Color1_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor()   );
      VariableType1.setValue( Widget_list.get( widget_to_modify ).getDataType() );
      
      Min_data_Textfield.setText( str( Widget_list.get( widget_to_modify ).getMin() ) );
      Max_data_Textfield.setText( str( Widget_list.get( widget_to_modify ).getMax() ) );
    }
    
  }
  if( widget == 4 ){
    textFont(big_font);
    fill( default_line_color );
    text("Configure graph XY", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    Time_data_Textfield.setPosition(930, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText(str(default_time_data))  ;
    
    
    FirstBit1_Textfield.setPosition(230, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit1_Textfield.setPosition(310, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression1_Textfield.setPosition(230, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    Color1_ColorPicker.setPosition(230, 590).setSize(255, 30).setColorValue(default_line_color).setLabel("Color of value");
    VariableType1.setPosition(390, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    FirstBit2_Textfield.setPosition(530, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit2_Textfield.setPosition(610, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression2_Textfield.setPosition(530, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    VariableType2.setPosition(690, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    show0_Toggle.setPosition(1200, 280).setSize(30, 30).setLabel("Show 0").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font);
    show0_Toggle.setValue( false );
    
    
    widget_to_create_selected = -widget_to_create_selected;
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      Time_data_Textfield.setText( str( Widget_list.get( widget_to_modify ).getTimeData() ) );
      
      FirstBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit(0) ) );
      LastBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit(0) ) );
      Expression1_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(0)  );
      Color1_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor()   );
      VariableType1.setValue( Widget_list.get( widget_to_modify ).getDataType(0) );
      
      FirstBit2_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit(1) ) );
      LastBit2_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit(1) ) );
      Expression2_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(1)  );
      VariableType2.setValue( Widget_list.get( widget_to_modify ).getDataType(1) );
      
      show0_Toggle.setValue( Widget_list.get( widget_to_modify ).getShow0() );
      
    }
    
  }
  if( widget == 5 ){
    textFont(big_font);
    fill( default_line_color );
    text("Configure 3D model", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    Color1_ColorPicker.setPosition(230, 340).setSize(255, 30).setColorValue(default_line_color).setLabel("Color of value");
    
    FirstBit1_Textfield.setPosition(630, 280).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit1_Textfield.setPosition(700, 280).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression1_Textfield.setPosition(630, 350).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    VariableType1.setPosition(780, 280).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    FirstBit2_Textfield.setPosition(850, 280).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit2_Textfield.setPosition(920, 280).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression2_Textfield.setPosition(850, 350).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    VariableType2.setPosition(1000, 280).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    FirstBit3_Textfield.setPosition(1070, 280).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit3_Textfield.setPosition(1140, 280).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression3_Textfield.setPosition(1070, 350).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    VariableType3.setPosition(1220, 280).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    FirstBit4_Textfield.setPosition(630, 500).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit4_Textfield.setPosition(700, 500).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression4_Textfield.setPosition(630, 570).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    VariableType4.setPosition(780, 500).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    FirstBit5_Textfield.setPosition(850, 500).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit5_Textfield.setPosition(920, 500).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression5_Textfield.setPosition(850, 570).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    VariableType5.setPosition(1000, 500).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    FirstBit6_Textfield.setPosition(1070, 500).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit6_Textfield.setPosition(1140, 500).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression6_Textfield.setPosition(1070, 570).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    VariableType6.setPosition(1220, 500).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    
    OffsetX_Textfield.setPosition(380, 450).setSize(70, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Offset X").setText("0")  ;
    OffsetY_Textfield.setPosition(380, 510).setSize(70, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Offset Y").setText("0")  ;
    OffsetZ_Textfield.setPosition(380, 570).setSize(70, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Offset Z").setText("0")  ;
    
    OffsetX_rotation_Textfield.setPosition(460, 450).setSize(70, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Offset rotation X").setText("0")  ;
    OffsetY_rotation_Textfield.setPosition(460, 510).setSize(70, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Offset rotation Y").setText("0")  ;
    OffsetZ_rotation_Textfield.setPosition(460, 570).setSize(70, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Offset rotation Z").setText("0")  ;
    
    
    eyeX_Textfield.setPosition(1300, 240).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Eye X").setText("100")  ;
    eyeY_Textfield.setPosition(1300, 300).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Eye Y").setText("-100")  ;
    eyeZ_Textfield.setPosition(1300, 360).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("100").setLabel("Eye Z")  ;
    
    centerX_Textfield.setPosition(1300, 460).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Center X").setText("0")  ;
    centerY_Textfield.setPosition(1300, 520).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Center Y").setText("-30")  ;
    centerZ_Textfield.setPosition(1450, 460).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("0").setLabel("Center Z")  ;
    
    upX_Textfield.setPosition(1450, 240).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Up X").setText("0")  ;
    upY_Textfield.setPosition(1450, 300).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Up Y").setText("1")  ;
    upZ_Textfield.setPosition(1450, 360).setSize(100, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("0").setLabel("Up Z")  ;
    
    Scale_Textfield.setPosition(240, 450).setSize(70, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Scale").setText("1.0")  ;
    
    
    Text1.setPosition(230, 650).setSize(100, 400).setText("").setFont(title_font).setColor(color(default_line_color)).setLineHeight(30);
    
    widget_to_create_selected = -widget_to_create_selected;
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      
      FirstBit1_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getFirstBit(0))   );
      FirstBit2_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getFirstBit(1))   );
      FirstBit3_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getFirstBit(2))   );
      FirstBit4_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getFirstBit(3))   );
      FirstBit5_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getFirstBit(4))   );
      FirstBit6_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getFirstBit(5))   );
      
      LastBit1_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getLastBit(0))   );
      LastBit2_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getLastBit(1))   );
      LastBit3_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getLastBit(2))   );
      LastBit4_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getLastBit(3))   );
      LastBit5_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getLastBit(4))   );
      LastBit6_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getLastBit(5))   );
      
      Expression1_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(0)  );
      Expression2_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(1)  );
      Expression3_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(2)  );
      Expression4_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(3)  );
      Expression5_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(4)  );
      Expression6_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression(5)  );
      
      VariableType1.setValue( Widget_list.get( widget_to_modify ).getDataType(0) );
      VariableType2.setValue( Widget_list.get( widget_to_modify ).getDataType(1) );
      VariableType3.setValue( Widget_list.get( widget_to_modify ).getDataType(2) );
      VariableType4.setValue( Widget_list.get( widget_to_modify ).getDataType(3) );
      VariableType5.setValue( Widget_list.get( widget_to_modify ).getDataType(4) );
      VariableType6.setValue( Widget_list.get( widget_to_modify ).getDataType(5) );
      
      OffsetX_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getOffset(0))   );
      OffsetY_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getOffset(1))   );
      OffsetZ_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getOffset(2))   );
      
      OffsetX_rotation_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getRotationOffset(0))   );
      OffsetY_rotation_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getRotationOffset(1))   );
      OffsetZ_rotation_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getRotationOffset(2))   );
      
      eyeX_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(0))   );
      eyeY_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(1))   );
      eyeZ_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(2))   );
      
      centerX_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(3))   );
      centerY_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(4))   );
      centerZ_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(5))   );
      
      upX_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(6))   );
      upY_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(7))   );
      upZ_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getCamData(8))   );
      
      Scale_Textfield.setText(  str(Widget_list.get( widget_to_modify ).getScale())   );
      
      Text1.setText(   Widget_list.get( widget_to_modify ).getFilePath()    );
      
    }
    
  }
  if( widget == 6 ){
    textFont(big_font);
    fill( default_line_color );
    text("Configure video", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    widget_to_create_selected = -widget_to_create_selected;
    
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
    }
  }
  if( widget == 7 ){
    textFont(big_font);
    fill( default_line_color );
    text("Configure state", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    
    FirstBit1_Textfield.setPosition(230, 360).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit1_Textfield.setPosition(310, 360).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression1_Textfield.setPosition(230, 420).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    Color1_ColorPicker.setPosition(230, 490).setSize(255, 30).setColorValue(default_line_color).setLabel("Color of active state");
    Color2_ColorPicker.setPosition(230, 590).setSize(255, 30).setColorValue(default_line_grad_color).setLabel("Color of inactive state");
    
    State_List.setPosition(540, 290).setSize(200, 180).clear().setOpen(false).setItemHeight(20).setBarHeight(25).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    add_Button.activateBy( ControlP5.RELEASE ).setPosition(750,470).setSize(40,40).setFont(big_font).setLabel("+").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    suppress_Button.activateBy( ControlP5.RELEASE ).setPosition(750,530).setSize(40,40).setFont(big_font).setLabel("-").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    Expression2_Textfield.setPosition(540, 475).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("").setLabel("").setVisible(true)  ;
    
    hide1_Toggle.setPosition(540, 550).setSize(30, 30).setLabel("Hide title").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font);
    hide2_Toggle.setPosition(540, 620).setSize(30, 30).setLabel("Hide inactive states").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font);
    
    
    widget_to_create_selected = -widget_to_create_selected;
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      
      FirstBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit() ) );
      LastBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit() ) );
      Expression1_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression()  );
      Color1_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor(0)   );
      Color2_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor(1)   );
      
     if( Widget_list.get( widget_to_modify ).getStateSize() > 0 ){
       
       for( int i = 0 ; i < Widget_list.get( widget_to_modify ).getStateSize() ; i++ ){
         State_List.addItem(  Widget_list.get( widget_to_modify ).getState(i) , i );
       }
     }
     
     hide1_Toggle.setValue( Widget_list.get( widget_to_modify ).getHideTitle() );
     hide2_Toggle.setValue( Widget_list.get( widget_to_modify ).getHideInactiveState() );
     
      
    }
    
  }
  if( widget == 8 ){
    textFont(big_font);
    fill( default_line_color );
    text("Configure text area", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    Expression1_Textfield.setPosition(230, 350).setSize(460, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("").setLabel("Text")  ;
    TextArea1.setPosition(230, 410).setSize(460, 260).setColor(color(default_line_color)).setText("").setFont(title_font);
    
    
    widget_to_create_selected = -widget_to_create_selected;
    
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      Expression1_Textfield.setText( Widget_list.get( widget_to_modify ).getConstructorText().replace("\n", "\\n" ) );
      
      
    }
    
  }
  if( widget == 9 ){
    
    textFont(big_font);
    fill( default_line_color );
    text("Configure compass", 2*size_block + 30 , 2*size_block + 50 );
    
    Title_Textfield.setPosition(230, 280).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("name")  ;
    
    
    FirstBit1_Textfield.setPosition(230, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("First bit").setText("")  ;
    LastBit1_Textfield.setPosition(310, 430).setSize(60, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setLabel("Last bit").setText("")  ;
    Expression1_Textfield.setPosition(230, 500).setSize(260, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText("x").setLabel("Expression")  ;
    Color1_ColorPicker.setPosition(230, 590).setSize(255, 30).setColorValue(default_line_color).setLabel("Color");
    VariableType1.setPosition(390, 430).setSize(50, 100).clear().addItem("Int",0).addItem("Float",1).addItem("Half Float",2).setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    hide1_Toggle.setPosition(540, 280).setSize(30, 30).setLabel("Hide direction").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font);
    
    widget_to_create_selected = -widget_to_create_selected;
    
    if( mode == 7 ){
      Title_Textfield.setText( Widget_list.get( widget_to_modify ).getName() );
      
      FirstBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getFirstBit() ) );
      LastBit1_Textfield.setText( str( Widget_list.get( widget_to_modify ).getLastBit() ) );
      Expression1_Textfield.setText(  Widget_list.get( widget_to_modify ).getExpression()  );
      Color1_ColorPicker.setColorValue(   Widget_list.get( widget_to_modify ).getColor()   );
      VariableType1.setValue( Widget_list.get( widget_to_modify ).getDataType() );
      
      hide1_Toggle.setValue( Widget_list.get( widget_to_modify ).getHideDir() );
      
      }
    }
  
  
  
  if( widget == -1 ){
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure graph", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    
    text("Number of data in graph :", 490 , 300);
    
    text("Color 1", 230 , 670);
    
    
    fill(default_background_color);
    stroke(default_line_color);
    
    
    
    
    if( Number_of_graph == 0){
      FirstBit2_Textfield.setVisible(false);
      LastBit2_Textfield.setVisible(false);
      Expression2_Textfield.setVisible(false);
      Color2_ColorPicker.setVisible(false);
      VariableType2.setVisible(false);
      
      FirstBit3_Textfield.setVisible(false);
      LastBit3_Textfield.setVisible(false);
      Expression3_Textfield.setVisible(false);
      Color3_ColorPicker.setVisible(false);
      VariableType3.setVisible(false);
      
      FirstBit4_Textfield.setVisible(false);
      LastBit4_Textfield.setVisible(false);
      Expression4_Textfield.setVisible(false);
      Color4_ColorPicker.setVisible(false);
      VariableType4.setVisible(false);
      
      
      rect( 220 , 420 , 280 , 265 );
      
      fill( default_line_color );
      text("Color 1", 230 , 670);
      
    }
    if( Number_of_graph == 1){
      FirstBit2_Textfield.setVisible(true);
      LastBit2_Textfield.setVisible(true);
      Expression2_Textfield.setVisible(true);
      Color2_ColorPicker.setVisible(true);
      VariableType2.setVisible(true);
      
      FirstBit3_Textfield.setVisible(false);
      LastBit3_Textfield.setVisible(false);
      Expression3_Textfield.setVisible(false);
      Color3_ColorPicker.setVisible(false);
      VariableType3.setVisible(false);
      
      FirstBit4_Textfield.setVisible(false);
      LastBit4_Textfield.setVisible(false);
      Expression4_Textfield.setVisible(false);
      Color4_ColorPicker.setVisible(false);
      VariableType4.setVisible(false);
      
      
      rect( 220 , 420 , 280 , 265 );
      rect( 520 , 420 , 280 , 265 );
      
      fill( default_line_color );
      text("Color 1", 230 , 670);
      text("Color 2", 530 , 670);
    }
    if( Number_of_graph == 2){
      FirstBit2_Textfield.setVisible(true);
      LastBit2_Textfield.setVisible(true);
      Expression2_Textfield.setVisible(true);
      Color2_ColorPicker.setVisible(true);
      VariableType2.setVisible(true);
      
      FirstBit3_Textfield.setVisible(true);
      LastBit3_Textfield.setVisible(true);
      Expression3_Textfield.setVisible(true);
      Color3_ColorPicker.setVisible(true);
      VariableType3.setVisible(true);
      
      FirstBit4_Textfield.setVisible(false);
      LastBit4_Textfield.setVisible(false);
      Expression4_Textfield.setVisible(false);
      Color4_ColorPicker.setVisible(false);
      VariableType4.setVisible(false);
      
      
      rect( 220 , 420 , 280 , 265 );
      rect( 520 , 420 , 280 , 265 );
      rect( 820 , 420 , 280 , 265 );
      
      fill( default_line_color );
      text("Color 1", 230 , 670);
      text("Color 2", 530 , 670);
      text("Color 3", 830 , 670);
    }
    if( Number_of_graph == 3){
      FirstBit2_Textfield.setVisible(true);
      LastBit2_Textfield.setVisible(true);
      Expression2_Textfield.setVisible(true);
      Color2_ColorPicker.setVisible(true);
      VariableType2.setVisible(true);
      
      FirstBit3_Textfield.setVisible(true);
      LastBit3_Textfield.setVisible(true);
      Expression3_Textfield.setVisible(true);
      Color3_ColorPicker.setVisible(true);
      VariableType3.setVisible(true);
      
      FirstBit4_Textfield.setVisible(true);
      LastBit4_Textfield.setVisible(true);
      Expression4_Textfield.setVisible(true);
      Color4_ColorPicker.setVisible(true);
      VariableType4.setVisible(true);
      
      
      rect( 220 , 420 , 280 , 265 );
      rect( 520 , 420 , 280 , 265 );
      rect( 820 , 420 , 280 , 265 );
      rect( 1120 , 420 , 280 , 265 );
      
      fill( default_line_color );
      text("Color 1", 230 , 670);
      text("Color 2", 530 , 670);
      text("Color 3", 830 , 670);
      text("Color 4", 1130 , 670);
    }
    
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -2 ){
    
    fill(default_background_color);
    stroke(default_line_color);
    rect( 220 , 420 , 280 , 265 );
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure bar", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    text("Color of bar", 230 , 670);
    
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -3 ){
    
    fill(default_background_color);
    stroke(default_line_color);
    rect( 220 , 420 , 280 , 265 );
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure gauge", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    text("Color of gauge", 230 , 670);
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -4 ){
    
    fill(default_background_color);
    stroke(default_line_color);
    rect( 220 , 420 , 580 , 265 );
    rect( 220 , 390 , 50 , 30 );
    rect( 520 , 390 , 50 , 30 );
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure graph XY", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    text("Color of value", 230 , 670);
    
    text("X", 240 , 410);
    text("Y", 540 , 410);
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -5 ){
    
    fill(default_background_color);
    stroke(default_line_color);
    
    rect( 620 , 210 , 660 , 210 );
    rect( 620 , 430 , 660 , 210 );
    rect( 1290 , 210 , 270 , 370 );
    rect( 220 , 440 , 390 , 250 );
    
    rect( 620 , 270 , 660 , 150 );
    rect( 620 , 490 , 660 , 150 );
    
    
    
    rect( 620 , 250 , 50 , 20 );
    rect( 840 , 250 , 50 , 20 );
    rect( 1060 , 250 , 50 , 20 );
    
    rect( 620 , 470 , 50 , 20 );
    rect( 840 , 470 , 50 , 20 );
    rect( 1060 , 470 , 50 , 20 );
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure 3D model", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    text("Name color", 230 , 420);
    
    text("X", 640 , 265);
    text("Y", 860 , 265);
    text("Z", 1080 , 265);
    
    text("X", 640 , 485);
    text("Y", 860 , 485);
    text("Z", 1080 , 485);
    
    
    text("Object rotation (X,Y,Z)", 630 , 230);
    text("Object arc (X,Y,Z)", 630 , 450);
    text("Camera config", 1300 , 230);
    
    
    image(import_logo, 230, 570);
    text("Choose model file", 230 , 580);
    
    
    
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -6 ){
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure video", 2*size_block + 30 , 2*size_block + 50 );
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -7 ){
    
    
    fill(default_background_color);
    stroke(default_line_color);
    
    rect( 220 , 350 , 280 , 335 );
    rect( 520 , 280 , 280 , 405 );
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure state", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    text("Color of active state", 230 , 670);
    text("Color of inactive state", 230 , 570);
    text("Only int", 410 , 380);
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -8 ){
    
    fill(default_background_color);
    stroke(default_line_color);
    
    rect( 220 , 340 , 480 , 340 );
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure text area", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    text( "To use variable in the text write the type with\"i\" for int or \"f\" for float then {} with \nthe expression and in [] the bits separated by a \"-\" where the information is.\nFor example : i{x/2-50[4-12]}\n\nUse \"\\n\" for line break.\nDon't use \";\"." , 720 , 370 );
    
    
    TextArea1.clear().append( Expression1_Textfield.getText().replace("\\n", "\n" ) );
    
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  if( widget == -9 ){
    
    fill(default_background_color);
    stroke(default_line_color);
    rect( 220 , 420 , 280 , 265 );
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Configure compass", 2*size_block + 30 , 2*size_block + 50 );
    
    textFont(title_font);
    text("Color of compass", 230 , 670);
    
    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  
  
  
  // option mode
  
  if( widget == 1000 ){
    textFont(big_font);
    fill( default_line_color );
    text("Options", 2*size_block + 30 , 2*size_block + 50 );
    
    DefaultColor_ColorPicker.setPosition( 2*size_block + 30 , 2*size_block + 150 ).setColorValue(default_line_color);
    DefaultBackgroundColor_ColorPicker.setPosition( 2*size_block + 30 , 2*size_block + 250 ).setColorValue(default_background_color);
    DefaultBackgroundPlotColor_ColorPicker.setPosition( 2*size_block + 30 , 2*size_block + 350 ).setColorValue(default_background_plot_color);
    DefaultGradColor_ColorPicker.setPosition( 2*size_block + 330 , 2*size_block + 150 ).setColorValue(default_line_grad_color);
    DefaultGradTextColor_ColorPicker.setPosition( 2*size_block + 330 , 2*size_block + 250 ).setColorValue(default_text_grad_color);
    
    Com_List.setPosition( 2*size_block + 330 , 2*size_block + 40 ).setSize(200, 100).setBarHeight(20).setItemHeight(20).clear().setOpen(false).setItemHeight(20).setBarHeight(30).setVisible(true).setValue(0).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color));
    
    
    Baudrate_Textfield.setPosition(800, 240).setSize(200, 30).setAutoClear(false).setColor(color(default_line_color)).setColorCursor(40).setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font).setText(str(baudrate))  ;
    saveData_Toggle.setPosition(1040, 240).setSize(30, 30).setLabel("Save data").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font);
    saveData_Toggle.setValue( saveData_bool );
    testData_Toggle.setPosition(1150, 240).setSize(30, 30).setLabel("Test data (float between 0 and 100)").setColorBackground(color(default_background_plot_color)).setColorForeground(color(default_line_color)).setColorLabel(color(default_line_color)).setColorActive(color(default_line_color)).setFont(title_font);
    testData_Toggle.setValue( testData );
    
    for( int i = 0 ; i < Serial.list().length ; i++ ){
      Com_List.addItem( Serial.list()[i] ,i);
    }
    
    
    
    widget_to_create_selected = -widget_to_create_selected;
  }
  if( widget == -1000 ){
    
    fill(default_background_color);
    stroke(default_line_color);
    
    rect( 220 , 310 , 575 , 375 );
    
    
    textFont(big_font);
    fill( default_line_color );
    
    text("Options", 2*size_block + 30 , 2*size_block + 50 );
    
    
    textFont(title_font);
    text("Default color", 2*size_block + 30 , 2*size_block + 140 );
    text("Default background color", 2*size_block + 30 , 2*size_block + 240 );
    text("Default background plot color", 2*size_block + 30 , 2*size_block + 340 );
    text("Default grad color", 2*size_block + 330 , 2*size_block + 140 );
    text("Default grad text color", 2*size_block + 330 , 2*size_block + 240 );
    
    text("Choose Com port", 2*size_block + 330 , 2*size_block + 30 );


    
    image( validate_logo, 15*size_block , 6*size_block );
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}



void hide_constructor(){
  
  // [Constructor-2]
    
    widget_to_modify = -1;
    widget_to_create_selected = 0;
    arrayCopy( default_selection , selection);
    arrayCopy( default_selection , modified_selection);
  
    Title_Textfield.setPosition(-1000, -1000);
    Time_data_Textfield.setPosition(-1000, -1000);
    
    FirstBit1_Textfield.setPosition(-1000, -1000);
    LastBit1_Textfield.setPosition(-1000, -1000);
    Expression1_Textfield.setPosition(-1000, -1000);
    Color1_ColorPicker.setPosition(-1000, -1000);
    VariableType1.setPosition(-1000, -1000);
    
    FirstBit1_Textfield.setVisible(true);
    LastBit1_Textfield.setVisible(true);
    Expression1_Textfield.setVisible(true);
    Color1_ColorPicker.setVisible(true);
    VariableType1.setVisible(true);
    
    FirstBit2_Textfield.setPosition(-1000, -1000);
    LastBit2_Textfield.setPosition(-1000, -1000);
    Expression2_Textfield.setPosition(-1000, -1000);
    Color2_ColorPicker.setPosition(-1000, -1000);
    VariableType2.setPosition(-1000, -1000);
    
    FirstBit2_Textfield.setVisible(true);
    LastBit2_Textfield.setVisible(true);
    Expression2_Textfield.setVisible(true);
    Color2_ColorPicker.setVisible(true);
    VariableType2.setVisible(true);
    
    FirstBit3_Textfield.setPosition(-1000, -1000);
    LastBit3_Textfield.setPosition(-1000, -1000);
    Expression3_Textfield.setPosition(-1000, -1000);
    Color3_ColorPicker.setPosition(-1000, -1000);
    VariableType3.setPosition(-1000, -1000);
    
    FirstBit3_Textfield.setVisible(true);
    LastBit3_Textfield.setVisible(true);
    Expression3_Textfield.setVisible(true);
    Color3_ColorPicker.setVisible(true);
    VariableType3.setVisible(true);
    
    FirstBit4_Textfield.setPosition(-1000, -1000);
    LastBit4_Textfield.setPosition(-1000, -1000);
    Expression4_Textfield.setPosition(-1000, -1000);
    Color4_ColorPicker.setPosition(-1000, -1000);
    VariableType4.setPosition(-1000, -1000);
      
    FirstBit4_Textfield.setVisible(true);
    LastBit4_Textfield.setVisible(true);
    Expression4_Textfield.setVisible(true);
    Color4_ColorPicker.setVisible(true);
    VariableType4.setVisible(true);
      
    
    Number_of_graph_List.setPosition(-1000, -1000);
    Min_data_Textfield.setPosition(-1000, -1000);
    Max_data_Textfield.setPosition(-1000, -1000);
    
    DefaultColor_ColorPicker.setPosition(-1000, -1000);
    DefaultBackgroundColor_ColorPicker.setPosition(-1000, -1000);
    DefaultBackgroundPlotColor_ColorPicker.setPosition(-1000, -1000);
    DefaultGradColor_ColorPicker.setPosition(-1000, -1000);
    DefaultGradTextColor_ColorPicker.setPosition(-1000, -1000);
    
    FirstBit5_Textfield.setPosition(-1000, -1000);
    LastBit5_Textfield.setPosition(-1000, -1000);
    Expression5_Textfield.setPosition(-1000, -1000);
    VariableType5.setPosition(-1000, -1000);
    
    FirstBit6_Textfield.setPosition(-1000, -1000);
    LastBit6_Textfield.setPosition(-1000, -1000);
    Expression6_Textfield.setPosition(-1000, -1000);
    VariableType6.setPosition(-1000, -1000);
    
    
    OffsetX_Textfield.setPosition(-1000, -1000);
    OffsetY_Textfield.setPosition(-1000, -1000);
    OffsetZ_Textfield.setPosition(-1000, -1000);
    
    OffsetX_rotation_Textfield.setPosition(-1000, -1000);
    OffsetY_rotation_Textfield.setPosition(-1000, -1000);
    OffsetZ_rotation_Textfield.setPosition(-1000, -1000);
    
    
    eyeX_Textfield.setPosition(-1000, -1000);
    eyeY_Textfield.setPosition(-1000, -1000);
    eyeZ_Textfield.setPosition(-1000, -1000);
    
    centerX_Textfield.setPosition(-1000, -1000);
    centerY_Textfield.setPosition(-1000, -1000);
    centerZ_Textfield.setPosition(-1000, -1000);
    
    upX_Textfield.setPosition(-1000, -1000);
    upY_Textfield.setPosition(-1000, -1000);
    upZ_Textfield.setPosition(-1000, -1000);
    
    Scale_Textfield.setPosition(-1000, -1000);
    
    State_List.setPosition(-1000, -1000);
    add_Button.setPosition(-1000, -1000);
    suppress_Button.setPosition(-1000, -1000);
    hide1_Toggle.setPosition(-1000, -1000);
    hide2_Toggle.setPosition(-1000, -1000);
    
    
    Text1.setPosition(-1000, -1000);
    TextArea1.setPosition(-1000, -1000);
    
    Com_List.setPosition(-1000, -1000);
    Baudrate_Textfield.setPosition(-1000, -1000);
    saveData_Toggle.setPosition(-1000, -1000);
    testData_Toggle.setPosition(-1000, -1000);
    
    show0_Toggle.setPosition(-1000, -1000);
    
  
    color_mode = default_line_color;
}







void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    //println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    //println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
    
    
    if( theEvent.getController() ==  Number_of_graph_List ){
      Number_of_graph = (int) theEvent.getController().getValue();
      
    }
    
    
    if( theEvent.getController() ==  add_Button && widget_to_create_selected == -7 ){
      
      State_List.addItem( Expression2_Textfield.getText() , State_List.getItems().size() );
      Expression2_Textfield.setText("");
      
    }
    if( theEvent.getController() ==  suppress_Button && widget_to_create_selected == -7 ){
      
      State_List.removeItem( State_List.getLabel() );
      
      
    }
    
    
    
    
  }
}
