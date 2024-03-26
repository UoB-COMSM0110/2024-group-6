import processing.pdf.*;
    

void settings() {
    size(400, 600);
}

boolean splashScreen = true; 

GameCharacter bird;
HazardPipe pipeOne;
HazardPipe pipeTwo;
HazardPipe pipeThree;
boolean collisonTest1;
boolean collisonTest2;
boolean collisonTest3;

void setup() { 
  pipeOne = new HazardPipe();
  pipeTwo = new HazardPipe();
  pipeThree = new HazardPipe();
  // Initialization code here
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

    } else {

        if(collisonTest1 || collisonTest2 || collisonTest3){
            background(0);
            textSize(40);
            text("Died",(width/2)-40,height/2);
        } else {
            this.background(100,100,80); //change background based on background class
            pipeOne.updateX();
            pipeTwo.updateX();
            pipeThree.updateX();  
            bird.getCharacter();
            bird.gravity();
        }
        collisonTest1 = pipeOne.collison(bird.getX(), bird.getY());
        collisonTest2 = pipeTwo.collison(bird.getX(), bird.getY());
        collisonTest3 = pipeThree.collison(bird.getX(), bird.getY());
    
    }



}

void mousePressed() {
    if(splashScreen){
        this.splashScreen = false;
    } else {
        bird.jump();
    }
}

public void keyPressed(){
    
    if(splashScreen){
        this.splashScreen = false;
    } else {
        bird.jump();
    }

}

//
//    private void powerUp(){
//
//        System.out.println(key);
//    }

    // You can add more methods here, such as mousePressed(), keyPressed(), etc.
