class HazardPipe{

    private int pipeSizeBottom;
    private int pipeSizeTop;
    private int pipeInterval;
    private int pipeWidth; 
    private int minGapSize;

    public HazardPipe(){
        this.pipeInterval = 100;
        this.minGapSize = 100;
        this.pipeWidth = 50;
    }

    public void generatePipe(){

        //Top Pipe
        fill(333,345,198);
        noStroke();
        int topPipeYPosition = (int)random(height-minGapSize);
        rect(100, 0, this.pipeWidth, topPipeYPosition);

        //bottom pipe
        fill(333,345,198);
        noStroke();
        rect(100, (int)random(topPipeYPosition + minGapSize,height) , this.pipeWidth, height);
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




    // public int setPipeInterval(int pipeIntaval){
    //     this.pipeIntaval = pipeIntaval;
    // }

    // public int getPipeInterval(){
    //     return this.pipeInterval;
    // }

   
    // public void pipeUpdate (){

    // }



}
