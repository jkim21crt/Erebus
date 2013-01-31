class zone{
 int xpos;
 int ypos;
 int width = 20;
 int height = 480; 
 
 zone(int x,int y){
  xpos = x;
  ypos = y;
 
 }
 void activate(){
   noFill();
   noStroke();
   rect(xpos,ypos,width,height);  
   
 }

 
  
}
