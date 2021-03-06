# Pong
/*
Proyecto realizado por M. Ángeles Fuentes Rodríguez
 Curso: 2º Bachillerato B
 Clase: Programación y Computación
 Centro: I.E.S. Vicente Aleixandre
 Fecha: 31/01/2017
 Agradecimientos a Miguel Granero Ramos
 */

//Establecemos todas las variables organizadas según su uso.

//Variables de la pantalla
int pantalla=0;
PFont font;
int puntos=0;

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

void setup() {    //Establecemos todo lo que queremos que se ejecute una sola vez (para esto sirve el void setup).

  size(600, 500);  //Establecemos el tamaño de la pantalla.
  font = createFont("Balker", 16, true); //Creamos una fuente para las letras.
}

void draw() {  //Establecemos todo lo que queremos que se ejecute de manera infinita (para esto sirve el void draw).

  background(242, 88, 152); //Establecemos el fondo.

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

//Creamos nuestros propios voids:

void dibujar_bola() { //Dibujamos la bola.
  stroke(240);
  strokeWeight(3);
  fill(255);
  ellipse(ballPosx, ballPosy, ballDiametro, ballDiametro);
}

void dibujar_paleta() { //Dibujamos la paleta.
  fill(255);
  rect(palePosx, palePosy, paleLargo, paleAncho);
}

void mover_paleta() { //Diseñamos el movimiento de la paleta.
  palePosx=mouseX;
}

void mover_bola() { //Diseñamos el movimiento de la pelota.

  //Establecemos las posiciones en x e y de la pelota:

  ballPosx=ballVelx+ballPosx;
  ballPosy=ballVely+ballPosy;

  //Establecemos el movimiento de la plota:

  if (ballPosx+ballDiametro/2>=width || ballPosx<=0) { //Rebote con las paredes laterales.
    ballVelx=-ballVelx;
  }
  if (ballPosy<=0) { //Rebote con el techo.
    ballVely=-ballVely;
  }
  if (ballPosy+ballDiametro/2>=height) { //Fin del juego porque la pelota ha caído.
    pantalla = 3;
  }
  if (ballPosy+ballDiametro/2 >= palePosy && ballPosy <= palePosy && ballPosx>=palePosx && ballPosx<=palePosx+paleLargo) { //Rebote con la paleta.
    ballVely=-ballVely;
    puntos+=1;
  }
}

void tablaPuntos() { //Diseñamos la tabla de puntos.

  stroke(165, 247, 235);
  fill(237, 160, 192);
  rect(width/26, height/26, width/4, height/9);
  textAlign (LEFT);
  textFont(font, height/18);
  fill(165, 247, 235);
  text("Puntos: " + puntos, width/15, height/9);
}

void botones() { //Diseñamos los botones "jugar" y "salir".

  strokeWeight(3);
  stroke(165, 247, 235);
  fill(237, 160, 192);
  ellipse(width/4, height/2 + height/6, width/3 + width/9, height/6 + height/20);
  ellipse(width/2 + width/4, height/2 + +height/6, width/3 + width/9, height/6 + height/20);

  textAlign (RIGHT);
  fill(165, 247, 235);  //Seleccionamos el color del texto.
  textFont(font, height/8);
  text("Jugar", width/3 + width/20, height/2 + height/5);

  textAlign (LEFT);
  text("Salir", width/3 +width/4 + width/20, height/2 + height/5);
}

void menu() { //Diseñamos el menú principal:
  botones();

  //Dibujamos el texto que queramos y lo colocamos en la pantalla:

  textFont(font, height/4);  //Seleccionamos la fuente del texto.
  fill(165, 247, 235);  //Seleccionamos el color del texto.
  textAlign(CENTER); //Alineamos el texto (para cada palabra utilizamos una alineación diferente).
  text("PONG", width/2, height/4);

  textFont(font, 25);
  text("Angeles Fuentes", width-textWidth("Angeles Fuentes:"), height-8);
}

void juego () { //Establecemos la pantalla de juego llamando a los bloques (voids) que actúan en ella.

  dibujar_bola();
  dibujar_paleta();
  mover_paleta();
  mover_bola();
  tablaPuntos ();

  textFont(font, height/20);
  text("Pulse en cualquier lugar de la pantalla para pausar", width/26, height/2 + height/3 + height/9);
}

void pausa () { //Establecemos la pantalla de pausa.

  //Llamamos a los bloques que actúan en ella:

  dibujar_bola();
  dibujar_paleta();
  tablaPuntos();

  //Dibujamos las letras que aparecen en ella:

  textAlign(CENTER);
  textFont (font, 100);
  text("PAUSA", width/2, height/3);

  textAlign(CENTER);
  textFont (font, 25);
  text("Pulse en cualquier lugar de la pantalla para continuar", width/2, height/2 + height/6);
}

void fin () { //Establecemos la pantalla de fin del juego:
  background(242, 88, 152);
  botones();

  //Dibujamos el texto que queramos y lo colocamos en la pantalla:

  textAlign(CENTER);
  fill(165, 247, 235);
  textFont (font, 80);
  text("FIN", width/2, height/4);
  text("DEL JUEGO", width/2, height/3 + height/7);
}

void mousePressed() {  //Establecemos los cambios de pantalla que se llevan a cabo al pulsar el ratón:
  switch (pantalla) {
  case 0: //En el menú tenemos dos opciones:"salir" y "jugar".
    if (mouseX<=width/2 && mouseY>=height/2) {
      pantalla=1;
    }
    if (mouseX>=width/2 && mouseY>=height/2) {
      exit();
    }   
    break;
  case 1: //Pulsando en el juego pasaremos a pausa.
    pantalla=2;
    break;

  case 2: //Pulsando en pausa volveremos al juego.
    pantalla=1;
    break;

  case 3: //En la pantalla de fin podemos elegir entre jugar otra vez o salir.
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
