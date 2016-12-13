# Pong
// variables pelota
int ballVelx=4;
int ballPosx=width/2;
int ballPosy=height/3;
int ballVely=5;
int ballDiametro=30;

//variables paletas
int paleLargo=40;
int paleAncho=70;
int palePosx=width/2;
int palePosy=height*4;
void setup() {
  size(600, 500);
}

void draw() {


  background(0);

  // dibujar bola
  stroke(240);
  strokeWeight(3);
  fill(255);
  ellipse(ballPosx, ballPosy, ballDiametro, ballDiametro);

  // dibujar paleta
  fill(255);
  rect(palePosx, palePosy, paleAncho, paleLargo);

  // mover raqueta

  palePosx=mouseX;

  // mover bola
  ballPosx=ballVelx+ballPosx;
  ballPosy=ballVely+ballPosy;
  if (ballPosx+ballDiametro/2>=width || ballPosx<=0) {
    ballVelx=-ballVelx;
  }
  if (ballPosy+ballDiametro/2>=height || ballPosy<=0) {
    ballVely=-ballVely;
  }
}
