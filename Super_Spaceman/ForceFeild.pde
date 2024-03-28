public class ForceFeild extends HazardPipe, GameCharacter {

    @Override
    public void getCharacter(){
        this.character = this.game.loadImage("assets/shield-Small.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
    }



}