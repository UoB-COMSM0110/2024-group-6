public class ForceFeild extends GameCharacter {

    private int characterWidth;
    private int collisonStartTime;
    private int collisonEndTime;
    private int pipeSpeed;

    public ForceFeild(PApplet processingMethord){
        this.game = processingMethord;
        this.xPosition = (game.width/2)+325;
        this.yPosition = (int)random(0,height); //(game.height/2);
        System.out.println("ForceFiled: "+this.xPosition+" "+this.yPosition);
        this.characterWidth = 64; 
    }

    @Override
    public void getCharacter(){
            // System.out.println("getCharacter()");
        this.character = this.game.loadImage("assets/shield-Small.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
        this.xPosition -= this.pipeSpeed; // control speed
    }

    public void setPipeSpeed(int speed){
        this.pipeSpeed = speed;
    }
 
    public int getPipeSpeed(){
        return this.pipeSpeed;
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