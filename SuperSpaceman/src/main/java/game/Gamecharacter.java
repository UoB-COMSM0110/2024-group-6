package game;

import processing.core.PApplet;
import processing.core.PImage;

class Gamecharacter {

    int xPosition;
    int yPosition;

    PImage character;

    PApplet game;

    public Gamecharacter(int xPosition, int yPosition ){
        this.xPosition = xPosition;
        this.yPosition = yPosition;
    }

    public Gamecharacter(PApplet processingMethord){
        this.xPosition = 200;
        this.yPosition = 300;
        this.game = processingMethord;
        this.game.background(100,200,10);

        this.character = this.game.loadImage("SuperSpaceman/src/main/java/assets/spaceman.png");
        this.game.image(this.character,0,0);
    }

    public int getX(){ return this.xPosition;}

    public void setX(){}

    public int getY(){ return this.yPosition;}

    public void setY(){}


    //    @Override
//    public String toString() {
//        return super.toString();
//    }
}