/*
 * Creative Coding
 * Week 2, 04 - The Clocks!
 * Exercise 
 */

void setup() {
  size(600, 600);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}


void draw() {
  background(180);
  noStroke();

  int gridSize = 5;  // the number of rows and columns
  int margin = 40; // margin between the edges of the screen and the circles

  float gutter = 0; //distance between each cell REDUCED
  float cellsize = ( width - (2 * margin) - gutter * (gridSize - 1) ) / gridSize; // size of each circle

  int circleNumber = 0; // counter

  for (int i=0; i<gridSize; i++) { // column in y
    for (int j=0; j<gridSize; j++) { // row in x
      ++circleNumber;

      float tx = margin + cellsize/2  + (cellsize + gutter) * j;
      float ty = margin + cellsize/2  + (cellsize + gutter) * i;
      
      //if statement
      if (circleNumber % 2 == 0) { // works with modulus in case odd
      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      } else {
      movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      }
    }
  }
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("yourName.jpg");
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float endpointX = x + (size / 2) * cos(angle);
  float endpointY = y + (size / 2) * sin(angle);

 
  stroke(0);
  strokeWeight(1);
  fill(random(255), random(255), random(255));
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, endpointX, endpointY); // red line
}

void movingCircle2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float endpointX = x + (size / 2) * - cos(angle);// works with negative here
  float endpointY = y + (size / 2) *  sin(angle);
  
  
  stroke(0);
  strokeWeight(1);
  fill(random(255), random(255), random(255));
  rect(x, y, size, size); // rectangle

  stroke(255, 0, 0);
  strokeWeight(2);
  line(x, y, endpointX, endpointY); // red line
}