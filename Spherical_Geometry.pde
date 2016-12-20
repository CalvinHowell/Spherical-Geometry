import peasy.*;

PeasyCam cam;
//Vector for sphere
PVector[] [] globe;
//holds total
int total = 100;


void setup() {
  //size of "window"
  size(600, 600, P3D);
  //ability to rotate/zoom the 3D Vector
  cam = new PeasyCam(this, 500);
  //change color mode for "hu"
  colorMode(HSB);

  globe = new PVector[total+1][total+1];
}








void draw() {
  background(0);
  fill(255);
  lights();
  //radius of sphere
  float r = 200;
  //loop total for latitude points of sphere
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    //loop total for longitude points of sphere
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, -PI, PI);
      //formula to create a sphere
      float x = r * sin(lon) * cos(lat);
      float y = r * sin(lon) *sin(lat);
      float z = r * cos(lon);
      //put it together
      globe[i][j] = new PVector(x, y, z);
      //crazy wibble wobble effect
      PVector v = PVector.random3D();
      v.mult(50);
      globe[i][j].add(v);
    }
  }






  for (int i = 0; i < total; i++) {

    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      //create color pattern
      float hu = map(i, 0, total, 0, 225);
      //every color that is modulor 255
      fill(hu %225, 255, 255);
      //latitude points
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      //longitude points
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}