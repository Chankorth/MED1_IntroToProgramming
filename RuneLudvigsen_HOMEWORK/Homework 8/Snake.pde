int tailLength = 7;
char Direction = 'n';
int movementX;
int movementY;
int[] previousXArray;
int[] previousYArray;

void setup() {
size(400,400);
frameRate(5);
    previousXArray = new int[100];
    previousYArray = new int[100];
}

void draw() {
  noStroke();
  background(255);
  direction();
  snakeTail();

}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      Direction = 'n';
    } else if (keyCode == LEFT) {
      Direction = 'w';
    } else if (keyCode == RIGHT) {
      Direction = 'e';
    } else if (keyCode == DOWN) {
      Direction = 's';
    }
  }
}

void direction() {
  switch(Direction) {
    case 'n': movementY -= 10; break;
    case 'w': movementX -= 10; break;
    case 'e': movementX += 10; break;
    case 's': movementY += 10; break;
  }
}

void snakeTail() {
  for(int tail = tailLength -1 ;tail > 0; tail --) {
    previousXArray[tail] = previousXArray[(tail - 1)];
    previousYArray[tail] = previousYArray[(tail - 1)];
  }
  previousXArray[0] = movementX;
  previousYArray[0] = movementY;
  for(int i = 0; i < tailLength; i ++) {
    fill(0, (255/(i+1)));
    circle((width / 2) + previousXArray[i],(height / 2) + previousYArray[i],10);
  }
}
