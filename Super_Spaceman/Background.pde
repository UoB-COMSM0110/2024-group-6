public enum Background {
    Space(0, 0, 50) {
        @Override
        public void drawBackground(PApplet app) {
            app.background(this.r, this.g, this.b);
            drawStars(app);
            drawMoon(app, 100);
        }
    },
    Mars(255, 140, 0) {
        @Override
        public void drawBackground(PApplet app) {
            app.background(this.r, this.g, this.b);
            //add more mars background features in
        }
    };

    //colour values for the background
    final int r, g, b;

    Background(int r, int g, int b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }

    public abstract void drawBackground(PApplet app);

    private static void drawStars(PApplet app) {
        app.stroke(255);
        for(int i = 0; i < 100; i++) {
            app.point(app.random(app.width), app.random(app.height));
        }
        app.noStroke();
    }

    private static void drawMoon(PApplet app, int offsetX) {
        //int offsetMoonX = 100; 
        app.fill(200, 200, 200); 
        app.ellipse(200 + offsetX , 150, 100, 100); 

        //moon's craters
        app.fill(180, 180, 180); 
        app.ellipse(190 + offsetX,140,20,20); 
        app.ellipse(210 + offsetX,160,10,10); 
        app.ellipse(220 + offsetX,130,15,15); 
        app.ellipse(170 + offsetX,130,10,10); 
        app.ellipse(185 + offsetX,170,25,25);
        app.fill(170, 170, 170);
        app.ellipse(185+offsetX,110,5,5);
        //ellipse(160+offsetX,160,15,15);

        // //blue planet
        // fill(0, 100, 200);
        // ellipse(250, 400, 80, 80);

        // //supposed to be a planet with a ring
        // fill(150, 75, 0);
        // ellipse(500,100, 120, 120);
        // //noFill();
        // stroke(180, 100, 0);
        // strokeWeight(3);
        // noFill();
        // arc(500, 100, 150, 50, 0, PI);
    }
    // Milkway,
    // Moon,
    // Earth,
    
}
