Particle bacteria[];
int score = 0;
void setup(){
  size(500, 500);
  
  bacteria = new Particle[100];
  for (int i = 0; i < bacteria.length; i++){
    bacteria[i] = new Particle();
  }
}
void draw(){
  background(0);
  fill(#FFFF00);
  arc(mouseX, mouseY, 40, 40, PI+QUARTER_PI-0.25, TWO_PI);
  arc(mouseX, mouseY, 40, 40, 0, HALF_PI+QUARTER_PI+0.25);
  for (int i = 0; i < bacteria.length; i++){
    bacteria[i].walk();
    bacteria[i].show();
    
  }
  fill(#505AFF);
  textAlign(CENTER);
  textSize(30);
    text("SCORE: " + score + "/100", 250, 470);

  
  
  textSize(15);
  text("spacebar to reset", 250, 490); 
}
void keyPressed(){
  if (key == ' '){
    score = 0;
    for (int i = 0; i < bacteria.length; i++){
      bacteria[i].myX = (float)(Math.random()*480)+10;
      bacteria[i].myY = (float)(Math.random()*480)+10;
    }
  }
}


class Particle {
  int color1, color2;
  float myX, myY;
  Particle(){
    color1 = (int)(Math.random()*60)-30;
    color2 = (int)(Math.random()*60)-30;
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  void walk(){
      myX += (int)((myX-mouseX)/300);
      myY += (int)((myY-mouseY)/300);
      myX += (int)(Math.random()*5)-2;
      myY += (int)(Math.random()*5)-2;
      if (myX > mouseX-20 && myX < mouseX+20){
        if (myY > mouseY-20 && myY < mouseY+20){
          score += 1;
          myX = 1000;
          myY = 1000;
        }
      }
      if ((myX > 500 && myX < 550) || (myX < 0 && myX > -50)){
        if ((myY > 500 && myY < 550) || (myY < 0 && myY > -50)){
          myX = 1000;
          myY = 1000;
        }
      }
      
      
    
  }
  void show(){
    fill(#FFFACE);
    noStroke();
    rect(myX, myY, 4, 4);
  }
}
