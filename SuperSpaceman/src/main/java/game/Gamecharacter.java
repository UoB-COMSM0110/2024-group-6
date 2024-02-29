package game;

import processing.core.PApplet;
import processing.core.PImage;

class Gamecharacter {

    private int xPosition;
    private int yPosition;

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
        this.character = this.game.loadImage("SuperSpaceman/src/main/java/assets/spaceman1.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
//        this.game.
    }

    public int getX(){
        return this.xPosition;
    }

    public void setX(int x){
        this.xPosition = x;
    }

    public int getY(){
        return this.yPosition;
    }

    public void setY(int y){
        this.yPosition = y;
    }

    public void getCharacter(){
        this.character = this.game.loadImage("SuperSpaceman/src/main/java/assets/spaceman1.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
    }


    //    @Override
//    public String toString() {
//        return super.toString();
//    }
}