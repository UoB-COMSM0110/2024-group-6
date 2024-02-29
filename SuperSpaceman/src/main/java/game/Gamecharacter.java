package game;

import processing.core.PApplet;
import processing.core.PImage;

class Gamecharacter {

    private int xPosition;
    private int yPosition;

    PImage character;

    PApplet game;

    public Gamecharacter(PApplet processingMethord){
        this.game = processingMethord;
        this.xPosition = 80;
//        System.out.println(game.width/2);
        this.yPosition = 0;
//        System.out.println(game.height/2);
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