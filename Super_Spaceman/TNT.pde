public class TNT extends HazardPipe, GameCharacter {

    public void getCharacter(){
        this.character = this.game.loadImage("assets/bomb.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
    }



}