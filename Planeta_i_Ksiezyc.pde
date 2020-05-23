
public class Planeta {

  private PShape shape;
  private PVector vector;
  private float radius, angle, distance, speed;
  private color colorr;
  private int  moonNumber;
  private boolean swiatlo;
  private Moon[] ksiezyce;
  private int lastnumofMoon;
  private int[] koloryKsiezycow=new int[] {
    #ff794d, #f2f2f2, #1affff, #1a66ff, #ff4dc4, #ffa64d, #f5f3ce, #f0f0f0, #900C3F, #900C3F, #900C3F, #900C3F
  };

  //konstruktor

  public Planeta(float radiuss, float distancee, float speedd, int colorrr, boolean lig, int moonNum, 
    int moonSpeed, PShape shapeObj, float scal, boolean isTexture, int lastnumofMoon) {
    this.vector = PVector.random3D();
    this.radius=radiuss*10;    
    this.distance=distancee*100;
    this.speed=speedd/30;
    this.colorr=colorrr;  
    this.swiatlo=lig;
    this.moonNumber=moonNum;
    this.vector.mult(distance);
    this.angle = random(TWO_PI);
    this.shape=shapeObj;
    this.lastnumofMoon=lastnumofMoon;
    shape.scale(scal);
    
    this.ksiezyce=new Moon[moonNum];
    for(int i=0; i<moonNum; i++)
    {
      this.ksiezyce[i]=new Moon(radius/2,distance/2,moonSpeed, koloryKsiezycow[lastnumofMoon+i]);
    }
    
    if(isTexture)
    {
      this.shape.setTexture(loadImage("jupiter.jpg"));
    }
    
  }

//metoda display
  public void display() {
    pushMatrix();
    noStroke();
    PVector vecTmp = new PVector(1, 0, 1);
    PVector vecProduct = vector.cross(vecTmp);
    rotate(angle, vecProduct.x, vecProduct.y, vecProduct.z);
    //reflektorowe (spot) – umieszczone w zadanym punkcie przestrzeni, świecące w zadanym kierunku z zadanym kątem rozwarcia stożka, włączane poleceniem spotLight
    //(c1, c2, c3, p1, p2, p3, d1, d2, d3, angle, exponent), gdzie dodatkowo angle to kąt rozwarcia stożka, a exponent wykładnik potęgi regulujący stopień rozmycia krawędzi stożka.
    if (swiatlo) { 
      spotLight(255, 255, 0, vector.x - (radius/2), vector.y - (radius/2), 
        vector.z - (radius/2), 1, 0, 1, PI/6, 1);
    }
    translate(vector.x, vector.y, vector.z);
    shape(shape);
    shape.setFill(colorr);
    angle+=speed;
    if (ksiezyce!=null) {
      for (Moon it : ksiezyce) {
        it.display();
      }
    }
    popMatrix();
  }
}


public class Moon {


  private PShape shape;
  private PVector vector;
  private float radius, angle, distance, speed;
  private int colorr;


  public Moon(float radiuss, float distancee, float speedd, int colorrr) {
    vector = PVector.random3D(); //  Returns a new 3D unit vector with a random direction
    this.radius=radiuss;    
    this.distance=distancee;
    this.speed=speedd/30;
    this.colorr=colorrr;  
    vector.mult(distance);        //mnozy wektor przez skalar
    angle = random(TWO_PI);      //rotacja w radianach
    shape = createShape(SPHERE, radius); //tworzy nowy ksztalt
  }


  public void display() {
    pushMatrix();
    noStroke();
    PVector vecTmp = new PVector(1, 0, 1);     
    PVector vecProduct = vector.cross(vecTmp); 
    rotate(angle, vecProduct.x, vecProduct.y, vecProduct.z);
    translate(vector.x, vector.y, vector.z);  
    shape(shape);
    shape.setFill(colorr);
    angle+=speed;
    popMatrix();
  }
}
