int x,y,diameter,stepX,stepY,barLength,barWidth;
void setup(){
  size(550,600);
  frameRate(60);
  background(0);
  x=width/2;
  y=height/2;
  diameter=30;
  stepX=stepY=3;
}
void draw(){
  drawBall();
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
