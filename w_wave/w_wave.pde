 
// Global variables
float freq = 10;
float amp = 50;
 
float rotx = -0.25;
float roty = 0.5;
float zoom = 0;
 
int widthCount = 25;
int heightCount = 16;
int depthCount = 20;
float widthOffset = (widthCount*10)/2;
 
 
void setup() {
  size(1000,1000, P3D);
  background(0);
  rectMode(CENTER);
  noFill();

}
 
 
void mouseMoved() {
  rotx = -(mouseY-height/2)/160.0;
  roty = (mouseX-width/2)/220.0;
}
 
 
void mouseDragged() {
  if(mouseButton == LEFT || mouseButton == CENTER) {
    zoom = mouseX-width/2;
  } else if (mouseButton == RIGHT) {
    freq = 10 * (1.0-mouseX/(float)width+1);
    amp = 50 * (1.0-mouseY/(float)height+1);
  }
}
 
 
void draw() {
  background(0);
   
  pushMatrix();
  translate(width/2, height/2, zoom);
  rotateX(rotx);
  rotateY(roty);
   
  for (int z = 0; z < depthCount; z++) {
    translate(0, 0, z*0.5);
     
    for (int x = 0; x < widthCount; x++) {
      stroke(random(255), 200, 100, 200);
       
      // Middle orange
    ellipse(widthOffset-x*10, sin((frameCount+x*4)/freq)*(amp*1),10,10);
       
      for (int y = 1; y < heightCount/2; y++) {
        float rectSize = 5-y*0.5;
        stroke(255, 150-(y*30), 0, 80-(y*10));
         

         
        stroke(0, 25, 200-(y*20), 20-(y*3));

      }
    }
  }
   
  popMatrix();
   
  stroke(255);
  
}