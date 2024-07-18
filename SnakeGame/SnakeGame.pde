import processing.serial.*;
int snakeX=-25,snakeY=25,sizeX=25,sizeY=10,blocks=1,playAreaX=500,playAreaY=350;
void setup(){
   size(500,500);
   frameRate(3);
   fill(0);
   rect(350,350,150,150);
   fill(255);
   ellipse(425,385,25,25);//top
   ellipse(465,425,25,25);//right
   ellipse(425,465,25,25);//bottom
   ellipse(390,425,25,25);//left
   
}
void draw(){
   fill(255);
   rect(0,0,500,350);
   fill(108,214,236);
   rect(0,350,350,150);
   fill(0);
   rect(snakeX,snakeY,sizeX*blocks,sizeY*blocks);
   snakeX+=25;
   if(snakeX>500){
     snakeX=0;
   }
   
}
void mouseClicked(){
  delay(2000);
   if((425-13<=mouseX && mouseX<=425+13) && (385-13<=mouseY && mouseY<=410+13)){//top
     
   }
   else if((465-13<=mouseX && mouseX<=465+13) && (425-13<=mouseY && mouseY<=425+13)){//right
     
   }
   if((425-13<=mouseX && mouseX<=425+13) && (465-13<=mouseY && mouseY<=465+13)){//bottom
     
   }
   if((390-13<=mouseX && mouseX<=390+13) && (425-13<=mouseY && mouseY<=425+13)){//left
     
   }
}
  
