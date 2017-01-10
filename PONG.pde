# Pong
//variable pantalla
int pantalla=0;

// variables pelota
int ballVelx=4;
int ballPosx=width/2;
int ballPosy=height/3;
int ballVely=5;
int ballDiametro=25;

//variables paletas
int paleLargo=80;
int paleAncho=30;
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
  rect(palePosx, palePosy, paleLargo, paleAncho);

  // mover raqueta

  palePosx=mouseX;

  // mover bola
  ballPosx=ballVelx+ballPosx;
  ballPosy=ballVely+ballPosy;
  if (ballPosx+ballDiametro/2>=width || ballPosx<=0) {
    ballVelx=-ballVelx;
  }
  if (ballPosy<=0) {
    ballVely=-ballVely;
  }
  if (ballPosy+ballDiametro/2>=height) {
    exit();
  }
  if (ballPosy+ballDiametro/2 >= palePosy && ballPosy <= palePosy && ballPosx>=palePosx && ballPosx<=palePosx+paleLargo) {
    ballVely=-ballVely;
  }
  
  // cambio de pantalla
  
}
