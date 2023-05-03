void setup() {
  size(700, 700);
}
int i=0;
float delayH=0;
int delayM=0;

void draw() {

  pushMatrix();

  //eje de coordenadas centrao en canvas:
  translate(width/2, height/2);

  background(255, 255, 225);

  //modo fin de segmento:
  strokeCap(ROUND);

  //SEGUNDOS
  pushMatrix();
  noFill();

  // variables que determinan:
  // el ancho del arco y el punto.
  // el radio del arco y la posición del punto.
  int gordo = 6;
  int sitio = 110;

  strokeWeight(gordo);
  stroke(255, 0, 0);

  // arco del segundero
  arc(0, 0, 2*sitio, 2*sitio, radians(-90), radians(second()*6-97));

  //giro del segundero 
  //afecta al punto y al texto
  //cada segundo, la aguja gira 6º,
  //por eso multiplico por 6
  rotate(radians(second()*6));

  noStroke();
  fill(255, 0, 0);
  ellipse(0, -sitio, gordo, gordo);

  //centrado del texto del segundero
  int centrado = -4;
  if (second()>9) {
    centrado = -8;
  };

  text(second(), centrado, -sitio-2*gordo);
  popMatrix();

  //HORAS
  pushMatrix();
  rotate(radians((hour()-delayH)*30+map(minute(), 0, 59, 0, 29)));
  stroke(0, 0, 255);
  strokeWeight(11);
  line(0, 0, 0, -60);
  popMatrix();

  //MINUTOS
  pushMatrix();
  rotate(radians((minute()-delayM)*6));

  //manecilla que simula ancho
  strokeWeight(12);
  stroke(255, 255, 210);
  line(0, 0, 0, -93);

  //manecilla real 
  stroke(0, 0, 255);
  strokeWeight(9);
  line(0, 0, 0, -93);
  popMatrix();

  popMatrix();

  //CONTADOR DE SEGUNDOS SUPERIOR

  //dividimos pantalla y dejamos margen
  int ancho = width/59;
  int margen = width - ancho*59;

  //movemos el origen de coordenadas al lugar del primer punto
  translate(margen/2+ancho/2, 20);
  int y=0;

  //2 casos posibles:
  //los segundos distintos de 0
  //el segundo igual a 0
  
  if (second()!=0) {
    for (int x=0; x<second(); x++) {
      noStroke();
      fill(255, 0, 0);
      ellipse(ancho*x, y, 9, 9);
    }
    text(second(), (second()-1)*ancho-3, 20);
  } else {
    noFill();
    strokeWeight(1);
    stroke(255, 0, 0);
    ellipse(0, 0, 9, 9);
    text(second(), second()*ancho-3, 20);
  }
  
//saveFrame("output/v_####.png");
}
