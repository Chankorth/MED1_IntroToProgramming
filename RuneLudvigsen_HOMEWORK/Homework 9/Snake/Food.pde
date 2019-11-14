class Food {
  int radius = 10;
  int posX = (int(random(0 + 10, width - 10))/10)*10;
  int posY = (int(random(0 + 10, height - 10))/10)*10;

  Food() {
  }

  void display() {
    fill(0);
    circle(posX, posY, radius);
  }
}
