Food food1;
PlayerSnake player1;
PlayerSnake player2;

void setup() {
  size(800,800);
  frameRate(10);
  food1 = new Food();
  player1 = new PlayerSnake("Arrows",color(0,0,255));
  player2 = new PlayerSnake("WASD",color(255,0,0));
  player1.previousXArray = new int[100];
  player1.previousYArray = new int[100];
  player2.previousXArray = new int[100];
  player2.previousYArray = new int[100];
}

void draw() {
  noStroke();
  background(255);
  food1.display();
  player1.Controlls();
  player1.ControllType();
  player1.snakeTail1();
  player1.Eat();
  player2.ControllType();
  player2.Controlls();
  player2.snakeTail2();
  player2.Eat();
}
