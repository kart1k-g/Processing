int radius=50;
int Width=400,Height=400;
int coordinates[]={radius/2,Width-(radius/2),Height-(radius/2),radius/2};
boolean execute[]={true,true,true,true};
int x=radius/2,y=(Height/2)-(radius/2);
void setup(){
  size(400,400);
  background(0);
  frameRate(15);
}
void draw(){
  fill(0);
  rect(0,0,Width,Height);
  fill(255);
  ellipse(x,y,radius,radius);
  //ellipse(x+75,y+75,radius,radius);
  if(y>=coordinates[0] && execute[0]){
    x+=5;
    y-=5;
    if(y==coordinates[0]) execute[0]=false;
  }
  else if(x<=coordinates[1] && execute[1]){
    x+=5;
    y+=5;
    if(x==coordinates[1]) execute[1]=false;
  }
  else if(y<=coordinates[2] && execute[2]){
    x-=5;
    y+=5;
    if(y==coordinates[2]) execute[2]=false;
  }
  else if(x>=coordinates[3] && execute[3]){
    x-=5;
    y-=5;
    if(x==coordinates[3]) execute[3]=false;
  }
  if(x==radius/2 && y==(Height/2)-radius/2)
     for(int i=0;i<4;i++)
        execute[i]=true;
}
