class HazardPipe{

    private int pipeSizeBottom;
    private int pipeSizeTop;
    private int pipeInterval;
    private int pipeWidth; 
    private int minGapSize;
    private int xPosition;
    private int topPipeYPosition;
    private int bottomPipeYPosition;
    
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
    }


    // Maybe logic goes here for transport pipe
    public void generateInitalPipe(){

        this.topPipeYPosition = (int)random(height-minGapSize);
        this.bottomPipeYPosition = (int)random(topPipeYPosition + minGapSize,height);
        
        //random number that switch hazardPipe on or off??
        int randNum = (int)random(0,3); // 10
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

    public void updateX (){
        this.xPosition -= 1;
        if(this.xPosition == -this.pipeWidth){
            this.xPosition = width + this.pipeWidth + this.pipeInterval;
            generateInitalPipe();
        }
        
        generatePipe();
    }

    private void generatePipe(){

        if(this.hazardPipe){
            //Top Pipe
            fill(333,345,198);
            noStroke();
            rect(this.xPosition, 0, this.pipeWidth, this.topPipeYPosition);

            //bottom pipe
            fill(333,345,198);
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
                fill(333,345,198);
                noStroke();
                rect(this.xPosition, this.bottomPipeYPosition, this.pipeWidth, height);
            }

            if(!this.transportPipeTop){
                //Top Pipe
                fill(333,345,198);
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

    // two diffrent types of collisons based on hazardPipe
    // check colision with correct serface if so transportCollion = true and return false
    // implement getter methord for transportCollion
    // if transportCollion == true do the below
    // generate new background within updateData() ,
    // generate new pipes && move bird to center of screen from within updateData()
    
    public boolean collison(int x, int y){
        
        //Pipe L || R 
        // BUG !!! -- Fix at the moment mr SuperSpaceMan can hit the 
        // right or left of the pipe and not die 
        if(((x < this.xPosition) || (x > this.xPosition + this.pipeWidth))){
                return false;
        
        //Pipe UP || DOWN
        }else if(( (x <= this.xPosition + this.pipeWidth) && (x >= this.xPosition) )){
            
            if( y < this.bottomPipeYPosition && y > this.topPipeYPosition){
                return false;
            } else if(!hazardPipe){
                if(transportPipeTop && y < this.bottomPipeYPosition){
                    transportCollison = true;
                    // System.out.println("Top"+transportCollison);
                    return false;
                } else if(!transportPipeTop && y > this.topPipeYPosition){
                    transportCollison = true;
                    // System.out.println("Bottom"+transportCollison);
                    return false;
                }
            }

        }
        return true;
    }

}
