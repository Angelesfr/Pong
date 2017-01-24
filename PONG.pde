# Pong
//Establecemos todas las variables organizadas según su uso.
//Variables de la pantalla
int pantalla=0;
PFont font;

//Variables de la pelota
int ballVelx=4;
int ballPosx=width/2;
int ballPosy=height/3;
int ballVely=5;
int ballDiametro=25;

//Variables de la paleta
int paleLargo=80;
int paleAncho=30;
int palePosx=width/2;
int palePosy=height*4;

void setup() {    //Establecemos todo lo que queremos que se ejecute una sola vez (para esto sirve el void setup)
  size(600, 500); //Establecemos el tamaño de la pantalla
  font = createFont("Balker", 16, true); //Creamos una fuente para las letras
}

void draw() {  //Establecemos todo lo que queremos que se ejecute de manera infinita (para esto sirve el void draw)
  background(228, 65, 44); //Establecemos el fondo

  // Establecemos el cambio de pantalla otorgándole a cada pantalla un case.
  switch (pantalla) {
  case 0:
    menu();
    break;

  case 1:
    juego();
    break;

  case 2:
    pausa();
    break;

  case 3:
    fin();
    break;
  }
}

//Creamos nuestros propios voids

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
  //
  ballPosx=ballVelx+ballPosx;
  ballPosy=ballVely+ballPosy;
  //
  if (ballPosx+ballDiametro/2>=width || ballPosx<=0) {
    ballVelx=-ballVelx;
  }
  if (ballPosy<=0) {
    ballVely=-ballVely;
  }
  if (ballPosy+ballDiametro/2>=height) {
    pantalla = 3;
  }
  if (ballPosy+ballDiametro/2 >= palePosy && ballPosy <= palePosy && ballPosx>=palePosx && ballPosx<=palePosx+paleLargo) { //Rebote con la paleta
    ballVely=-ballVely;
  }
}
void menu() { //Diseñamos el menú principal
  textFont(font, height/4);  //Seleccionamos la fuente del texto            
  fill(165, 247, 235);
  textAlign(CENTER); //Alineamos el texto
  //Dibujamos el texto que queramos
  text("PONG", width/2, height/4);
  textFont(font, height/6); 
  fill(165, 247, 235);
  textFont(font, 25);
  textAlign(LEFT); //Utilizamos otra alineación para otro texto diferente.
  text("Angeles Fuentes", width-textWidth("Angeles Fuentes:"), height-8);
}
void juego () { //Establecemos la pantalla de juego llamando a los bloques (voids) que actúan en ella.
  dibujar_bola();
  dibujar_paleta();
  mover_raqueta();
  mover_bola();
}
void pausa () { //Establecemos la pantalla de pausa.
  //Llamando a los bloques que actúan en ella.
  dibujar_bola();
  dibujar_paleta();
  //Dibujamos las letras que aparecen en ella.
  textAlign(CENTER);
  textFont (font, 100);
  text("PAUSA", width/2, height/4);
  textAlign(CENTER);
  textFont (font, 25);
  text("Pulse en cualquier lugar de la pantalla para continuar", width/2, height/2 + height/6);
}
void fin () { //Establecemos la pantalla de fin del juego.
  background(228, 65, 44);

  //Dibujamos las letras que aparecen en ella.
  textAlign(CENTER);
  text("FIN", width/2, height/4);
  textFont (font, 80);
  text("DEL JUEGO", width/2, height/2);
  textFont (font, 80);
}
void mousePressed() {
  switch (pantalla) {
  case 0:
    if (mouseX<=width/2 && mouseY>=height/2) {
      pantalla=1;
    }
    if (mouseX>=width/2 && mouseY>=height/2) {
      exit();
    }   
    break;
  case 1:
    pantalla=2;
    break;

  case 2:
    pantalla=1;
    break;

  case 3:
    if (mouseX<=width/2 && mouseY>=height/2) {
      ballVelx=4;
      ballPosx=width/2;
      ballPosy=height/3;
      ballVely=5;
      pantalla=1;
    }
    if (mouseX>=width/2 && mouseY>=height/2) {
      exit();
    }   
    break;
  }
}
