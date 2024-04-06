import processing.pdf.*;
    
void settings() {
    size(400, 600);
}

//PImage spacebackground;

boolean splashScreen = true; 
boolean hasDied = false;

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

Background currentBackground = Background.Space;

void setup() { 
  currentBackground = Background.Space;

  pipeOne = new HazardPipe();
  pipeTwo = new HazardPipe();

  tnt = new TNT(this);
  forceFeild = new ForceFeild(this);
  
  // Add - ForceFeild / TNT / nothing 
  genTNTorForceFeild();

  pipeThree = new HazardPipe();
  background(0,0,50); 

  bird = new GameCharacter(this); 
  pipeOne.generateInitalPipe();
  pipeTwo.setXPosition(width+200);
  pipeTwo.generateInitalPipe();
  
  // Generate - ForceFeild / TNT / nothing
  if(randomNum == 0){tnt.getCharacter();}
  if(randomNum == 1){
    forceFeild.getCharacter();
    }

  pipeThree.setXPosition(width+400);
  pipeThree.generateInitalPipe();
}

void draw() {

    if(splashScreen){
        splashScreenLogic();
    } else {

        if(collisonTest1 || collisonTest2 || collisonTest3 || collisonBottom || collisonTop){
            diedScreen();
        } else { 
            updateData();
        }
        checkForCollison();

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

void updateGameCharacterAndObstacles() {
   
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
        double rand = Math.random();
        if(rand < 1.0 /3.0) {
            currentBackground = Background.Mars;
        } else if (rand < 2.0 / 3.0) {
            currentBackground = Background.Moon;
        } else {
            currentBackground = Background.Saturn;
        }
        
        pipeOne.setTransportCollison(false);
    }
    
    if(pipeTwo.getTransportCollison()){
        // System.out.println("pipe 2 - transport collision"); 
        // currentBackground = (Math.random() < 0.5) ? Background.Mars : Background.Moon;
        // pipeOne.setTransportCollison(false);    
    } //Cecily add in change of background here + reset bird and pipes
    
    if(pipeThree.getTransportCollison()){ 
        // System.out.println("pipe 3 - transport collision"); 
        
        // currentBackground = (Math.random() < 0.5) ? Background.Mars : Background.Moon;
        // pipeOne.setTransportCollison(false);
        } //Cecily add in change of background here + reset bird and pipes

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
    
    System.out.println(forceFeild.getValidForceFeild((int)millis()));
    if(forceFeild.getValidForceFeild((int)millis())){ //randomNum == 1 &&
        collisonTest1 = false;
        collisonTest2 = false;
        collisonTest3 = false; 
        collisonBottom = false;
        collisonTop = false;
    }
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
    text("Click to Exit",width/2,height/1.2);
}

void genTNTorForceFeild(){
    randomNum = (int)random(0,2);
    if(randomNum == 0){
        tnt = new TNT(this);
    } else if (randomNum == 1 && !forceFeild.getValidForceFeild((int)millis())) {
        forceFeild = new ForceFeild(this); 
    }
}

void mousePressed() { 
    if(splashScreen){
        splashScreen = false;
    } else {
        bird.jump();
    }

    if(hasDied){
        currentBackground = Background.Space;
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

