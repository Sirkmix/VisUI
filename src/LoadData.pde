
// [LoadData-0]

import java.nio.file.*;
import java.io.BufferedOutputStream;
import static java.nio.file.StandardOpenOption.*;

String Last_print = "";



int save_test =0;

int start_of_frame = 0xBB;
int end_of_frame1 = 0x0A;
int end_of_frame2 = 0xAA;
int end_of_frame3 = 0xFA;

byte[] inBuffer = new byte[nBit];
int Previous_read = 0;


String LoadData( int b1 , int b2 , String type, Expression expr){
  
  String val = "NaN";
  
  // test value
  
  if( testData == true){
    
    
    val = str( random(0,100)) ;
    
    try{
      val = str(expr.eval(float(val)).answer().toFloat());
    }
    catch( Exception e){
      println( "Error      " , e );
    }
    
    return val ;
  }
  
  
  
  
  // value from serial 
  
  
  // retirer le false
  
  if( Buffer != null){
    
    
    
    try{

      
      if( type.equals("Int")){
        
        val = str( (int)Long.parseLong( Buffer_bin.substring(b1, b2), 2) )  ;
        //println( Buffer_bin );
        //println(val);
        /*
        println(Buffer);
        println( Buffer_bin.substring(b1, b2) );
        println(val);*/
        
      }
      if( type.equals("Float")){
        
        val = str( Float.intBitsToFloat( (int)Long.parseLong( Buffer_bin.substring(b1, b2), 2) ) );
        
      }
      if( type.equals("Half Float")){
        
        int half = (int)Long.parseLong( Buffer_bin.substring(b1, b2), 2);

        float half_float;

        int sign = (half & 0x8000) << 16;
        int exponent = ((half & 0x7C00) >> 10) - 15;
        int fraction = half & 0x03FF;

        if (exponent == 16) {
            if (fraction == 0) {
                half_float = Float.POSITIVE_INFINITY;
            } else {
                half_float = Float.NaN;
            }
        }
        else
        {
          int floatValue = sign | ((exponent + 127) << 23) | (fraction << 13);
          half_float = Float.intBitsToFloat(floatValue);
        }
        val = str( half_float );
        
      }
      
      
    }
    catch( StringIndexOutOfBoundsException e ){}
    
  }
  
  
  
  try{
    val = str(expr.eval(float(val)).answer().toFloat());
  }
  catch( Exception e){
    println( "Error      " , e );
  }
  
  return val;
}




void requestData() {
  
  
    
  
  try{
  
    if (myPort.available() > 0) {
      
      boolean complete = false;
      
      byte[] process_Buffer = new byte[nBit];
      int Bytes_read = 0;
      
      
      //println(inBuffer.length);
      //Bytes_read = myPort.readBytesUntil(0xFA, inBuffer);
      //println(Bytes_read);
      

      Bytes_read = myPort.readBytesUntil(0xFA, process_Buffer);
      myPort.clear();
      //println(Bytes_read);
      if(Bytes_read != 0)
      {
        System.arraycopy(process_Buffer, 0, inBuffer, Previous_read, Bytes_read);
        //inBuffer = process_Buffer;
        Previous_read =+ Bytes_read;
        //println(Previous_read);
        if( ( inBuffer[Previous_read-2] == (byte)end_of_frame2) && ( inBuffer[Previous_read-3] == (byte)end_of_frame1) && ( inBuffer[0] == (byte)start_of_frame))
        {
          complete = true;
          Previous_read = 0;
        }
        else if( inBuffer[0] == (byte)start_of_frame )
        {
          inBuffer = new byte[nBit];
          Previous_read = 0;
        }
        
      }
      
      
      
      
      if (inBuffer != null && complete) {
        Buffer = inBuffer;
        Buffer_bin = "";
        save_test +=1;
        
        for( int i = 0; i < Buffer.length ; i++ ){
      
          Buffer_bin = Buffer_bin + binary( Buffer[i] , 8 );
          
          
        }
        

      }
      
      
    }
    println( str( (int)Long.parseLong( Buffer_bin.substring(24, 56), 2) )  , "     " , Buffer_bin.substring(24, 56),"     " , Buffer_bin );
    
    
    
    
    if( saveTiming == -1 && saveData_bool == true){
      String namefile = "saveData/" + year() + ";" + month() + ";" + day() + ";" + hour() + ";" + minute() + ";" + second() + ".txt" ;
      saveTiming = frameCount ;
      output = createWriter( namefile );
    }
    if( abs(saveTiming-frameCount) > saveTimeLimit && saveData_bool == true){
      String namefile = "saveData/" + year() + ";" + month() + ";" + day() + ";" + hour() + ";" + minute() + ";" + second() + ".txt" ;
      saveTiming = frameCount ;
      output.close();
      output = createWriter( namefile );
    }

    if( saveTiming != -1 && !Last_print.equals(str(save_test))){

      
      output.println( hour() + ":" + minute() + ":" + second() + ":" + (millis()%1000) + ";" + str(save_test) );
      Last_print = str(save_test);

    }
    if( saveTiming != -1 && saveData_bool == false ){
      output.close();
      saveTiming = -1;
    }
    
    
    
  }
  catch( StringIndexOutOfBoundsException e ){}
  catch( NullPointerException e ){}
  
  
}


/*
// from https://forum.processing.org/two/discussion/14595/simple-file-operations/#latest
void saveData( String filename , byte[] data, boolean append){
  
  Path file = Paths.get(filename);
  OutputStream output = null;
    try
    {
      if(append){
        output = new BufferedOutputStream(Files.newOutputStream(file, APPEND));
      }
      else{
        File f = new File(filename);
        f.delete();
        output = new BufferedOutputStream(Files.newOutputStream(file, CREATE));
      }
      output.write(data);
      output.flush();
      output.close();
    }
    catch(Exception e)
    {
        System.out.println("Message: " + e);
    }
  
}
*/
