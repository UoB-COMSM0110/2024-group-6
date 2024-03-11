import processing.pdf.*;
    
GameCharacter bird;
  int left = 37;
  int right = 39;


void setup() { 

  size(400, 600); // Set the size of the window  
  // Initialization code here
  background(100,100,80); // Set the background to black
  bird = new GameCharacter(this);
}

    void draw() {
        // Your drawing code here
        this.background(100,100,80);
        //bird.getCharacter();
        //bird.gravity();
    }

    void mousePressed() {
        //bird.jump();
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
