class wall{
 int xpos;
 int ypos;
 int d=0;
 int e = 0;
 int width = 75;
 int height = 300; 
 wall(int x,int y){
  xpos = x;
  ypos = y;
 
 }
 
 void activate(){
      image(big,xpos,ypos);
      if(d<=199){
        d++;
      if(d>=0 && d<=100)
      { ypos++;
      }
      
      if(d>=101)
      {
       ypos--; 
      }
      
      if(d==200)
      {
       d=0; 
      }
      }
 }

 void activateB(){
    image(big,xpos,ypos);
       
      if(e<=199){
        e++;
      if(e>=0 && e<=100)
      { ypos--;
      }
      
      if(e>=101)
      {
       ypos++; 
      }
      
      if(e==200)
      {
       e=0; 
      }
      }

 }

void reset()
{
  xpos = 400;
}
 
  
  
}
