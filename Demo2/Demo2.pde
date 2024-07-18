void setup(){
  size(500,500);
  background(255);
}
void draw(){

}
int previousX=0,previousY=0,x1=0,y1=0,z1=0,x2=249,y2=156,z2=72;
void mouseMoved(){
  if(mouseX<250 && mouseY<250) x1=y1=z1=0;
  else if(mouseX>=250 && mouseY>=250){
    x1=128;
    y1=193;
    z1=130;
  }
  else if(mouseX>=250){
    x1=67;
    y1=247;
    z1=237;
  }
  else if(mouseY>=250){
    x1=255;
    y1=66;
    z1=66;
  }
     fill(x2,y2,z2);
     rect(0,0,500,500);
     fill(x1,y1,z1);
     rect(0,0,mouseX,mouseY);

  
  
  previousX=mouseX;
  previousY=mouseY;
}
