Particle bacteria[];
boolean attract = true;
void setup(){
  size(500, 500);
  
  bacteria = new Particle[100];
  for (int i = 0; i < bacteria.length; i++){
    bacteria[i] = new Particle();
  }
}
void draw(){
  background(200);
  for (int i = 300; i > 0; i--){
    fill(130+(i/3), 130+(i/3), 255);
    noStroke();
    ellipse(mouseX, mouseY, 5*i, 5*i);
  }
  for (int i = 0; i < bacteria.length; i++){
    bacteria[i].walk();
    bacteria[i].show();
    
  }
  fill(0);
  textAlign(CENTER);
  textSize(30);
  if (attract == true){
    text("attract", 250, 470);
  }else{
    text("repel", 250, 470);
  }
  
  
  textSize(15);
  text("spacebar to change, click to reset", 250, 490); 
}
void keyPressed(){
  if (key == ' '){
    if (attract == true){
      attract = false;
    }else{
      attract = true;
    }
  }
}
void mousePressed(){
  for (int i = 0; i < bacteria.length; i++){
    bacteria[i].myX = (float)(Math.random()*500);
    bacteria[i].myY = (float)(Math.random()*500);
  }
}



class Particle {
  int color1, color2;
  float myX, myY;
  Particle(){
    color1 = (int)(Math.random()*60)-30;
    color2 = (int)(Math.random()*60)-30;
    myX = (float)(Math.random()*500);
    myY = (float)(Math.random()*500);
  }
  void walk(){
    //if (Math.abs(mouseX - myX) > Math.abs(mouseY - myY)){
    //  if (myX > mouseX){
    //    myX += (myX-mouseX)/5;
    //  }
      
    //  if (myX < mouseX){
    //    myX = myX + (int)(Math.random()*10)-3;
    //  }
    //}else{
    //  if (myY > mouseY){
    //    myY = myY + (int)(Math.random()*10)-7;
    //  }
    
    //  if (myY < mouseY){
    //    myY = myY + (int)(Math.random()*10)-3;
    //  }
    //}
    //if (Math.abs(myX-mouseX) <= 100){
    //  myX -= 1;
    //}else{
    //}
    //if (Math.abs(myY-mouseY) <= 100){
    //  myY -= 1;
    //}else{
    //}
    
    if (attract == true){
      myX -= (myX-mouseX)/500;
      myY -= (myY-mouseY)/500;
    }else{
      myX += (myX-mouseX)/500;
      myY += (myY-mouseY)/500;
    }
    myX += (int)(Math.random()*5)-2;
    myY += (int)(Math.random()*5)-2;
    
    
    
  }
  void show(){
    fill(150 + color1, 25, 150 + color2);
    ellipse(myX, myY, 10, 10);
  }
}
