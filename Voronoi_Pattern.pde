import megamu.mesh.*;
Voronoi myVoronoi;
float[][] points;
int counter = 0;
int numPoints = 200;
void setup() {
  size(4000, 2000);
  noSmooth();
  points = GeneratePoints(numPoints);
  myVoronoi = new Voronoi(points);
}
float[][] GeneratePoints(int numPoints) {
  float[][] points = new float[numPoints][2];
  float randnum1;
  float randnum2;
  for (int i = 0; i < numPoints; i++) {
      randnum1 = random(50, 3950);
      randnum2 = random(50, 1950);
      points[i][0] = randnum1;
      points[i][1] = randnum2;
  }
  return points;
}
void mousePressed() {
  counter = counter+1;
}
void draw() {
  MPolygon[] myRegions = myVoronoi.getRegions();
  for (int i=0; i<myRegions.length; i++) {
    float[][] regionCoordinates = myRegions[i].getCoords();
    stroke(0, 0, 0);
    strokeWeight(15);
    for (int k = 0; k < numPoints; k++) {
      point(points[k][0], points[k][1]);
    }
    if (counter > 1) {
      for (int j=0; j<myRegions.length; j++) {
        strokeWeight(5);
        float randR = random(0, 255);
        float randG = random(0, 255);
        float randB = random(0, 255);
        fill(randR, randG, randB);
        myRegions[i].draw(this); // draw this shape
      }
      noLoop();
    }
  }


  float[][] myEdges = myVoronoi.getEdges();
  if (counter > 0) {
    for (int i=0; i<myEdges.length; i++)
    {
      float startX = myEdges[i][0];
      float startY = myEdges[i][1];
      float endX = myEdges[i][2];
      float endY = myEdges[i][3];
      line( startX, startY, endX, endY );
    }
  }
}