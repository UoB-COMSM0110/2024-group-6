package game;
import processing.core.PApplet;
import processing.core.PImage;

import java.awt.event.MouseEvent;

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
        System.out.println(keyCode);

        userInputs();

    }

    public void userInputs() {

        if(mouseButton == left){
            bird.setY(bird.getY()-100);
            this.background(100,100,80);
            bird.getCharacter();
            mouseButton = 0;
        }
    }
    // You can add more methods here, such as mousePressed(), keyPressed(), etc.
}
