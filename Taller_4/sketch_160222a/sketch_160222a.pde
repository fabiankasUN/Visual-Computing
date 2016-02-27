


PImage img;

void setup(){
   size(600,800); 
   v = new PVector(300,500);
   mouse = new PVector(100, 50);
   particles = new ArrayList<Particle>();
   img = loadImage("smoke.png");
}
PVector v;
PVector mouse;

ArrayList<Particle> particles;

void run( ){
  for( int i = 0; i < particles.size() ; i++ ) {
     Particle current = particles.get(i);
     if( current.isDead() )
        particles.remove(i);
     else{
        current.update(mouseX,mouseY); 
     }
  }
}

void addParticle(){
  for( int i= 0; i < 20 ; i++ ){
     particles.add( new Particle(new PVector(300,500)));
  }
}

void draw(){
  background(0);
  mouse.x = mouseX;
  mouse.y = mouseY;
  //ellipse(v.x,v.y, 50,50);
  ellipse(mouse.x,mouse.y, 20,20);
  addParticle();
  run();
  
  
  
  
}