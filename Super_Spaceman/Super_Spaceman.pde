import processing.pdf.*;
    

void settings() {
    size(400, 600);
}

boolean splashScreen = true; 
boolean hasDied = false;

GameCharacter bird;
HazardPipe pipeOne;
HazardPipe pipeTwo;
HazardPipe pipeThree;
boolean collisonTest1;
boolean collisonTest2;
boolean collisonTest3;
boolean collisonTop;
boolean collisonBottom;

int startTime;
int endTime;

void setup() { 
  pipeOne = new HazardPipe();
  pipeTwo = new HazardPipe();
  pipeThree = new HazardPipe();
  background(100,100,80); 
  bird = new GameCharacter(this); 
  pipeOne.generateInitalPipe();
  pipeTwo.setXPosition(width+200);
  pipeTwo.generateInitalPipe();
  pipeThree.setXPosition(width+400);
  pipeThree.generateInitalPipe();
}

void draw() {

    if(splashScreen){

        background(0);
        textSize(40);
        textAlign(CENTER, BASELINE);
        text("SuperSpaceMan",(width/2),height/4);

        bird.getCharacter();

        textSize(30);
        text("press Spacebar to Start",width/2,height/1.2);
        startTime = millis();

    } else {

        if(collisonTest1 || collisonTest2 || collisonTest3 || collisonBottom || collisonTop){
            if(!hasDied){endTime = millis();} 
            hasDied = true; 
            background(0);
            textSize(40);
            text("Died",(width/2),height/2);

            textSize(20);
            int duration = (endTime - startTime) / 1000;
            text("Game Duration: "+duration,width/2,height/1.4);

            textSize(30);
            text("Click to Exit",width/2,height/1.2);
        } else {
            background(100,100,80); 
            pipeOne.updateX();
            pipeTwo.updateX();
            pipeThree.updateX();  
            bird.getCharacter();
            bird.gravity();
        }
        collisonTest1 = pipeOne.collison(bird.getX(), bird.getY());
        collisonTest2 = pipeTwo.collison(bird.getX(), bird.getY());
        collisonTest3 = pipeThree.collison(bird.getX(), bird.getY());
        if(bird.getY() > height){ collisonBottom = true;} else { collisonBottom = false;}
        if(bird.getY() <= 0 ){ collisonTop = true;} else { collisonTop = false;}
    }

}

void mousePressed() { 
    if(splashScreen){
        splashScreen = false;
    } else {
        bird.jump();
    }

    if(hasDied){
        splashScreen = true;
        hasDied = false;
        collisonTest1 = false;
        collisonTest2 = false;
        collisonTest3 = false;
        collisonBottom = false;
        collisonTop = false;
        setup();
    }

}

public void keyPressed(){
    
    if(splashScreen){
        splashScreen = false;
    } else {
        bird.jump();
    }

}



