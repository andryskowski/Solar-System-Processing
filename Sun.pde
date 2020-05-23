public class Sun {

  /*########################## FIELDS ######################################*/
  private PShape shape;
  private float radius;
  private int paint;

  /*########################## CONSTRUCTOR ######################################*/
  public Sun(float rad, int pai) {
    this.radius=rad;    
    this.paint=pai;   
    this.shape=createShape(SPHERE, radius);

  }

  /*########################## DISPLAY METHOD ######################################*/
  public void display() {
    pushMatrix();
    noStroke();     //Disables drawing the stroke
    shape(shape);   //Draws shapes to the display window
    shape.setFill(paint);
    popMatrix();
  }
}
