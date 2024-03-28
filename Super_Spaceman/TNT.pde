public class TNT extends GameCharacter {

    private int characterWidth;

    public TNT(PApplet processingMethord){
        this.game = processingMethord;
        this.xPosition = (game.width/2)+325;
        this.yPosition = (int)random(0,height); //(game.height/2);
        // System.out.println(this.yPosition);
        this.characterWidth = 64; 
    }

    @Override
    public void getCharacter(){
        this.character = this.game.loadImage("assets/bomb.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
        this.xPosition -= 1;
    }

    public boolean collison(int x, int y){ 
        //Pipe L || R 
        if(((x < this.xPosition) || (x > this.xPosition + this.characterWidth))){
                return false;
        //Pipe UP || DOWN
        }else if((x >= this.xPosition ) && (x <= this.xPosition + this.characterWidth)){    
            if( y < this.yPosition + this.characterWidth && y > this.yPosition){
                return false;
            } 
        }
        return true;
    }

}