float radius,angle;
int x,y;
void setup(){
  size(400,400);
  background(0);
  x=width/2;
  y=height/2;
  radius=200;
  angle=0;
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
  fill(color(0,255,0));
  stroke(0,255,0);
  arc(x,y,radius,radius,angle+(PI/180)*38,angle+(PI/180)*40,PIE);  
  fill(color(0,255,0),150);
  arc(x,y,radius,radius,angle,angle+(PI/180)*38,PIE);
}
void drawBase(){
  fill(255);
  stroke(255);
  ellipse(x,y,5,5);
  angle+=PI/180;
}
