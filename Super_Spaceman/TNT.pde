public class TNT extends GameCharacter {

    private int characterWidth;
    private int pipeSpeed;

    public TNT(PApplet processingMethord){
        this.game = processingMethord;
        this.xPosition = (game.width/2)+325;
        this.yPosition = (int)random(0,height); //(game.height/2);
        System.out.println("TNT: "+this.xPosition+" "+this.yPosition);
        this.characterWidth = 64; 
    }

    @Override
    public void getCharacter(){
        this.character = this.game.loadImage("assets/bomb.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
        this.xPosition -= this.pipeSpeed; //control speed
    }

    public void setPipeSpeed(int speed){
        this.pipeSpeed = speed;
    }
 
    public int getPipeSpeed(){
        return this.pipeSpeed;
    }

    public boolean collison(int x, int y){ 
        //Pipe L || R 
        if(((x < this.xPosition) || (x > this.xPosition + this.characterWidth))){
                return false;
        //Pipe UP || DOWN
        }else if((x >= this.xPosition ) && (x <= this.xPosition + this.characterWidth)){    
            if(this.yPosition + this.characterWidth > y && this.yPosition < y){
                return true;
            }
        }
        return false;
    }

}