class lazer{
 int xpos;
 int ypos;
 int width = 10;
 int height = 480; 
 int a = 0;
 lazer(int x,int y){
  xpos = x;
  ypos = y;


 
 }
 
 void activate(){
      
      image(lase,xpos,ypos);
      if(a<100){
        a++;
      if(a>30)
        {
          xpos = -30;
        }
      
      if(a==100)
      {  
        xpos = 145;
         a=0;
      }    
    
  }
}



void activateB(){
      
      image(lase,xpos,ypos);
      if(a<100){
        a++;
      if(a>30)
        {
          xpos = -30;
        }
      
      if(a==100)
      {  
        xpos = 195;
         a=0;
      }    
    
  }
}







}