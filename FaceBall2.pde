
import oscP5.*;
OscP5 oscP5;


int found;
PVector poseOrientation;
float ballX = 640;
float ballVX = 0;
float ballY = 360;
float ballVY = 0;

float ballM =1;

void setup(){
  size(1000,720);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  poseOrientation = new PVector();
}

void draw(){
  background(255);
  if (found > 0) {
    ballVX -= poseOrientation.y/ballM;
    ballX += ballVX;
    
    ballVY += poseOrientation.x/ballM;
    ballY += ballVY;
//    noStroke();
//    lights();
//    translate(ballX, 360, 0);
//    sphere(25);
//    println(ballX);
    if (ballX>1000){
      ballX=1000;
      ballVX=-.7*ballVX;
    }
    if (ballX<0){
      ballX=0;
      ballVX=-.7*ballVX;
    }
    
    if (ballY>720){
      ballY=720;
      ballVY=-.7*ballVY;
    }
    if (ballY<0){
      ballY=0;
      ballVY=-.7*ballVY;
    }
  }  
    ellipseMode(CENTER);
    noStroke();
    fill(256,0,0);
    ellipse(int(ballX),int(ballY),50, 50);
    
  
}

public void found(int i) {
  found = i;
}

public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
}
    
    
