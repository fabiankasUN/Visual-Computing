import java.awt.Color;
import java.io.Serializable;
import java.util.Random;

public class TuringMorph implements Serializable{

  private int height;
  private int width;
  private double CA, CB;
  private double nextA[][], nextB[][];
  private int res[][];
  private int colours[];
  private Color a = Color.blue;
  private Color b = Color.black;
  private int chunk;
  private double x1, x2;
  private int chunkA, chunkB;

  private double high = Double.NEGATIVE_INFINITY;
  private double low = Double.POSITIVE_INFINITY;

  public TuringMorph(int width, int height, Color a, Color b, float CA,
      float CB, float x1, float x2, int chunkA, int chunkB, int flag) {
    this.height = height;
    this.width = width;
    this.a = a;
    this.b = b;
    this.CA = CA;
    this.CB = CB;
    this.x1 = x1;
    this.x2 = x2;
    this.chunkA = chunkA;
    this.chunkB = chunkB;
    nextA = new double[width][height];
    nextB = new double[width][height];
    res = new int[width][height];
    randomize();
    if (flag == 0)
      setColors();
    else if (flag == 1)
      setColors2();
    else
      setColors3();
  }

  /*
   * public void swap() { double[][] temp = tempA; tempA = nextA; nextA =
   * temp; temp = tempB; tempB = nextB; nextB = temp; }
   */

  /*
   * public void solve(int iterative) { int n, i, j, iplus1, iminus1, jplus1,
   * jminus1; double DiA, ReA, DiB, ReB;
   * 
   * int chunk = 10; for (n = 0; n < iterative; ++n) { for (i = 0; i < width;
   * ++i) { iplus1 = i + 1; iminus1 = i - 1; if (i == 0) iminus1 = width - 1;
   * if (i == width - 1) iplus1 = 0;
   * 
   * for (j = 0; j < height; ++j) { jplus1 = j + 1; jminus1 = j - 1; if (j ==
   * 0) jminus1 = height - 1; if (j == height - 1) jplus1 = 0;
   * 
   * DiA = CA (nextA[iplus1][j] - 2.0 * nextA[i][j] + nextA[iminus1][j] +
   * nextA[i][jplus1] - 2.0 * nextA[i][j] + nextA[i][jminus1]);
   * 
   * ReA = nextA[i][j] * nextB[i][j] - nextA[i][j] - 12.0; double temp =
   * nextA[i][j]; nextA[i][j] = nextA[i][j] + 0.01 * (ReA + DiA);
   * 
   * if (nextA[i][j] < 0.0) nextA[i][j] = 0.0;
   * 
   * DiB = CB (nextB[iplus1][j] - 2.0 * nextB[i][j] + nextB[iminus1][j] +
   * nextB[i][jplus1] - 2.0 * nextB[i][j] + nextB[i][jminus1]); ReB = 16.0 -
   * temp * nextB[i][j]; nextB[i][j] = nextB[i][j] + 0.01 * (ReB + DiB); if
   * (nextB[i][j] < 0.0) nextB[i][j] = 0.0; } } } }
   */

  public void solve(int iterative) {
    int n, i, j, iplus1, iminus1, jplus1, jminus1;
    double DiA, ReA, DiB, ReB;
    chunk = chunkA;

    for (n = 0; n < iterative; ++n) {
      high = Double.NEGATIVE_INFINITY;
      low = Double.POSITIVE_INFINITY;
      for (i = 0; i < width; i += chunk) {
        iplus1 = i + chunk;
        iminus1 = i - chunk;
        if (i < chunk)
          iminus1 = width - chunk;
        if (i + chunk >= width)
          iplus1 = 0 + chunk;

        for (j = 0; j < height; j += chunk) {
          jplus1 = j + 1;
          jminus1 = j - 1;
          if (j < chunk)
            jminus1 = height - chunk;
          if (j + chunk >= height)
            jplus1 = 0 + chunk;
          for (int k = 0; k < chunk; k++) {
            for (int l = 0; l < chunk; l++) {
              if (i + k < width && j + l < height) {
                DiA = CA
                    * (nextA[iplus1][j + l] - 2.0
                        * nextA[i + k][j + l]
                        + nextA[iminus1][j + l]
                        + nextA[i + k][jplus1] - 2.0
                        * nextA[i + k][j + l] + nextA[i
                        + k][jminus1]);

                ReA = nextA[i + k][j + l] * nextB[i + k][j + l]
                    - nextA[i + k][j + l] - x1;
                double temp = nextA[i + k][j + l];
                nextA[i + k][j + l] = nextA[i + k][j + l]
                    + 0.01 * (ReA + DiA);

                if (nextA[i + k][j + l] < 0.0)
                  nextA[i + k][j + l] = 0.0;

                DiB = CB
                    * (nextB[iplus1][j + l] - 2.0
                        * nextB[i + k][j + l]
                        + nextB[iminus1][j + l]
                        + nextB[i + k][jplus1] - 2.0
                        * nextB[i + k][j + l] + nextB[i
                        + k][jminus1]);

                ReB = x2 - temp * nextB[i + k][j + l];

                nextB[i + k][j + l] = nextB[i + k][j + l]
                    + 0.01 * (ReB + DiB);

                if (nextB[i + k][j + l] < 0.0)
                  nextB[i + k][j + l] = 0.0;

                if (nextA[i + k][j + l] > high) {
                  high = nextA[i + k][j + l];
                } else if (nextA[i + k][j + l] < low) {
                  low = nextA[i + k][j + l];
                }
              }

            }
          }

        }
      }
    }
  }

