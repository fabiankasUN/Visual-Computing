import java.awt.Color;

PImage img;
PImage i;

float f = 90;
int wheel = 0;

PGraphics mini;
PGraphics back;
PGraphics temp;

String renderer = P3D;


int x,y;

int w,h;

int mw,mh;

void setup() {
  w = 1200;
  h = 600;
  mw = 300;
  mh = 200;
  size(1200,600);
  surface.setResizable(true);
  mini = createGraphics(mw,mh);
  back = createGraphics(w,h);
  temp = createGraphics(w,h);
  img = loadImage("minimap.png");
  temp.beginDraw();
  temp.image(img,0,0,w,h);
  temp.endDraw();
}
   
public boolean debug = true;
public void debug(){
    if(debug){
      print( "wheel -->" + wheel + "\n");
      print( "x -->" + x + "\n");
      print( "y -->" + y + "\n");
      print("mouseX -->" +(mouseX- wheel/2)+"\t");
      print("mouseY -->" + (mouseY-wheel/2)+"\n");
      print("X: -50 + wheel/2 -->" + (mouseX -50 - wheel/2) + "\n");
      print("Y: -50 + wheel/2 -->" + (mouseY -50 - wheel/2) + "\n");
      print("size -->" + (100 + (wheel/2)*2) + "\n");
      print("x*4-wheel/2 -->" + (x*4+wheel/2) + "\n");
      print("y*3-wheel/2 -->" + (y*3+wheel/2) + "\n");
    }
}
   
void drawMini(){
  
  x = mouseX - 50 - wheel/2;
  y = mouseY - 50 - wheel/2;
  
 
  
  mini.beginDraw(); //<>//
  mini.noFill();
  mini.image(img,0,0,mw,mh);
  
  mini.pushMatrix();
  
  mini.translate(mouseX- wheel/2, mouseY-  wheel/2);
  debug();
  float c = 4*cos(radians(f));
  mini.rotate(c);
  mini.rect(-50 - wheel/2 ,-50 - wheel/2 ,100 + wheel*2,100+wheel*2);
  
  mini.popMatrix();
  
  mini.strokeWeight(2);
  mini.rect(0,0,mw,mh);
  
  
  mini.endDraw();
  
}

void drawBack(){
  back.beginDraw();
  //back.image(img,0,0,width, height);
  back.background(0);
  
  //back.translate(width/2, height/2);
  //float c = 4*cos(radians(f));
  //back.rotate(c);
  //back.copy(temp.get(),x*4+((wheel/2)*4), y*3+((wheel/2)*3),100*4 + (wheel/2*4), 100*3 + (wheel/2*3), 0,0, width, height );
  back.copy(temp.get(),(x - (wheel/2))*4, (y -(wheel/2))*3,(100+(wheel*2))*4, (100+(wheel*2))*3 , 0,0, width, height );
  //back.copy(temp.get(),x*5, y*5, 50*5, 50*5, 0-width/2, 0-height/2, width, height );
  /*back.translate(width/2, height/2);
  float c = 4*cos(radians(f));
  back.rotate(c);
  back.image(img, 0-width/2, 0-height/2, width, height);*/
  back.endDraw();
}

void draw() {
  
  if(mousePressed){
    //wheel = 0;
  }
  if (mousePressed && mouseButton == LEFT) {
       f+=0.5;
  }else
  if (mousePressed && mouseButton == RIGHT) {
       f-=0.5;
  }
  
 pushMatrix();
  stroke(0);
  strokeWeight(4);
  noFill();
  
  pushMatrix();
  
  temp.beginDraw();
  temp.translate(width/2, height/2);
  float c = 4*cos(radians(f));
  temp.rotate(c);
  temp.image(img,-width/2,-height/2,w,h);
  temp.endDraw();
  popMatrix();
  //print (wheel);
  // Rectangle shows area being copied
  drawBack();
  
  popMatrix();
  
  drawMini();
  
  image(back,0,0);
  image(mini,0,0);
  
  //rect(0, 0, 250, 130);
  //rect(-125, -65, 250, 130);

  }
  
  void mouseWheel( MouseEvent e){
    wheel+= -e.getCount();
    
  }
  
  
  /*void mousePressed() {
    if (mouseButton == LEFT) {
       rotate(PI/3.0);
    } else {
    }
}*/
    