class HazardPipe{

    private int pipeSizeBottom;
    private int pipeSizeTop;

    private int pipeInterval;

    private String pipeColour;

    public HazardPipe(){
        this.pipeInterval = 100;
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




    public int setPipeInterval(int pipeIntaval){
        this.pipeIntaval = pipeIntaval;
    }

    public int getPipeInterval(){
        return this.pipeInterval;
    }

   
}
