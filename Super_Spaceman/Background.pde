
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
            
            drawColouredStars(app, 150);
            drawDustStorm(app);

            drawPlanet(app, app.width * 0.1f, app.height * 0.2f, 30, 255, 204, 0); 
            drawPlanet(app, app.width * 0.8f, app.height * 0.1f, 20, 255, 165, 0); 
            drawPlanet(app, app.width * 0.3f, app.height * 0.1f, 50, 165, 42, 42);
            drawPlanet(app, app.width * 0.6f, app.height * 0.2f, 25, 139, 0, 0);
            drawPlanet(app, app.width * 0.85f, app.height * 0.15f, 25, 255, 223, 0); 
            drawPlanet(app, app.width * 0.75f, app.height * 0.05f, 20, 205, 133, 63); 

            //drawMountains(app, 0, app.height * 0.6f, app.width, app.height * 0.4f);
            drawMountains(app, 0, app.height, app.width * 0.3f, app.height * 0.5f);
            drawMountains(app, app.width * 0.25f, app.height, app.width * 0.5f, app.height * 0.4f); 
            drawMountains(app, app.width * 0.7f, app.height, app.width * 0.3f, app.height * 0.5f); 
            
            drawAlienFlora(app, app.width * 0.2f, app.height * 0.8f);
            drawAlienFlora(app, app.width * 0.4f, app.height * 0.75f);

            drawBoulders(app, app.width * 0.2f, app.height * 0.75f, 40);
            drawBoulders(app, app.width * 0.5f, app.height * 0.8f, 30);
            drawBoulders(app, app.width * 0.45f, app.height * 0.78f, 60);
            drawBoulders(app, app.width * 0.6f, app.height * 0.82f, 40);
            drawBoulders(app, app.width * 0.75f, app.height * 0.76f, 50);
        }
    },

    Moon(20, 20, 40) {
        @Override
        public void drawBackground(PApplet app) {
            app.background(this.r, this.g, this.b);
            drawStars(app);
            
            //moon semi circle
            app.fill(200, 200, 200); 
            app.rect(0, app.height / 2, app.width, app.height / 2);

        
            drawCraters(app, app.width * 0.2f, app.height * 0.75f, 30);
            drawCraters(app, app.width * 0.4f, app.height * 0.6f, 45);
            drawCraters(app, app.width * 0.6f, app.height * 0.8f, 40);
            drawCraters(app, app.width * 0.8f, app.height * 0.7f, 25);
            
            drawCraters(app, app.width * 0.3f, app.height * 0.65f, 20);
            drawCraters(app, app.width * 0.5f, app.height * 0.85f, 15);
            drawCraters(app, app.width * 0.7f, app.height * 0.75f, 35);
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


    //MARS METHODS:
    private static void drawAlienFlora(PApplet app, float x, float y) {
        app.fill(130, 0, 0);
        app.beginShape();
        app.vertex(x, y);
        app.bezierVertex(x - 10, y - 30, x + 10, y - 60, x, y - 90);
        app.bezierVertex(x + 10, y - 60, x - 10, y - 30, x, y);
        app.endShape(PApplet.CLOSE);
    }

    private static void drawMartianSkyline(PApplet app) {
        app.fill(100, 50, 0);
        app.beginShape();
        float baseY = app.height * 0.5f;
        app.vertex(0, baseY);
        for (float x = 0; x < app.width; x += 50) {
            float y = baseY - app.random(50, 100);
            app.vertex(x, y);
        }
        app.vertex(app.width, baseY);
        app.vertex(app.width, app.height);
        app.vertex(0, app.height);
        app.endShape(PApplet.CLOSE);
    }

    private static void drawDustStorm(PApplet app) {
        app.fill(255, 140, 0, 50);
        app.rect(0, 0, app.width, app.height);
    }

    //need to refactor as this is still not working properly
    private static void drawColouredStars(PApplet app, int numberOfStars) {
        for (int i = 0; i < numberOfStars; i++) {
            float x = app.random(app.width);
            float y = app.random(app.height);
            float starSize = app.random(1, 3);
            int starColour = app.color(app.random(150, 255), app.random(100, 255), app.random(100, 255));
            app.stroke(starColour);
            app.point(x, y);
        }
        app.noStroke();
    }

    private static void drawBoulders(PApplet app, float x, float y, float size){
        app.fill(120, 60, 0);
        app.ellipse(x, y, size, size);
    }

    private static void drawMountains(PApplet app, float startX, float startY, float width, float height) {
        float peakX = startX + width / 2;
        float peakY = startY - height; 
        app.fill(150, 75, 0); 
        app.triangle(startX, startY, peakX, peakY, startX + width, startY);
    }

    private static void drawPlanet(PApplet app, float x, float y, float size, int r, int g, int b) {
        app.noStroke();
        app.fill(r, g, b, 120);
        app.ellipse(x, y, size + 10, size + 10);
        app.fill(r, g, b);
        app.ellipse(x, y, size, size);
    }

    private static void drawStars(PApplet app) {
        app.stroke(255);
        for(int i = 0; i < 100; i++) {
            app.point(app.random(app.width), app.random(app.height));
        }
        app.noStroke();
    }


    //MOON METHODS:
    private static void drawCraters(PApplet app, float x, float y, float size) {
        app.fill(150, 150, 150);            
        app.ellipse(x, y, size, size * 0.75);
    }

    //SPACE METHODS:
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
    };

    // Milkyway,
    // Earth,



    
}
