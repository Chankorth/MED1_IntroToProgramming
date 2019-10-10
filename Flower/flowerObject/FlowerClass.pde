class Flower {
  
 // Variables
 
 float r;       // radius of the flower petal
 int n_petals;  // number of petals 
 float x;       // x-position of the center of the flower
 float y;       // y-position of the center of the flower
 int petalColor;//hexadecimal number for the color of petals
 float bounceX;
 float bounceY;
 boolean bounceBack;
 float bounceHeight;
 float curve = 10;
 float Speed;
 
 
Flower( float temp_x, float temp_y, float temp_r, int temp_n_petals, int temp_petalColor, float temp_bounceHeight) {
  r = temp_r;
  n_petals = temp_n_petals;
  x = temp_x;
  y = temp_y;
  Speed = x;
  bounceY = y;
  petalColor = temp_petalColor;
  bounceHeight = temp_bounceHeight;
}

void display () {
  
  
  float ballX;
  float ballY;
  
  fill(petalColor);
  
  for (float i = 0 ; i < PI * 2 ; i += 2 * PI / n_petals) {
  ballX = Speed + r * cos(i);
  ballY = bounceY + r * sin(i);
  ellipse(ballX, ballY, r, r); 
  }
  
  fill(200, 0, 0);
  ellipse(Speed, bounceY, r * 1.2, r * 1.2);
  
}

void Bounce(float bouncyness) {  
  if (bounceY < (bounceHeight + (bouncyness/2)) && bounceY > bounceHeight + bouncyness/6) {
    curve = 6;
  } else if (bounceY < bounceHeight + bouncyness/6) {
    curve = 3;
  } else {
    curve = 10;
  }
  
  if (bounceHeight >= height) {
    bounceHeight = height/2;
  }
  
  if (bounceY < height && !bounceBack) {
     bounceY += curve;
  } else if (bounceY >= height && !bounceBack) {
    bounceBack = true;
    bounceY = 600;
    bounceHeight = bounceHeight + bouncyness;
  } else if (bounceY > bounceHeight && bounceBack) {
    bounceY -= curve;
  } else if (bounceY <= bounceHeight && bounceBack) {
    bounceY = bounceHeight;
    bounceBack = false;
  }
}

void Velocity(float velocity) {
  if (bounceY < map(1,0,2,bounceHeight,height)) {
      Speed += velocity;  
  } else {
     Speed += velocity/2;
  }
  if (Speed > width) {
    Speed = -0;  }
}

}
