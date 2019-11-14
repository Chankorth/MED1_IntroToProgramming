class PlayerSnake {
  char Direction = 'n';
  int movementX;
  int movementY;
  int[] previousXArray;
  int[] previousYArray;
  String Controlls;
  int tailLength = 3;
  color snakeColor;
  int indexPosition = 0;
  int[] x = new int[50];
  int[] y = new int[50];
  int startingPosition = 40; 


  PlayerSnake(String _Controlls, color snake) {
    Controlls = _Controlls;
    snakeColor = snake;
  }



  void Controlls() {
    switch(Direction) {
    case 'n': 
      movementY -= 10; 
      break;
    case 'w': 
      movementX -= 10; 
      break;
    case 'e': 
      movementX += 10; 
      break;
    case 's': 
      movementY += 10; 
      break;
    }
  }


  void snakeTail1() {
    for (int tail = tailLength -1; tail > 0; tail --) {
      previousXArray[tail] = previousXArray[(tail - 1)];
      previousYArray[tail] = previousYArray[(tail - 1)];
    }
    previousXArray[0] = movementX;
    previousYArray[0] = movementY;
    previousXArray[tailLength +1] = width;
    previousYArray[tailLength +1] = height;
    for (int i = 0; i < tailLength; i ++) {
      fill(snakeColor);
      circle((width / 2) + previousXArray[i] + startingPosition, (height / 2) + previousYArray[i], 10);
      if (dist(movementX, movementY, previousXArray[i+1], previousYArray[i+1]) == 0) {
        exit();
      } 
    }
  }

  void snakeTail2() {
    x[indexPosition] = movementX;
    y[indexPosition] = movementY;
    for (int i = 0; i < tailLength; i++) { 
      if (dist(movementX, movementY, x[i], y[i]) == 0 && i != indexPosition && tailLength > 3) {
        //exit();
        println("hit");
      }
    }
    // Cycle between 0 and the number of elements
    indexPosition = (indexPosition + 1) % tailLength;
    for (int i = 0; i < tailLength; i++) {
      // Set the array position to read
      int pos = (indexPosition + i) % tailLength;
      fill(snakeColor);
      circle((width / 2) + x[pos] - startingPosition,(height / 2) + y[pos], 10);
    }
    
  }

  void ControllType() {
    if (Controlls == "Arrows") {
      if (key == CODED) {
        if (keyCode == UP && Direction != 's') {
          Direction = 'n';
        } else if (keyCode == LEFT && Direction != 'e') {
          Direction = 'w';
        } else if (keyCode == RIGHT&& Direction != 'w') {
          Direction = 'e';
        } else if (keyCode == DOWN && Direction != 'n') {
          Direction = 's';
        }
      }
    } else if (Controlls == "WASD") {
      if (key == 'w' && Direction != 's') {
        Direction = 'n';
      } else if (key == 'a' && Direction != 'e') {
        Direction = 'w';
      } else if (key == 'd' && Direction != 'w') {
        Direction = 'e';
      } else if (key == 's' && Direction != 'n') {
        Direction = 's';
      }
    }
  }
  void Eat() {
    if (dist((width / 2) + movementX + startingPosition, (height / 2) + movementY, food1.posX, food1.posY) == 0) {
      tailLength += 1;
      food1.posX = (int(random(0 + 10, width - 10))/10)*10;
      food1.posY = (int(random(0 + 10, height - 10))/10)*10;
    }
    if (dist((width / 2) + movementX - startingPosition, (height / 2) + movementY, food1.posX, food1.posY) == 0) {
      tailLength += 1;
      food1.posX = (int(random(0 + 10, width - 10))/10)*10;
      food1.posY = (int(random(0 + 10, height - 10))/10)*10;
    }
  }
  void collision() {
  
  }
}