  public void randomize() {
    Random rand = new Random();
    chunk = chunkB;
    for (int i = 0; i < width; i += chunk) {
      for (int j = 0; j < height; j += chunk) {
        double a = rand.nextDouble() * 12.0 + rand.nextGaussian() * 2.0;
        double b = rand.nextDouble() * 12.0 + rand.nextGaussian() * 2.0;
        for (int k = 0; k < chunk; k++) {
          for (int l = 0; l < chunk; l++) {
            if (i + k < width && j + l < height) {
              nextA[i + k][j + l] = a;
              nextB[i + k][j + l] = b;
            }
          }
        }
      }
    }
  }

  /*
   * public void randomize() { Random rand = new Random(); int chunk = 10; for
   * (int i = 0; i < width; ++i) { for (int j = 0; j < height; ++j) {
   * nextA[i][j] = rand.nextDouble() * 12.0 + rand.nextGaussian() 2.0;
   * nextB[i][j] = rand.nextDouble() * 12.0 + rand.nextGaussian() 2.0; } } }
   */

  public int[] getColours() {
    return colours;
  }

  public int[][] transform() {
    int i, j;

    for (i = 0; i < width; ++i) {
      for (j = 0; j < height; ++j) {
        int scaled = (int) ((nextA[i][j] - low) * 255.0 / (high - low));
        scaled = Math.max(0, Math.min(255, scaled));
        res[i][j] = scaled;
      }
    }
    return res;
  }

  private int scale(int i, int lo, int hi) {
    Random r = new Random();
    return lo + (hi - lo) * i / 255;
  }

  public void setColors() {
    colours = new int[256];
    int Rlo = a.getRed();
    int Glo = a.getGreen();
    int Blo = a.getBlue();
    int Rhi = b.getRed();
    int Ghi = b.getGreen();
    int Bhi = b.getBlue();
    for (int i = 0; i < 256; ++i) {
      colours[i] = scale(i, Rlo, Rhi) << 16 | scale(i, Glo, Ghi) << 8
          | scale(i, Blo, Bhi);
    }
    
    /*for (int i = 1; i < colours.length; i++) {
      colours[i] |= colours[i - 1];
    }*/
  }

  public void setColors2() {
    colours = new int[256];
    int Rlo = a.getRed();
    int Glo = a.getGreen();
    int Blo = a.getBlue();
    int Rhi = b.getRed();
    int Ghi = b.getGreen();
    int Bhi = b.getBlue();
    for (int i = 0; i < 256; ++i) {
      colours[i] = scale(i, Rlo, Rhi) << 16 | scale(i, Glo, Ghi) << 8
          | scale(i, Blo, Bhi);
    }
    for (int i = 2; i < colours.length; i++) {
      colours[i] |= colours[i - 1] + colours[i - 2];
    }
  }

  public void setColors3() {
    colours = new int[256];
    int Rlo = a.getRed();
    int Glo = a.getGreen();
    int Blo = a.getBlue();
    int Rhi = b.getRed();
    int Ghi = b.getGreen();
    int Bhi = b.getBlue();
    for (int i = 0; i < 256; ++i) {
      colours[i] = scale(i, Rlo, Rhi) << 16 | scale(i, Glo, Ghi) << 8
          | scale(i, Blo, Bhi);
    }
    for (int i = 2; i < colours.length; i++) {
      colours[i] ^= colours[i - 1];
    }
  }
  
  public int getColor( int vx, int vy, int res[][] ){
    return colours[res[vx][vy]];
  }
  
  
  
  

}