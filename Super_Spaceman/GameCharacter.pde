class GameCharacter {

    protected int xPosition;
    protected int yPosition;
    private int deltaY;
    private int gforce;
    protected PImage character;
    protected PApplet game;

    public GameCharacter(){}

    public GameCharacter(PApplet processingMethord){
        this.game = processingMethord;
        this.xPosition = game.width/2;
        this.yPosition = game.height/2;
        this.character = this.game.loadImage("assets/spaceman2.png");
        this.game.imageMode(PConstants.CENTER);
        this.game.image(this.character,this.xPosition,this.yPosition);
        this.deltaY = 63;
        this.gforce = 4;
    }

    public int getX(){
        return this.xPosition;
    }

    public void setX(int x){
        this.xPosition = x;
    }

    public int getY(){
        return this.yPosition;
    }

    public void setY(int y){
        this.yPosition = y;
    }

    public void jump() {
        this.setY(this.getY()-deltaY);
    }

    public void gravity(){
        this.setY(this.getY()+this.gforce);
    }

    public void getCharacter(){
        this.character = this.game.loadImage("assets/spaceman2.png");
        this.game.image(this.character,this.xPosition,this.yPosition);
    }

    public void setIncreaseDeltaY(){
        this.deltaY += 1;
    }

}
