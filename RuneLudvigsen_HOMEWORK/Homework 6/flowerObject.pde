Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;

void setup() {
  size(800,600);
  background(#43AF76);
  frameRate(30);
  myFlower1 = new Flower(0,50,20,4, color(240,100,70),50);
  myFlower2 = new Flower(0,100,30,5, color(70,240,100),100);
  myFlower3 = new Flower(0,150,40,6, color(100,70,240),150);
}

void draw(){
  background(#43AF76);
  myFlower1.Bounce(100);
  myFlower1.Velocity(3);
  myFlower1.display();
  myFlower2.Bounce(75);
  myFlower2.Velocity(2);
  myFlower2.display();
  myFlower3.Bounce(50);
  myFlower3.Velocity(1);
  myFlower3.display();
  
}
