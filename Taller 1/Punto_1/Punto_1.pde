
  
PGraphics b;
PGraphics f;
int value = 0;
PImage img;
color actually;
boolean flag = false;
int cont = 0;
color c;
PImage mainImage;
int x,y;

void setup(){
  size(600,400);
  b = createGraphics(600, 400);
  f = createGraphics(30,30);
  img = loadImage("cubo.jpg");
  mainImage = img;
  image(img, 0, 0);
  
}

void draw(){
  
  int pixelLocation = mouseX + mouseY*img.width;
  float r1 = red(img.pixels[pixelLocation]);
  float g1 = green(img.pixels[pixelLocation]);
  float b1 = blue(img.pixels[pixelLocation]);
   
  if( flag == false ){
    image(img,0,0);
    c = color(r1, g1, b1); 
    fill(c);
    rect( mouseX,mouseY,50 ,50);
    c = color(r1,0, 0);
    fill(c);
    rect( mouseX+50, mouseY,40 ,15);
    c = color(0,g1, 0);
    fill(c);
    rect( mouseX+50, mouseY+15,40 ,15);
    c = color(0,0, b1);
    fill(c);
    rect( mouseX+50, mouseY+30,40 ,15);

  }
  if (mousePressed){
    f.beginDraw();
    if( cont == 0 ){
      actually = color(r1, g1, b1);
      fill(actually);
      image(img,0,0);
      x = mouseX;
      y = mouseY;
    }
    stroke(actually);
    line(mouseX,mouseY,x,y);
    img = get();
    cont++;
    x = mouseX;
    y = mouseY;
    //rect( mouseX, mouseY,50 ,50);
    
    flag = true;
  }else{
    flag = false;
    cont = 0;
  }
}