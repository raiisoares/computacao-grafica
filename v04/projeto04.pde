House house = new House();
Star s1,s2;
Eye leftEye, rightEye;

float cycleX = 0;
float houseLimit = 650;

float personX = 100;
float personY = 575;

float scaleValue = 1.0;
float scaleSpeed = 0.0002;

boolean retorno = false;

void setup() {
  size(1200, 900, P3D);
  s1 = new Star();
  leftEye = new Eye(100, 545, 25);
  rightEye = new Eye(130, 545, 25); 
}

void draw() {
  background(0, 22, 189);
  s1.displayStar();

  person();
  drawArco();
  leftEye.update(mouseX, mouseY);
  rightEye.update(mouseX, mouseY);
  
  leftEye.display(personX);
  rightEye.display(personX);
  
  drawSun();
  drawGrass();
  
  pushMatrix(); // adiciona o pushMatrix antes do scale
  scale(scaleValue); // escala o objeto
  house.drawHouse();
  popMatrix(); // adiciona o popMatrix depois do scale
  
  // Calcula a distância entre personX e cycleX
  float distance = abs(personX - cycleX);
  
  // Define o fator de escala com base na distância
  float scaleFactor = map(distance, 0, houseLimit, 1.0, 1.1);
  
  // Atualiza o valor de escala
  scaleValue = scaleFactor;
  
}

class Star {
PShape group;
 Star() {
  group = createShape(GROUP);
  
  PShape star = createShape();
  star.beginShape();
  star.fill(230, 195, 0);
  star.stroke(255);
  star.vertex(0+80, -50+80);
  star.vertex(14+80, -20+80);
  star.vertex(47+80, -15+80);
  star.vertex(23+80, 7+80);
  star.vertex(29+80, 40+80);
  star.vertex(0+80, 25+80);
  star.vertex(-29+80, 40+80);
  star.vertex(-23+80, 7+80);
  star.vertex(-47+80, -15+80);
  star.vertex(-14+80, -20+80);
  star.endShape(CLOSE);
  group.addChild(star);
}
  void displayStar() {

  PShape star = group.getChild(0);
  if (keyPressed) {
    if (key == 'p') {
  star.rotate(0);
    }
  } else if (key == 'g') {
  star.rotate(0.02);
  }
  
  shape(group);
  }
  
}

void drawArco(){
    noFill();
    float minValue = 0.0;
    float maxValue = 300.0;
    float r1 = random(minValue, maxValue);
    float r2 = random(minValue, maxValue);
    float r3 = random(minValue, maxValue);

  for (int i = 0; i < 200; i += 20) {

    // Cria uma cor com base no índice multiplicado por 5
    color c = color(r1, r2, r3);  // Define a cor como vermelho puro
    stroke(c); // Define a cor do traço como a cor criada
    bezier(mouseX-(i/2.0), mouseY+i, 410, 20, 440, 300, 0-(i/16.0), 300+(i/8.0));
  }
  stroke(0);
}


void drawSun() {
  fill(#FFFFFF);
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

void drawGrass() {
  fill(14, 214, 0);
  rect(0, 700, 1200, 200);
}

class House {
  void drawHouse(){
  fill(#FFFFFF);
quad(800, 450, 1100, 450, 1100, 700, 800, 700);
  fill(255, 115, 0);
  triangle(770, 450, 950, 250, 1130, 450);
  fill(219, 84, 0);
rect(825, 500, 90, 200);
  fill(0, 229, 255);
quad(950, 525, 1075, 525, 1075, 625, 950, 625);
  fill(219, 84, 0);
rect(950, 570, 125, 10);
rect(1005, 525, 10, 100);
  fill(255, 247, 0);
  circle(895, 600, 20);
  
  }
}

void person() {
  fill(255, 0, 0); 
  rect(100 + personX, 575, 30,100);
  ellipse(115 + personX, 545, 60,60);
  fill(#FFFFFF);
  //ellipse(100 + personX, 545, 16,32);
  //ellipse(130 + personX, 545, 16,32);
  line(100 + personX, 675, 90 + personX, 700);
  line(130 + personX, 675, 140 + personX,700); 
}

void keyPressed() {
  if (keyCode == LEFT) {
    personX -= 10;  // Mover para a esquerda
  } else if (keyCode == RIGHT) {
    personX += 10;  // Mover para a direita
  }
}


class Eye {
  float x, y;
  float size;
  float angle = 0.0;
  
  Eye(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
 }

  void update(float mx, float my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display(float posX) {
    pushMatrix();
    translate(x+ posX, y);
    fill(255);
    ellipse(0 , 0, size, size);
    rotate(angle);
    fill(153, 204, 0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}
