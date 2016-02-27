


public class Planet{
 
  float x,y,z;
  float r;
  float frec;
  float angle;
  float rSphere;
  float rotate;
  float rate;
  Moon moon;
  
  
  public Planet( float x, float y, float z, float r, float frec, float rSphere, float rate ){
    this.x = x;
    this.y = y;
    this.z = z;
    this.r = r;
    this.frec = frec;
    this.rSphere = rSphere;
    this.rate = rate;
    angle = 0;
    
    moon = new Moon(x,y,z,rSphere*2,frec*2,rSphere/3,rate*8);
  
  }
  
  public void translatePlanet( color c ){
    pushMatrix();
    x = 0 + cos(radians(angle))*(r);
    y = 0 + sin(radians(angle))*(r);
    angle -=frec;
    rotateX(0.4);
    translate(x,y,0);
    fill(c);
    stroke(51);
    strokeWeight(0.5);
    rotate(rotate);
    rotate=(rotate+rate)%360;
    sphere(rSphere);
    popMatrix();
    pushMatrix();
    noFill();
    stroke(255);
    rotateX(0.4);
    ellipse(0,0,r*2,r*2);
    popMatrix();
    
    
    
    //paint moon
    
    pushMatrix();
    noFill();
    stroke(192,192,192);
    rotateX(0.4);
    ellipse(x,y,moon.r*2,moon.r*2);
    popMatrix();
    pushMatrix();
    
    
    
    moon.x = x + cos(radians(moon.angle))*(moon.r);
    moon.y = y + sin(radians(moon.angle))*(moon.r);
    moon.angle-= moon.frec;
    rotateX(0.4);
    translate(moon.x,moon.y,0);
    fill(0);
    strokeWeight(1);
    rotate(rotate);
    sphere(moon.rSphere);
    
    
    popMatrix();
  
  }
  
  public void rotatePLanet(){
  }
  
  
  
}