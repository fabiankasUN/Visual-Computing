public class Race{
 
  public ArrayList<Fish> fishes;
  public PImage texture;
  
  public Race( PImage image){
    fishes = new ArrayList<Fish>();
    this.texture = image;
  }
  
  
  public void addFish(){ 
    fishes.add( new Fish( texture , int( random( 10 )+2 ), int( random( 10 ) + 2 ) ) );
  }
  
  public void paintFishes(){  
    for( int i = 0; i < fishes.size(); i++ ){
      Fish tmpFish = fishes.get(i);
      tmpFish.paint();
    }
}
  
  
  
  
  
}