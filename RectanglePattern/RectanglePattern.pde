import processing.serial.*;
void setup(){
  size(700,600);
  
}

void draw(){
  float A[]={100,100};
  float B[]={600,100};
  float C[]={600,400};
  float D[]={100,400};
  drawRect(A,B,C,D);
  int Red=0,Green=0,Blue=0;
}

void drawRect(float A[], float B[], float C[], float D[],int Red,int Green,int Blue){
  if( Math.sqrt( Math.pow((B[0]-C[0]),2) + Math.pow((B[1]-C[1]),2) ) >1){
     line(A[0],A[1],B[0],B[1]);
     line(B[0],B[1],C[0],C[1]);
     line(C[0],C[1],D[0],D[1]);
     line(D[0],D[1],A[0],A[1]);
     drawRect(applySection(A,B),applySection(B,C),applySection(C,D),applySection(D,A));
  }
}

float[] applySection(float a[],float b[]){
  a[0]=(b[0]+a[0]*8)/9;
  a[1]=(b[1]+a[1]*8)/9;
  return a;
}
