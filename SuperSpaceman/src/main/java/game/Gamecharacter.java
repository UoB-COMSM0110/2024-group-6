package game;

import processing.core.PApplet;

class Gamecharacter {

    int xPosition;
    int yPosition;

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
        this.game.loadImage("./assets/spaceman.png");
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