public class ForceFeild extends GameCharacter {

    private int characterWidth;
    private int collisonStartTime;
    private int collisonEndTime;
    private int forceFeildSpeed;

    public ForceFeild(PApplet processingMethord){
        this.game = processingMethord;
        this.xPosition = (game.width/2)+325;
        this.yPosition = (int)random(0,height); //(game.height/2);
        this.characterWidth = 64;
        this.forceFeildSpeed = 1; 
    }

    @Override
    public void getCharacter(){
        this.character = this.game.loadImage("assets/shield-Small.png");
        this.xPosition -= this.forceFeildSpeed; // control speed this.pipeSpeed
        this.game.image(this.character,this.xPosition,this.yPosition);
    }

    public void setForceFeildSpeed(int speed){
        this.forceFeildSpeed = speed;
    }
 
    public int getForceFeildSpeed(){
        return this.forceFeildSpeed;
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
            
            if(this.yPosition + this.characterWidth > y && this.yPosition < y){
                collisonStartTime = millis();
                collisonEndTime = collisonStartTime + 2010;  
                return true;
            }
        }
        return false;
    }

    public boolean getValidForceFeild(int time){
        if(collisonEndTime >= time){
            return true;
        }
        return false;
    }

}