class HazardPipe{

    private int pipeSizeBottom;
    private int pipeSizeTop;
    private int pipeInterval;
    private int pipeWidth; 
    private int minGapSize;
    private int xPosition;
    private int topPipeYPosition;
    private int bottomPipeYPosition;
    private int pipeSpeed;
    
    private boolean hazardPipe;
    private boolean transportPipeTop;  
    private boolean transportCollison;

    public HazardPipe(){
        this.pipeInterval = 100;
        this.minGapSize = 150;
        this.pipeWidth = 50;
        this.xPosition = width;
        this.hazardPipe = true;
        this.transportPipeTop = true;
        this.pipeSpeed = 1;
    }

    public void generateInitalPipe(){

        this.topPipeYPosition = (int)random(height-minGapSize);
        this.bottomPipeYPosition = (int)random(topPipeYPosition + minGapSize,height);
        
        //random number that switch hazardPipe on or off??
        int randNum = (int)random(0,4);
        int transportPipUpOrDown = (int)random(0,2);
        if( 0 == randNum){

            this.hazardPipe = false;

            if(transportPipUpOrDown == 0){
                this.transportPipeTop = true;
            } else {
                this.transportPipeTop = false; 
            }

        } else {
            this.hazardPipe = true;
        }
        generatePipe();
    }

    public void setXPosition(int xPosition){
        this.xPosition = xPosition;
    }


    //add getter and setter methods for this.PipeSpeed 
    public void setPipeSpeed(int speed){
        this.pipeSpeed = speed;
    }
 
    public int getPipeSpeed(){
        return this.pipeSpeed;
    }

    //add logic in to increase speed post certian time intervals within superspaceman class
    public void updateX(){
        this.xPosition -= this.pipeSpeed;
        if(this.xPosition <= -this.pipeWidth){
            this.xPosition = width + this.pipeWidth + this.pipeInterval;
            generateInitalPipe();
        }
        generatePipe();
    }

    private void generatePipe(){
        
        System.out.println(this.xPosition+" "+0+" "+this.pipeWidth+" "+this.topPipeYPosition);

        if(this.hazardPipe){
            //Top Pipe
            fill(255,255,0);
            noStroke();
            rect(this.xPosition, 0, this.pipeWidth, this.topPipeYPosition);

            //bottom pipe
            fill(255,255,0);
            noStroke();
            rect(this.xPosition, this.bottomPipeYPosition, this.pipeWidth, height);

        } else {
            //diffrent type of pipe based on hazardType ??
            if(this.transportPipeTop){
                //Top Pipe
                fill(255,0,0);
                noStroke();
                rect(this.xPosition, 0, this.pipeWidth, this.topPipeYPosition);

                //bottom pipe
                fill(255,255,0);
                // fill(333,345,198);
                noStroke();
                rect(this.xPosition, this.bottomPipeYPosition, this.pipeWidth, height);
            }

            if(!this.transportPipeTop){
                //Top Pipe
                fill(255,255,0);
                // fill(333,345,198);
                noStroke();
                rect(this.xPosition, 0, this.pipeWidth, this.topPipeYPosition);

                //bottom pipe
                fill(255,0,0);
                noStroke();
                rect(this.xPosition, this.bottomPipeYPosition, this.pipeWidth, height);
            }
        }
    }

    public void setPipeSizeBottom(int pipeSizeBottom){
        this.pipeSizeBottom = pipeSizeBottom;
    }

    public int getPipeSizeBottom(){
        return this.pipeSizeBottom;
    }

    public void setPipeSizeTop(int pipeSizeTop){
        this.pipeSizeTop = pipeSizeTop;
    }

    public int getPipeSizeTop(){
        return this.pipeSizeTop;
    }

    public void setPipeInterval(int intaval){
        this.pipeInterval = intaval;
    }

    public int getPipeInterval(){
        return this.pipeInterval;
    }

    public boolean getTransportCollison(){
        return transportCollison;
    }

    public void setTransportCollison(boolean newValue){
        transportCollison = newValue;
    }
    
    public boolean collison(int x, int y){
        
        //Pipe L || R 
        boolean leftOfPipe = (x < this.xPosition);
        boolean rightOfPipe = (x > this.xPosition + this.pipeWidth);
        if( leftOfPipe || rightOfPipe ){
            return false;
        
        //Pipe UP || DOWN
        }else if(((x <= this.xPosition + this.pipeWidth) && (x >= this.xPosition) )){
            
            if( y < this.bottomPipeYPosition && y > this.topPipeYPosition){
                return false;
            } else if(!hazardPipe){

                if( x == this.xPosition && y < this.topPipeYPosition && transportPipeTop){
                    return true;
                }

                if( x == this.xPosition && y > this.bottomPipeYPosition && !transportPipeTop){
                    return true;
                }

                if(transportPipeTop && y < this.topPipeYPosition ){ //this.bottomPipeYPosition
                    transportCollison = true;
                    // System.out.println("Top"+transportCollison + this.topPipeYPosition);
                    return false;
                
                } else if(!transportPipeTop && y > this.bottomPipeYPosition ){
                    transportCollison = true;
                    // System.out.println("Bottom"+transportCollison + this.bottomPipeYPosition);
                    return false;
                }
            }

        }
        return true;
    }

}


