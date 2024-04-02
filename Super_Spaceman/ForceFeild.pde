public class ForceFeild extends GameCharacter {

    private int characterWidth;
    private int collisonStartTime;
    private int collisonEndTime;

    public ForceFeild(PApplet processingMethord){
        this.game = processingMethord;
        this.xPosition = (game.width/2)+325;
        this.yPosition = (int)random(0,height); //(game.height/2);
        this.characterWidth = 64; 
    }

    @Override
    public void getCharacter(){
        this.character = this.game.loadImage("assets/shield-Small.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
        this.xPosition -= 1;
    }

    public void validForceFeild(int birdX, int birdY){
        this.character = this.game.loadImage("assets/shield-Small.png");
        this.game.image(this.character, birdX, birdY);
    }

    public boolean collison(int x, int y ){ 
        //Pipe L || R 
        if(((x < this.xPosition) || (x > this.xPosition + this.characterWidth))){
                return false;
        //Pipe UP || DOWN
        } else if((x >= this.xPosition ) && (x <= this.xPosition + this.characterWidth)){  
            if(y == this.yPosition){
                    System.out.println("picked up");
                    collisonStartTime = millis();
                    collisonEndTime = collisonStartTime + 110; 
                    return true;
            }
        }
        return false;
    }

    public boolean getValidForceFeild(int time){
        if(collisonEndTime >= time){
            System.out.println("TRUE");
            return true;
        }
        return false;
    }

}