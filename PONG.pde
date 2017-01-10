# Pong
//variable pantalla
int pantalla=0;
PFont font1;

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
   font1 = createFont("Arial", 16, true); //Creamos una fuente para las letras
}

void draw() {
  background(0);

  dibujar_bola();
  dibujar_paleta();
  mover_raqueta();
  mover_bola();
  
  // cambio de pantalla
  switch (pantalla){
  case 0:
    menu();
      break;

}
}

void dibujar_bola() {
  stroke(240);
  strokeWeight(3);
  fill(255);
  ellipse(ballPosx, ballPosy, ballDiametro, ballDiametro);
}

void dibujar_paleta() {
  fill(255);
  rect(palePosx, palePosy, paleLargo, paleAncho);
  }
  
void mover_raqueta() {
  palePosx=mouseX;
}

void mover_bola() {
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
  }
void menu() { //En este bloque dibujamos el HUD del menu principal
  textFont(font1, height/4);  //Seleccionamos la fuente del texto            
  fill(mouseX, mouseY, (mouseX+mouseY)/2);
  textAlign(CENTER); //La alineacion del texto con la posicion que demos
  text("PONG", width/2, height/4); //Dibujamos el string que queramos (PONG en este caso)
  fill(mouseY, (mouseX+mouseY)/2, mouseX );
  rect(0, height/2, width, height/6);
  textFont(font1, height/6); 
  fill(mouseX, mouseY, (mouseX+mouseY)/2);
  text("PLAY", width/2, height/2 + height/6 - height/50);
  textFont(font1, 16); 
  fill(500);
  textAlign(LEFT);
  text("Miguel Granero", width-textWidth("Miguel Granero:"), height-16);
}
