
int x,y,stepX,stepY,diameter,crossFireRadius,deltaRadius;
void setup(){
  size(600,500);
  frameRate(60);
  noCursor();
  x=width/2;
  y=height/2;
  stepX=3;
  stepY=3;
  diameter=100;
  crossFireRadius=75;
  deltaRadius=5;
}

void draw(){
  drawBall();
  drawCrossFire();
}

void drawBall(){
  fill(0);
  rect(0,0,width,height);
  noStroke();
  fill(255);
  circle(x,y,diameter);
  x+=stepX;
  y+=stepY;
  if(x>width-diameter/2 || x<diameter/2){
    stepX*=-1;
    x+=stepX;
  }
  if(y>height-diameter/2 || y<diameter/2){
    stepY*=-1;
    y+=stepY;
  }
  
}
void drawCrossFire(){
  stroke(103,221,241);
  line(mouseX-crossFireRadius,mouseY,mouseX-deltaRadius,mouseY);
  line(mouseX+crossFireRadius,mouseY,mouseX+deltaRadius,mouseY);
  line(mouseX,mouseY-crossFireRadius,mouseX,mouseY-deltaRadius);
  line(mouseX,mouseY+crossFireRadius,mouseX,mouseY+deltaRadius);
}

void mouseClicked(){
  if(dist(mouseX,mouseY,x,y)<diameter/2){
    println("Hit");
  }else
  {
    println("Missed");
  }
  noLoop();
}
