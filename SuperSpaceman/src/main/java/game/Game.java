package game;
import processing.core.PApplet;
import processing.core.PImage;

public class Game extends PApplet {

    public void settings() {
        size(400, 600); // Set the size of the window
    }

    public void setup() {
        // Initialization code here
        background(0); // Set the background to black
        Gamecharacter bird = new Gamecharacter(this);
    }

    public void draw() {
        // Your drawing code here

    }

    // You can add more methods here, such as mousePressed(), keyPressed(), etc.
}
