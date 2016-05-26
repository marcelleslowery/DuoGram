class QuadShape extends Shape {
  
  int x1, y1, x2, y2, x3, y3, x4, y4;
  int[] xver = new int[4];
  int[] yver = new int[4];
  int numVerts = 4;
  
  public QuadShape(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4) {
    xver[0] = x1; //for collision only
    xver[1] = x2;
    xver[2] = x3;
    xver[3] = x4;
    
    yver[0] = y1;
    yver[1] = y2;
    yver[2] = y3;
    yver[3] = y4;
    
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
    this.x4 = x4;
    this.y4 = y4;
    active = false;
  }
  
  boolean polyCol(int px, int py) { //Source: Jeff Thompson (see citation in DuoGram class header)
    boolean collision = false;
    for (int i = 0, j = numVerts - 1; i < numVerts; j = i++) {
      if ( ((yver[i]>py) != (yver[j]>py)) && (px < (xver[j]-xver[i]) * (py-yver[i]) / (yver[j]-yver[i]) + xver[i])) {
        collision = !collision;
      }
    }
    return collision;
  }
}
