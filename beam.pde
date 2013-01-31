class beam{
 int xpos;
 int ypos;
 int c = 0;
 int width = 20;
 int height = 100; 
 beam(int x,int y){
  xpos = x;
  ypos = y;
 
 }
 
 void activate(){
      
      image(bar,xpos,ypos);
      if(c<=19){
        c++;
      if(c>=0 && c<=10)
      { ypos++;
      }
      
      if(c>=11)
      {
       ypos--; 
      }
      
      if(c==20)
      {
       c=0; 
      }
      }
     
      
 }//activate
 
  
  
}
