float radius,angle,stepTransparency;
int transparency,x,y,radarLines;
void setup(){
  size(400,400);
  frameRate(55);
  background(0);
  x=width/2;
  y=height/2;
  radius=200;
  angle=0;
  transparency=0;
  radarLines=60;
  stepTransparency=255/radarLines;
}
void draw(){  
  drawScreen();
  drawRadar();
  drawBase();
}
void drawScreen(){
  fill(0);
  stroke(0,255,0);
  for(int i=0;i<4;i++){
    ellipse(x,y,radius-(i*50),radius-(i*50));
  }
  line(x,(y)-(radius/2),x,(y)+(radius/2));
  line((x)-(radius/2),y,(x)+(radius/2),y);
}

void drawRadar(){
  transparency=0;
  noStroke();
  for(int i=0;i<radarLines;i++){
    fill(0,255,0,transparency);
    arc(x,y,radius,radius,angle+(PI/180)*i,angle+(PI/180)*(i+1),PIE);
    transparency+=stepTransparency;
  }
}
void drawBase(){
  fill(255);
  stroke(255);
  ellipse(x,y,5,5);
  angle+=PI/180;
}
