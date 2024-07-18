long t1,t2;
int points,Ex,Ey,Mx,My,PDiameter,EDiameter,BDiameter1,BDiameter2,BDiameter3,Bx1,By1,Bx2,By2,Bx3,By3,BRed,BGreen,BBlue,MRed,MGreen,MBlue,RRed,RGreen,RBlue,stepX1,stepY1,stepX2,stepY2,stepX3,stepY3;
boolean caught=true,out=false,isImmune;
void setup(){
  size(500,600);
 frameRate(60);    
  isImmune=true;
  points=0;
  
  stepX1=3;
  stepY1=3;
  stepX2=3;
  stepY2=3;
  stepX3=3;
  stepY3=3;
  
  BDiameter1=120;  
  BDiameter2=60;
  BDiameter3=30;
  PDiameter=50;
  EDiameter=20;
  
  
  Bx1=(int)(Math.random()*(width-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
  By1=(int)(Math.random()*(height-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
  do{
     Bx2=(int)(Math.random()*(width-(BDiameter2/2)-(BDiameter2/2)+1))+BDiameter2/2;
     By2=(int)(Math.random()*(height-(BDiameter2/2)-(BDiameter2/2)+1))+BDiameter2/2;
  }while((calcDist(Bx1,By1,Bx2,By2)<=(BDiameter1+BDiameter2)/2));
  do{
     Bx3=(int)(Math.random()*(width-(BDiameter3/2)-(BDiameter3/2)+1))+BDiameter3/2;
     By3=(int)(Math.random()*(height-(BDiameter3/2)-(BDiameter3/2)+1))+BDiameter3/2;
  }while(((calcDist(Bx1,By1,Bx3,By3)<=(BDiameter1+BDiameter3)/2)) && ((calcDist(Bx2,By2,Bx3,By3)<=(BDiameter2+BDiameter3)/2)));
    
  MRed=50;
  MGreen=236;
  MBlue=17;
  
  BRed=55;
  BGreen=55;
  BBlue=242;
  t1=System.currentTimeMillis();
}
void draw(){
  clr();   
  getPos();
  isOut(); 
  checkEnemyCaught();
  drawCatcher(false); 
  checkImmunity();
  drawBall1();
  drawBall2();
  drawBall3();  
  enemyCaught();
}

void generateRandomEnemy(){
  Ex=(int)(Math.random()*((width-20)-(20)+1))+(20);
  Ey=(int)(Math.random()*((height-20)-(20)+1))+(20);
  
  RRed=(int)(Math.random()*256);
  RGreen=(int)(Math.random()*256);
  RBlue=(int)(Math.random()*256);
  noStroke();
  fill(RRed,RGreen,RBlue);
  circle(Ex,Ey,EDiameter);
}

void drawBall1(){
  noStroke();
  fill(BRed,BGreen,BBlue);
  circle(Bx1,By1,BDiameter1);
  drawFace(Bx1,By1,BDiameter1/2);
  Bx1+=stepX1;
  By1+=stepY1;
  if((!isImmune) && calcDist(Bx1,By1,Mx,My)<(BDiameter1+PDiameter)/2-(0.1*BDiameter1)){
    selfCaught();
  }
  if(Bx1>width-BDiameter1/2 || Bx1<BDiameter1/2){
    stepX1*=-1;
    Bx1+=stepX1;
  }
  if(By1>height-BDiameter1/2 || By1<BDiameter1/2){
    stepY1*=-1;
    By1+=stepY1;
  }   
  if(calcDist(Bx1,By1,Bx2,By2)<=(BDiameter1+BDiameter2)/2){
    stepX1*=-1;
    stepY1*=-1;
    stepX2*=-1;
    stepY2*=-1;
  }
  if(calcDist(Bx1,By1,Bx3,By3)<=(BDiameter1+BDiameter3)/2){
    stepX1*=-1;
    stepY1*=-1;
    stepX3*=-1;
    stepY3*=-1;
  }
}
     
  

void drawBall2(){
  noStroke();
  fill(BRed,BGreen,BBlue);
  circle(Bx2,By2,BDiameter2);
  drawFace(Bx2,By2,BDiameter2/2);
  Bx2-=stepX2;
  By2-=stepY2;
  if((!isImmune) && calcDist(Bx2,By2,Mx,My)<(BDiameter2+PDiameter)/2-(0.1*BDiameter2)){
    selfCaught();
  }
  if(Bx2>width-BDiameter2/2 || Bx2<BDiameter2/2){
    stepX2*=-1;
    Bx2-=stepX2;
  }
  if(By2>height-BDiameter2/2 || By2<BDiameter2/2){
    stepY2*=-1;
    By2-=stepY2;
  }  
  if(calcDist(Bx1,By1,Bx2,By2)<=(BDiameter1+BDiameter2)/2){
    stepX1*=-1;
    stepY1*=-1;
    stepX2*=-1;
    stepY2*=-1;
  }
  if(calcDist(Bx3,By3,Bx2,By2)<=(BDiameter3+BDiameter2)/2){
    stepX3*=-1;
    stepY2*=-1;
    stepX2*=-1;
    stepY2*=-1;
  }
}

void drawBall3(){
  noStroke();
  fill(BRed,BGreen,BBlue);
  circle(Bx3,By3,BDiameter3);
  drawFace(Bx3,By3,BDiameter3/2);
  Bx3+=stepX3;
  By3-=stepY3;
  if((!isImmune) && calcDist(Bx3,By3,Mx,My)<(BDiameter3+PDiameter)/2-(0.1*BDiameter3)){
    selfCaught();
  }
  if(Bx3>width-BDiameter3/2 || Bx3<BDiameter3/2){
    stepX3*=-1;
    Bx3+=stepX3;
  }
if(By3>height-BDiameter3/2 || By3<BDiameter3/2){
    stepY3*=-1;
    By3-=stepY3;
  }  
  if(calcDist(Bx1,By1,Bx3,By3)<=(BDiameter1+BDiameter3)/2){
    stepX1*=-1;
    stepY1*=-1;
    stepX3*=-1;
    stepY3*=-1;
  }
  if(calcDist(Bx3,By3,Bx2,By2)<=(BDiameter3+BDiameter2)/2){
    stepX3*=-1;
    stepY3*=-1;
    stepX2*=-1;
    stepY2*=-1;
  }
}
void selfCaught(){
  MRed=253;
  MGreen=6;
  MBlue=0;
  drawCatcher(false);
  System.out.println("Enemy Caught You !! Game Over !!");
  t2=System.currentTimeMillis();
  calcPoints();
  noLoop();
}
void fenceCheck(){
  if(!isImmune && (Mx<20 || My<20 || Mx>width-20 || My>height-20)){
    MRed=253;
    MGreen=6;
    MBlue=0;
    //rect(0,0,width,height);
    //changeFaceToHappy();
    drawCatcher(false);
    System.out.println("You Touched Electric Fence !! Game Over !!");
    calcPoints();
    noLoop();
  }  
}

void drawCatcher(boolean Sad){
  noStroke();
  fill(/*15,232,249*/MRed,MGreen,MBlue);
  circle(Mx,My,PDiameter);
  if(!Sad)
     drawPieMouth(Mx,My,PDiameter/2);
  else
     drawSadMouth(Mx,My,PDiameter/2);
  drawEyes(Mx,My,PDiameter/2);
}
void drawSadMouth(int x,int y,int radius){
  stroke(0);
  fill(255);
  arc(x,y+(0.4*radius),0.8*radius,0.4*radius,0,2*PI);
}
void drawFace(int x,int y,int radius){
  drawEllipseMouth(x,y,radius);
  drawEyes(x,y,radius);
}
void drawEllipseMouth(int x,int y,int radius){
  stroke(0);
  fill(255);
  /*arc(x,y+(0.4*radius),0.8*radius,0.4*radius,0,PI);*/
  ellipse(x,y+(0.4*radius),0.8*radius,0.2*radius);//mouth
}
void drawEyes(int x,int y,int radius){
  stroke(0);
  fill(255);
  ellipse((x+0.4*radius),(y-0.4*radius),0.2*radius,0.4*radius);//outer eyes
  ellipse((x-0.4*radius),(y-0.4*radius),0.2*radius,0.4*radius);
  noStroke();
  fill(0);
  ellipse((x+0.4*radius),(y-0.4*radius),0.15*radius,0.3*radius);//inner eyes
  ellipse((x-0.4*radius),(y-0.4*radius),0.15*radius,0.3*radius);
}
void drawPieMouth(int x,int y,int radius){
  stroke(0);
  fill(255);
  arc(x,y+(0.4*radius),0.8*radius,0.4*radius,0,PI);
}
void enemyCaught(){
  if(calcDist(Ex,Ey,Mx,My)<=(EDiameter+PDiameter)/2){
     points+=50;
     System.out.println("You Caught Enemy. Points:"+points);
     caught=true;
   }
}
void checkEnemyCaught(){
  if(caught){
     generateRandomEnemy();
     caught=false;
  }
  else{
    fill(RRed,RGreen,RBlue);
    stroke(255);
    circle(Ex,Ey,EDiameter);
  }
}


void checkImmunity(){
  if(isImmune && (System.currentTimeMillis()-t1>=5000)){ 
    isImmune=false;
    MRed=254;
    MGreen=249;
    MBlue=44;
  }
}

void isOut(){
  if(out)
    fenceCheck();
  else if(mouseX>20 && mouseY>20){
    out=true;
  }
}

void changeFaceToHappy(){
  drawHappyMouth(Bx1,By1,BDiameter1/2);
  drawHappyMouth(Bx2,By2,BDiameter2/2);
  drawHappyMouth(Bx3,By3,BDiameter3/2);
}
void drawHappyMouth(int x,int y,int radius){
  stroke(0);
  fill(255);
  arc(x,y+(0.4*radius),0.8*radius,0.4*radius,0,PI);
}

void clr(){
  noStroke();
  fill(0);
  rect(0,0,width,height);
}
void getPos(){
  Mx=mouseX;
  My=mouseY;
}
double calcDist(int x1,int y1,int x2,int y2){
  return (Math.sqrt(Math.pow(x2-x1,2)+Math.pow(y2-y1,2)));     
}
void calcPoints(){
  System.out.println("Your Total Points: "+points);
  float time=(t2-t1)/1000;
  System.out.println("Total Time Taken Is"+time+"Seconds");
}
/*int B1[],B2[],B3[];
  B1[0]=120;
  B1[1]=(int)(Math.random()*(width-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
  B1[2]=(int)(Math.random()*(height-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
  B1[3]=3;
  B1[4]=3;
  
  B2[0]=120;  
  do{
     B2[1]=(int)(Math.random()*(width-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
     B2[2]=(int)(Math.random()*(height-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
  }while((calcDist(Bx1,By1,Bx2,By2)<=(BDiameter1+BDiameter2)/2));
  B2[3]=3;
  B2[4]=3;
  
  B3[0]=120;
  do{
     B3[1]=(int)(Math.random()*(width-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
     B3[2]=(int)(Math.random()*(height-(BDiameter1/2)-(BDiameter1/2)+1))+BDiameter1/2;
  }while(((calcDist(Bx1,By1,Bx3,By3)<=(BDiameter1+BDiameter3)/2)) && ((calcDist(Bx2,By2,Bx3,By3)<=(BDiameter2+BDiameter3)/2)));  
  B3[3]=3;
  B3[4]=3;*/
