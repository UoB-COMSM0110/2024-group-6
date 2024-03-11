import processing.pdf.*;
    
GameCharacter bird;
HazardPipe pipeOne = new HazardPipe();
HazardPipe pipeTwo = new HazardPipe();
HazardPipe pipeThree = new HazardPipe();
int left = 37;
int right = 39;

void setup() { 

  size(400, 600); // Set the size of the window  
  // Initialization code here
  background(100,100,80); // Set the background to black
  bird = new GameCharacter(this); //
  // pipeOne.generatePipe();
}

void draw() {
    // this.background(100,100,80); //change background based on background class
    
    pipeOne.generatePipe();


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
