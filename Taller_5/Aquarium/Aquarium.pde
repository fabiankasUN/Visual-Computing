
import remixlab.proscene.*;

Scene scene;
//Choose one of P3D for a 3D scene, or P2D or JAVA2D for a 2D scene
String renderer = P3D;
PImage img;

void setup() {
  size(800, 600, renderer);
  //Scene instantiation
  scene = new Scene(this);
  // when damping friction = 0 -> spin
  scene.eye().frame().setDampingFriction(0);
  createAquarium();
  //img = loadImage("p10.jpg");
  //initializeSphere(30,30);
}



private ArrayList<Race> races;
private int numberRaces;
private boolean debug = true;


public void debug(){

  if(debug){
    print("number races -->" + numberRaces + "\n" );
  
  }

}


void createAquarium(){
  
  int tmp;
  String tmpImage;
  PImage tmpTexture;
  numberRaces = 3;
  races = new ArrayList<Race>();
  
  for( int i = 0; i < numberRaces; i++ ){
    tmp = int(random(20)+1);
    tmpImage = "p" + int(random(17)+1)+ ".jpg";
    tmpTexture = loadImage(tmpImage);
    races.add( new Race( tmpTexture ) );
    for( int j = 0; j < tmp; j++ ){
      races.get(i).addFish();
    }
  }
}

public void paintRaces(){
  for( int i = 0; i < numberRaces; i++ ){
    Race tmp = races.get(i);
    tmp.paintFishes();
  }
}

public int randomNumber( int min, int max ){
    int diff = max - min;
    int r = int(random(diff));
    return r + min;  
  }


void draw() {
  background(0);
  fill(255,255,255,191);
  stroke(255);
  noFill();
  box(200);
  paintRaces();
  debug();
  
  //pushMatrix();
  //noStroke();
  //scale(1,2.5,1);
  //textureSphere(5,5,5,img);
  //popMatrix();
  
  //translate(width/2, height/2, 0);
  

  //fill(204, 102, 0, 150);
  scene.drawTorusSolenoid();
}


/*void keyPressed() {
  if(scene.eye().frame().dampingFriction() == 0)
    scene.eye().frame().setDampingFriction(0.5);
  else
    scene.eye().frame().setDampingFriction(0);
  println("Camera damping friction now is " + scene.eye().frame().dampingFriction());
}*/