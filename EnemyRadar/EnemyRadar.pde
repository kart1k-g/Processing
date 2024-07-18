float diameter,angle,stepTransparency,targetDiameter;
int transparency,x,y,radarLines,count,temp,rangeX,rangeY,maxX,maxY,minX,minY;
float targetX[],targetY[];
void setup(){
  size(400,400);
  frameRate(55);
  background(0);
  x=width/2;
  y=height/2;
  diameter=200;
  angle=0;
  transparency=0;
  radarLines=55;
  stepTransparency=255/radarLines;
  count=0;
  targetX=targetY=new float[4];
  targetDiameter=10;
  maxX=x+(int)diameter/2;
  minX=x-(int)diameter/2;
  rangeX=maxX-minX+1;
  maxY=y+(int)diameter/2;
  minY=y-(int)diameter/2;
  rangeY=maxY-minY+1;
}
void draw(){  
  drawScreen();
  drawRadar();
  drawEnemy();
  drawBase();
}
void drawScreen(){
  fill(0);
  rect(0,0,width,height);
  stroke(0,255,0);
  for(int i=0;i<4;i++){
    ellipse(x,y,diameter-(i*50),diameter-(i*50));
  }
  line(x,(y)-(diameter/2),x,(y)+(diameter/2));
  line((x)-(diameter/2),y,(x)+(diameter/2),y);
}

void drawEnemy(){
  if(count==60){
    for(int i=targetX.length-1;i>0;i--){
      targetX[i]=targetX[i-1];
      targetY[i]=targetY[i-1];
    }
    
    do{
      targetX[0]=random(minX,maxX);
      targetY[0]=random(minY,maxY);
    }while( dist(x,y,targetX[0],targetY[0])>=diameter/2-targetDiameter/2 );
    count=0;
  }
  fill(245,14,7);
  for(int i=targetX.length-1;i>=0;i--)
      circle(targetX[i],targetY[i],targetDiameter);
  count++;
}

void drawRadar(){
  transparency=0;
  noStroke();
  for(int i=0;i<radarLines;i++){
    fill(0,255,0,transparency);
    arc(x,y,diameter,diameter,angle+(PI/180)*i,angle+(PI/180)*(i+1),PIE);
    transparency+=stepTransparency;
  }
}

void drawBase(){
  fill(255);
  stroke(255);
  ellipse(x,y,5,5);
  angle+=PI/180;
}
