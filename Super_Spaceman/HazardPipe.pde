class HazardPipe{

    private int pipeSizeBottom;
    private int pipeSizeTop;
    private int pipeInterval;
    private int pipeWidth; 
    private int minGapSize;
    private int xPosition;
    private int topPipeYPosition;
    private int bottomPipeYPosition;

    public HazardPipe(){
        this.pipeInterval = 100;
        this.minGapSize = 150;
        this.pipeWidth = 50;
        this.xPosition = width;
    }

    public void generateInitalPipe(){
        this.topPipeYPosition = (int)random(height-minGapSize);
        this.bottomPipeYPosition = (int)random(topPipeYPosition + minGapSize,height);
        generatePipe();
    }


    public void setXPosition(int xPosition){
        this.xPosition = xPosition;
    }

    public void updateX (){
        this.xPosition -= 1;
        if(this.xPosition == -this.pipeWidth){
            this.xPosition = width + this.pipeWidth + this.pipeInterval;
        }
        generatePipe();
    }

    private void generatePipe(){

        //Top Pipe
        fill(333,345,198);
        noStroke();
        rect(this.xPosition, 0, this.pipeWidth, this.topPipeYPosition);

        //bottom pipe
        fill(333,345,198);
        noStroke();
        rect(this.xPosition, this.bottomPipeYPosition, this.pipeWidth, height);
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

    public boolean collison(int x, int y){
        //top pipe 
        if(((x < this.xPosition) || (x > this.xPosition + this.pipeWidth))){
                return false;
        }else if(((x >= this.xPosition) && (x <= this.xPosition + this.pipeWidth))){
            if( y < this.bottomPipeYPosition && y > this.topPipeYPosition){
                return false;
            }
        }
        return true;
    }

}
