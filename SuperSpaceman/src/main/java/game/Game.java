package game;
import processing.core.PApplet;

public class Game extends PApplet {

    Gamecharacter bird;
    int left = 37;
    int right = 39;

    public void settings() {
        size(400, 600); // Set the size of the window
    }

    public void setup() {
        // Initialization code here
        this.background(100,100,80); // Set the background to black
        bird = new Gamecharacter(this);
    }

    public void draw() {
        // Your drawing code here
        this.background(100,100,80);
        bird.getCharacter();
        bird.gravity();
    }

    public void mousePressed() {
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
}
