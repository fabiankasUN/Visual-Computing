import remixlab.proscene.*;
import remixlab.dandelion.geom.*;
import remixlab.dandelion.core.Constants.*;

Scene scene;

float rSun = 40;
color c;
float rotate;

Planet p1;
Planet p2;
Planet p3;
void setup() {
  size(1000, 800, P3D);
  scene = new Scene(this);
  p1 = new Planet(1,1,1,70,2,8,0.5);
  p2 = new Planet(1,1,1,100,1,13,3);
  p3 = new Planet(1,1,1,150,1,5,2);
}

void draw() {
  background(0);
  
  //planeta 1
  p1.translatePlanet( color(51,255,51) );  
  
  //planeta 2
  p2.translatePlanet( color(255,178,102) );
  
  p3.translatePlanet( color(100,100,100) ); 
  
  
  //Sol
  pushMatrix();
  rotate((rotate++)%360);
  c = color(255, 153, 51);
  fill(c);
  sphere(rSun);
  popMatrix();
    

}