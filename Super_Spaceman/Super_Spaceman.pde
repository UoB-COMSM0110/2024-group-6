import processing.pdf.*;
    
void settings() {
    size(400, 600);
}

boolean splashScreen = true; 
boolean hasDied = false;
boolean forbidSpacebar = false; // add a flag to forbid spacebar.
PImage instruction;
int rightNum = 0; //control instruction screen.

TNT tnt;
ForceFeild forceFeild;
int forceFeildOrTNTCounter;
int randomNum;

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
int speedUpPipesCnt;
int increaseSpeedIntival;

Background currentBackground = Background.Space;

void setup() { 

  pipeOne = new HazardPipe();
  pipeTwo = new HazardPipe();

  tnt = new TNT(this);
  forceFeild = new ForceFeild(this);
  
  //Add - ForceFeild / TNT / nothing 
  genTNTorForceFeild();

  pipeThree = new HazardPipe();
  
  pipeOne.setPipeSpeed(1);
  pipeTwo.setPipeSpeed(1);
  pipeThree.setPipeSpeed(1);
  
  background(0,0,50); 

  bird = new GameCharacter(this); 
  pipeOne.generateInitalPipe();
  pipeTwo.setXPosition(width+200);
  pipeTwo.generateInitalPipe();
  
  //Generate - ForceFeild / TNT / nothing
  if(randomNum == 0){tnt.getCharacter();}
  if(randomNum == 1){
    forceFeild.getCharacter();
    }

  pipeThree.setXPosition(width+400);
  pipeThree.generateInitalPipe();

  increaseSpeedIntival = 1000;
  speedUpPipesCnt=0;
}

void draw() {
    
    if(rightNum != 1){
        background(0); //for cleaning canvas
        if(splashScreen){
            splashScreenLogic();
        } else {

            if(collisonTest1 || collisonTest2 || collisonTest3 || collisonBottom || collisonTop){
                diedScreen();
                forbidSpacebar = true; //add a flag to forbid spacebar.
                rightNum = 0;
            } else { 
                updateData();
            }
            checkForCollison();

        }
    } else if(rightNum == 1){ // only once
        background(0); // for cleaning canvas
        instructionScreen();
    }
}

void updateData(){

    currentBackground.drawBackground(this);

    forceFeildOrTNTCounter++;
    if(forceFeildOrTNTCounter == width){
        genTNTorForceFeild();
        forceFeildOrTNTCounter = 0;
    }      

    updateGameCharacterAndObstacles();
}

void updateGameCharacterAndObstacles(){
  
    pipeOne.updateX();
    pipeTwo.updateX();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    if(randomNum == 0){
        tnt.getCharacter();
    }
    if(randomNum == 1 ){
        forceFeild.getCharacter();
    }
    
    pipeThree.updateX();  
    bird.getCharacter();
    bird.gravity();

    speedUpPipesCnt++;
    if(speedUpPipesCnt%increaseSpeedIntival == 0 ){
        int speed = pipeOne.getPipeSpeed()+1;
        System.out.println("gamesSpeed: "+ speed);
        pipeOne.setPipeSpeed(speed);
        pipeTwo.setPipeSpeed(speed);
        pipeThree.setPipeSpeed(speed);
        tnt.setTNTSpeed(speed);
        forceFeild.setForceFeildSpeed(speed);
    }  

    checkForceFieldCollisions();

}    

void checkForceFieldCollisions(){    
    if(randomNum == 1){
        forceFeild.collison(bird.getX(), bird.getY());
    }
    if(forceFeild.getValidForceFeild((int)millis())){
        forceFeild.validForceFeild(bird.getX(), bird.getY());
    } 
}

void checkForCollison(){
    collisonTest1 = pipeOne.collison(bird.getX(), bird.getY());
    collisonTest2 = pipeTwo.collison(bird.getX(), bird.getY());
    collisonTest3 = pipeThree.collison(bird.getX(), bird.getY());

    if(pipeOne.getTransportCollison()) {
        changeBackground();
        pipeOne.setTransportCollison(false);
    }
    
    if(pipeTwo.getTransportCollison()) {
        changeBackground();
        pipeTwo.setTransportCollison(false);    
    } 
    
    if(pipeThree.getTransportCollison()) { 
        changeBackground();
        pipeThree.setTransportCollison(false); 
    } 

    // Check for collison with TNT or ForceFeild 
    if (randomNum == 0){
        collisonTest2 = tnt.collison(bird.getX(), bird.getY());
    }
    
    if(bird.getY() > height){ collisonBottom = true;} else { collisonBottom = false;}
    if(bird.getY() <= 0 ){ collisonTop = true;} else { collisonTop = false;}

    //tnt or forcefeild  
    if(randomNum == 1 ){
        forceFeild.collison(bird.getX(), bird.getY());
    }       
    
    if(forceFeild.getValidForceFeild((int)millis())){ //randomNum == 1 &&
        collisonTest1 = false;
        collisonTest2 = false;
        collisonTest3 = false; 
        collisonBottom = false;
        collisonTop = false;
    }
}


void changeBackground() {
    double rand = Math.random();
    if (rand < 1.0 / 3.0) {
        currentBackground = Background.Mars;
    } else if (rand < 2.0 / 3.0) {
        currentBackground = Background.Moon;
    } else {
        currentBackground = Background.Saturn;
    }
 
   setup();
}

void instructionScreen(){
    textSize(30);
    text("click RightKey to quit",width/2,height-30);
    instruction = loadImage("assets/instruction1.png");
    image(instruction,width/2,height/2);
}

void splashScreenLogic(){
    fill(333,345,198);
    background(0);
    textSize(40);
    textAlign(CENTER, BASELINE);
    text("SuperSpaceMan",(width/2),height/4);

    bird.getCharacter();

    textSize(30);
    text("press Spacebar to Start",width/2,height/1.2);
    textSize(20);
    text("click RightKey to check Instruction",width/2,height/1.1);
    startTime = millis();
}

void diedScreen(){
    fill(333,345,198);
    if(!hasDied){endTime = millis();} 
    hasDied = true; 
    background(0);
    textSize(40);
    text("Died",(width/2),height/2);

    textSize(20);
    int duration = (endTime - startTime) / 1000;
    text("Game Duration: "+duration,width/2,height/1.4);

    textSize(30);
    text("Click LeftKey to Exit",width/2,height/1.2);
}

void genTNTorForceFeild(){
    randomNum = (int)random(0,2);
    System.out.println(randomNum);
    if(randomNum == 0){
        tnt = new TNT(this);
        tnt.setTNTSpeed(pipeOne.getPipeSpeed());
    } else if (randomNum == 1 && !forceFeild.getValidForceFeild((int)millis())) {
        forceFeild = new ForceFeild(this); 
        forceFeild.setForceFeildSpeed(pipeOne.getPipeSpeed());
    }
}

void mousePressed() { 
    if(mouseButton == RIGHT){
        rightNum++; //switch screen to instruction
    }
    if(mouseButton == LEFT){
        if(splashScreen){
            splashScreen = false;
        } else {
            bird.jump();
        }

        if(hasDied){
            currentBackground = Background.Space;
            splashScreen = true;
            hasDied = false;
            forbidSpacebar = false;//reset the flag for next game.
            collisonTest1 = false;
            collisonTest2 = false;
            collisonTest3 = false;
            collisonBottom = false;
            collisonTop = false;
            setup();
        }
    }
}

public void keyPressed(){  
    if(splashScreen){
        splashScreen = false;
    } else if(!forbidSpacebar){//change to forbid spacebar.
        bird.jump();
    }
}

