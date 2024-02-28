package game;
import processing.core.PApplet;

public class Game extends PApplet {

    public void settings() {
        size(400, 600); // Set the size of the window
    }

    public void setup() {
        // Initialization code here
        background(0); // Set the background to black
    }

    public void draw() {
        Gamecharacter bird = new Gamecharacter();
        // Your drawing code here

    }

    // You can add more methods here, such as mousePressed(), keyPressed(), etc.
}
