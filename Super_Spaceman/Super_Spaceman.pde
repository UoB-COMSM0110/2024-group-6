import processing.pdf.*;
    

void settings() {
    size(400, 600); // Set the size of the window
}

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

void mousePressed() {
    bird.jump();
}

//    public void keyPressed(){
//
//    }

//
//    private void powerUp(){
//
//        System.out.println(key);
//    }

    // You can add more methods here, such as mousePressed(), keyPressed(), etc.
