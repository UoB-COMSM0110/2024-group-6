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
        this.minGapSize = 100;
        this.pipeWidth = 50;
        this.xPosition = width;
    }

    public void generateInitalPipe(){
        this.topPipeYPosition = (int)random(height-minGapSize);
        this.bottomPipeYPosition = (int)random(topPipeYPosition + minGapSize,height);
        generatePipe();
    }

    public void updateX (){
        this.xPosition -= 1;
        generatePipe();
    }

    private void generatePipe(){

        // System.out.println(this.xPosition);

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

    // public int setPipeInterval(int intaval){
    //     this.pipeIntaval = intaval;
    // }

    // public int getPipeInterval(){
    //     return this.pipeInterval;
    // }


}
