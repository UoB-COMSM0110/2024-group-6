package game;

import processing.core.PApplet;

class Gamecharacter {

    int xPosition;
    int yPosition;

    public Gamecharacter(int xPosition, int yPosition ){
        this.xPosition = xPosition;
        this.yPosition = yPosition;
    }

    public Gamecharacter(PApplet game){
        this.xPosition = 200;
        this.yPosition = 300;
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