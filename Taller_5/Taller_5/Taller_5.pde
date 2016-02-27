import java.io.PrintStream;

TuringMorph turing;
int map[][];
int n,m;
PImage img;


Color randomColor(){
  return new Color((int)random(255),(int)random(255),(int)random(255));
}

void randomT(){
  
  float Da = random(30);
  float Db = random(30);
  float t1 = random(20);
  float t2 = random(20);
  int ca= 1+(int)(random(5)),cb = 1+(int)(random(5));
  int k = (int)(random(1));
  turing = new TuringMorph(300,300, randomColor(), randomColor(), Da, Db, 12, 16, ca, cb, k);
  turing.solve(3000);
  map = turing.transform();
}

void setup(){
  size(300,300);
  //turing = new TuringMorph(150,150, new Color(255,70,50), new Color(50,120,255), 1.6, 6, 12, 16, 3, 3, 0);
  //turing.solve(10000);
  //map = turing.transform();
  img = loadImage("pez2.png");
  for( int i = 0; i < 50; i++ ){
    randomT();
    turing();
    image(img,0,0,300,300);
    save("pez" + i + ".jpg");
  
  }
  
}


void turing(){
  
  int n = map.length;
  m = map[0].length;
  img.loadPixels();
  for( int i = 0 ; i < n; i++ ){
    for( int j = 0 ; j < m; j++ ){
      //Color c = turing.getColor(i,j,map);
      img.pixels[i*m + j] = turing.getColor(i, j, map);
    }
  }
  img.updatePixels();
  
}

void draw(){
  background(0);
  
  //image(img,0,0,600,400);
  
  
  
  


}