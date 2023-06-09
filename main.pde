int SKY_COLOR = #0A65C6;
int GRASS_COLOR = #3BA439;
int MOON_COLOR = #FFFFFF;

boolean RAINBOW_COLORFUL = false;

float STAR_X = 75;
float STAR_Y = 75;
int STAR_COLOR = #E2D811;

int HOUSE_WALL_COLOR = #ffffff;
int HOUSE_ROOF_COLOR = #ff7300;
int HOUSE_DOOR_COLOR = #db5400;
int HOUSE_DOORNOB_COLOR = #D0C611;

float PERSON_SPEED = 7;
int PERSON_COLOR = #A468E4;
int PERSON_EYE_COLOR = #99CC00;


Star star;
House house;
Rainbow rainbow;
Person person;



// -------------------------------------------------------------------------------



void setup() {
  size(1200, 900, P3D);
  
  rainbow = new Rainbow(RAINBOW_COLORFUL);
  star = new Star(STAR_X, STAR_Y, STAR_COLOR);
  person = new Person(PERSON_SPEED, PERSON_COLOR, PERSON_EYE_COLOR);
  house = new House(HOUSE_WALL_COLOR, HOUSE_ROOF_COLOR, HOUSE_DOOR_COLOR, HOUSE_DOORNOB_COLOR);
}

void draw() {
  background(SKY_COLOR);
  
  drawGrass(GRASS_COLOR);
  drawMoon(MOON_COLOR);
  
  person.updateAndDraw();
  house.updateAndDraw(person.x);
  
  star.updateAndDraw();
  rainbow.updateAndDraw();
}



// -------------------------------------------------------------------------------



void drawGrass(int colour) {
  noStroke();
  fill(colour);
  rect(0, 700, 1200, 200);
  stroke(0);
}

void drawMoon(int colour) {
  fill(colour);
  noStroke(); 
  pushMatrix();
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1); 
  translate(1050, 125, 0); 
  sphere(80); 
  popMatrix();
  stroke(0);
}



// -------------------------------------------------------------------------------



class Rainbow {
  boolean colorful;
  
  int[] colors = {
    #9400D3,        // Violet
    #4B0082,        // Indigo
    #0000FF,        // Blue
    #00FF00,        // Green
    #FFFF00,        // Yellow
    #FF7F00,        // Orange
    #FF0000          // Red
  };
  
  Rainbow(boolean colorful) {
    this.colorful = colorful;
  }
  
  void updateAndDraw() {
    noFill();
    
    int count = 0;
    
    float minValue = 0.0;
    float maxValue = 300.0;
    float r1 = random(minValue, maxValue);
    float r2 = random(minValue, maxValue);
    float r3 = random(minValue, maxValue);

    for (int i = 0; i < 490; i += 70) {
      if (this.colorful) {
        stroke(color(r1, r2, r3));
      } else {
        stroke(colors[count]);
      }
      bezier(mouseX-(i/2.0), mouseY+i, 410, 20, 440, 300, 0-(i/16.0), 300+(i/8.0));
      count++;
    }
    
   stroke(0);
  }
  
}

class House {
 float x = 800;
  
  int wallColor;
  int roofColor;
  int doorColor;
  int doornobColor;
  
  House(int wallColor, int roofColor, int doorColor, int doornobColor) {
     this.wallColor = wallColor; 
     this.roofColor = roofColor; 
     this.doorColor = doorColor;
     this.doornobColor = doornobColor;
  }
  
  void updateAndDraw(float personX) {
    pushMatrix();
    float scaleFactor = map(personX, 0, this.x, 1.0, 1.1);
    scale(scaleFactor);
    draw();
    popMatrix();
  }
  
  private void draw() {
    // wall
    fill(this.wallColor);
    rect(this.x, 450, 300, 250);
    
    // roof
    fill(this.roofColor);
    triangle(770, 450, 950, 250, 1130, 450);
    
    // door
    fill(this.doorColor);
    rect(825, 500, 90, 200);
    
    // doornob
    fill(this.doornobColor);
    circle(895, 600, 20);
    
    // window
    fill(#C7BCD6);
    rect(950, 525, 125, 100);
    
    // window frame
    fill(this.doorColor);
    rect(950, 570, 125, 10);
    rect(1005, 525, 10, 100);
  }
  
}

class Star {
  float x;
  float y;
  int colour;
  
  float rotate = 0;
  PShape starGroup = createShape(GROUP);
  
  
  Star(float x, float y, int colour) {
    this.x = x;
    this.y = y;
    this.colour = colour;
    
    draw(this.x, this.y, 30, 70, 5, this.colour);
  }
  
  void updateAndDraw() {
    PShape star = starGroup.getChild(0);
    
    if (keyPressed) {
      if (key == 'p') {
        this.rotate = 0;
      } else if (key == 'g') {
        this.rotate = 0.05;
      }
    }
    star.rotate(this.rotate);
    
    shape(starGroup);
  }

  private void draw(float x, float y, float radius1, float radius2, int npoints, int colour) {
    PShape star = createShape();
    
    float angle = TWO_PI / npoints;
    float halfAngle = angle / 2.0;
    star.beginShape();
    star.noStroke();
    star.fill(colour);
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      star.vertex(sx, sy);
      sx = x + cos(a + halfAngle) * radius1;
      sy = y + sin(a + halfAngle) * radius1;
      star.vertex(sx, sy);
    }
    star.stroke(0);
    star.endShape(CLOSE);

    starGroup.addChild(star);
  }
  
}

class Person {
   float speed;
   int colour;
   
   float x = 0;
   
   Eye leftEye, rightEye;
   
   Person(float speed, int colour, int eyeColor) {
     this.speed = speed;
     this.colour = colour;
     
     this.leftEye = new Eye(100, 545, 25, eyeColor);
     this.rightEye = new Eye(130, 545, 25, eyeColor); 
   }
  
  void updateAndDraw() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        this.x -= this.speed;
      } else if (keyCode == RIGHT) {
        this.x += this.speed;
      }
    }
    
    draw();
  }
  
  private void draw() {
    fill(this.colour);
    rect(100 + this.x, 575, 30,100);      // body
    ellipse(115 + this.x, 545, 60,60);    // head
    
    // legs
    line(100 + this.x, 675, 90 + this.x, 700);
    line(130 + this.x, 675, 140 + this.x, 700); 
    
    // eyes
    leftEye.updateAndDraw(mouseX, mouseY, this.x);
    rightEye.updateAndDraw(mouseX, mouseY, this.x); 
  }
  
}

class Eye {
  float x, y;
  float size;
  int colour;
  
  Eye(float x, float y, float size, int colour) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.colour = colour;
 }

  void updateAndDraw(float mx, float my, float posX) {
    float angle = atan2(my-y, mx-x);
    draw(angle, posX);
  }
  
  private void draw(float angle, float posX) {
    pushMatrix();
    translate(x + posX, y);
    fill(255);
    ellipse(0 , 0, this.size, this.size);
    rotate(angle);
    fill(this.colour);
    ellipse(this.size/4, 0, this.size/2, this.size/2);
    popMatrix();
  }
  
}



// -------------------------------------------------------------------------------
