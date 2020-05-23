import peasy.*;

//zmienne globalne
PeasyCam peasyCam;
Sun sun;
Planeta [] planety;

//metoda setup
void setup() {
  size(1680, 1050, P3D);
  background(0);
  noStroke();
  peasyCam = new PeasyCam(this, 500);
  PShape capsule = loadShape("capsule.obj");
  PShape sphere=createShape(SPHERE, 2);
  PShape box=createShape(BOX, 3);
  
  sun=new Sun(50, #FF8C00);

  planety=new Planeta[4];
  planety[0]=new Planeta(2, 2, 1, #000000, true, 3, 2, sphere, 20,true, 0);
  planety[1]=new Planeta(3.5, 3, 1.5, #2F329F, true, 2, 2, box, 20,false,3);
  planety[2]=new Planeta(5, 5, 1.1, #2FC39F, false, 1, 2, capsule, 20,false,2);
  planety[3]=new Planeta(4, 5, 1.3, #23C3E7, true, 0, 1, box, 1,false,1);

}

//metoda draw
void draw() {
  background(0);
  //świecące we wszystkich kierunkach w całej scenie, zazwyczaj stosowane wraz z innymi typami, 
  //gdyż samo nie tworzy wrażenia trójwymiarowości kształtów, włączane jest poleceniem
  //ambientLight(c1, c2, c3), gdzie ci to kolejne wartości składowych RGB lub HSB, zależnie od trybu,
    sun.display();
  ambientLight(128, 128, 128);
  //(128, 128, 128) oznacza bialy kolor w RGB, (0,0,0) oznacza lewy gorny rog
  pointLight(128, 128, 128, 0, 0, 0);   


  planety[0].display();
  planety[1].display();
  planety[2].display();
  planety[3].display();
  

}
