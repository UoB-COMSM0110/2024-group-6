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

    boolean preKeyPressed = false;
    public void draw() {
        // Your drawing code here
        this.background(100,100,80);

        bird.getCharacter();
        jump();
        bird.setY(bird.getY()+5);
    }

    private void jump() {
        if(mouseButton == left){
            bird.setY(bird.getY()-100);
            preKeyPressed = true;
            System.out.println("click!!");
            mouseButton = 0;
        }
    }

    private void powerUp(){

        System.out.println(key);
    }

    // You can add more methods here, such as mousePressed(), keyPressed(), etc.
}
