// Based on Learning Processing Example 16-13: Simple motion detection by Daniel Shiffman

import processing.video.*;
Capture cam;
PImage prevFrame; // image for holding our previous frame
PImage mirror;
PImage bar;
PImage lase;
PImage big;
PImage dead;
PImage passed;
PImage backgr;
PImage backgr2;
int check = 0;
int killDelay = 0;
int state = 0;
int killBuff = 100;
int OPSEC = 0;
zone sp = new zone(0,0);
zone ep = new zone(615,0);
beam beamOne = new beam(-200,400);
beam beamTwo = new beam(-200,400);
beam beamThree = new beam(-200,400);
lazer laseOne = new lazer(-200,0);
lazer laseTwo = new lazer(-200,0);
wall wallOne = new wall(-300,-150);
wall wallTwo = new wall (-300,400);

float threshold = 150.0; // How different must a pixel be to be a "motion" pixel

void setup() {
  size(640, 600);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
  bar = loadImage("bar.png");
  lase = loadImage("lase.png");
  big = loadImage("big.png");
  dead = loadImage("dead.png");
  passed = loadImage("passed.png");
  backgr = loadImage("background.png");
  backgr2 = loadImage("background2.png");
  prevFrame = createImage(cam.width, cam.height, RGB); // same size as capture
  mirror = createImage(cam.width, cam.height, RGB);
}

void draw() {
  
 if(state==0){
  
  if (cam.available()) {
    // Save previous frame before reading from the camera
    prevFrame.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height); // Before we read the new frame, we always save the previous frame for comparison!
    prevFrame.updatePixels();
    cam.read();
    image(cam, 0, 0, 640, 480);
  }
  
                                        if(keyPressed){
 
                                                      OPSEC=1;
                                            
                                           }
      
      if(OPSEC==1)
      {
     killDelay++;
     beamOne.activate();
     beamOne.xpos = 70;
     beamTwo.activate();
     beamTwo.xpos = 228;
     beamThree.activate();
     beamThree.xpos = 278;
     laseOne.activate();
     laseTwo.activateB();
     wallOne.activate();
     wallOne.xpos = 436;
     wallTwo.activateB();
     wallTwo.xpos = 525;
     
     
     
    } ///state 0
     
     fill(0);
     rect(0,480,640,480);

     if(OPSEC==1)
     {

        image(backgr2,0,0);      
     }
  
  loadPixels();
  cam.loadPixels();
  prevFrame.loadPixels();

  // Go through all pixels
  for (int x = 0; x < cam.width; x ++ ) {
    for (int y = 0; y < cam.height; y ++ ) {

      int currentPixel = x + y*cam.width;
      // get colors of pixels in both frames
      color current = cam.pixels[currentPixel];      
      color previous = prevFrame.pixels[currentPixel]; 

      // compare colors
      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1, g1, b1, r2, g2, b2);

      // How different are the colors in the frames?
      if (diff > threshold) {                      

     
      if((x>laseOne.xpos && x<laseOne.xpos + laseOne.width) && (y>laseOne.ypos && y< laseOne.ypos + laseOne.height))
      {
        
        println("lazhit");
         if(killDelay>killBuff){ 
             state = 2;
        }
      }
      
       if((x>laseTwo.xpos && x<laseTwo.xpos + laseTwo.width) && (y>laseTwo.ypos && y< laseTwo.ypos + laseTwo.height))
      {
        println("lazhit");

            if(killDelay>killBuff){ 
             state = 2;
        }

      }

   if((x>beamOne.xpos && x<beamOne.xpos + beamOne.width) && (y>beamOne.ypos && y< beamOne.ypos + beamOne.height))
      {
        println("flamehit");

             if(killDelay>killBuff){ 
             state = 2;
        }

      }
      
    if((x>beamTwo.xpos && x<beamTwo.xpos + beamTwo.width) && (y>beamTwo.ypos && y< beamTwo.ypos + beamTwo.height))
      {
        println("flamehit");

          if(killDelay>killBuff){ 
             state = 2;
        }
      }
      
      
     if((x>beamThree.xpos && x<beamThree.xpos + beamThree.width) && (y>beamThree.ypos && y< beamThree.ypos + beamThree.height))
      {
        println("flamehit");
           if(killDelay>killBuff){ 
             state = 2;
        }

      }



      if((x>wallOne.xpos && x<wallOne.xpos + wallOne.width) && (y>wallOne.ypos && y< wallOne.ypos + wallOne.height))
      {
        println("wall");
           if(killDelay>killBuff){ 
             state = 2;
        }
      }


 if((x> wallTwo.xpos && x<wallTwo.xpos + wallTwo.width) && (y>wallTwo.ypos && y< wallTwo.ypos + wallTwo.height))
      {
        println("wall");
           if(killDelay>killBuff){ 
             state = 2;
        }

      }
      
      if((x>ep.xpos && x<ep.xpos + ep.width) && (y>ep.ypos && y< ep.ypos + ep.height))
      { 
       if(killDelay>killBuff && OPSEC==1){ 
             state = 3;
        } 
      }

   
       pixels[currentPixel] = color(255,0,0);
      } 

    }
  }



  updatePixels();
  
  if(OPSEC!=1)
{
 image(backgr,0,0); 
}
}



if(state==2)
{

  image(dead,0,0);
  fill(255,0,0);
     rect(width/2-106, height/2+55,185,60);
  fill(255,255,255);
  textSize(50);
     text("Replay?", width/2-105, height/2+100);
     

     if(mousePressed && mouseX>width/2-105 && mouseX<width/2+105 && mouseY>height/2+55 && mouseY<height/2+105){

      reset();
      state = 0;
     }
}


if(state==3)
{
  image(passed,0,0);
  fill(255,0,0);
     rect(width/2+100, height/2+95,185,60);
  textSize(50);
  fill(255,255,255);

 text("Replay?", width/2+100, height/2+140);

     if(mousePressed && mouseX>width/2+100 && mouseX<width/2+300 && mouseY>height/2+95 && mouseY<height/2+150){

      reset();
      state = 0;
     }
 
}


}  // draw loop


void reset(){

    println("replay");
   OPSEC = 0;
   killDelay = 0;

}

