import processing.pdf.*;
    

void settings() {
    size(400, 600); // Set the size of the window
}

GameCharacter bird;
HazardPipe pipeOne;
HazardPipe pipeTwo;
HazardPipe pipeThree;
int left = 37;
int right = 39;

void setup() { 
  pipeOne = new HazardPipe();
  pipeTwo = new HazardPipe();
  pipeThree = new HazardPipe();
  // Initialization code here
  background(100,100,80); 
  bird = new GameCharacter(this); 
  pipeOne.generateInitalPipe();
}

void draw() {
    this.background(100,100,80); //change background based on background class
    
    pipeOne.updateX();


    //remove pipe logic 
    
    //add pipe logic 


    bird.getCharacter();
    bird.gravity();
    //has Collided - implement 

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
