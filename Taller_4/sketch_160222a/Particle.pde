
public class Particle{
 
  PVector velocity;
  PVector location;
  PVector aceleration;
  float life;
  
  public Particle( PVector location ){
    this.velocity = new PVector(random(-1.0,1.0), random(-1.0,1.0));
    this.location = location.get();
    this.aceleration = new PVector(00,0);
    this.life = 255;
  }
  
  public boolean isDead(){
    return life<=0;
  }
  
  public void update( int x, int y ){
    life-=5;
    stroke(255);
    fill(life);
    velocity.add(aceleration);
    location.add(velocity);
    setA(x,y);
    
    image(img,location.x,location.y);
    //ellipse(location.x,location.y, 5,5);
  }
  
  void setA(int x, int y){
    if( x > location.x ){
      aceleration.x = (x - location.x)*0.001;
    }
    else{
      aceleration.x = (x - location.x)*0.001;
    }
    if( y > location.y ){
      aceleration.y = (y - location.y)*0.001;
    }
    else{
      aceleration.y = (y - location.y)*0.001; 
      
    }
  
  
}

}