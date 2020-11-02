//your code here
Particle [] dots;
void setup()
{
  size(500,500);
  dots = new Particle[1000];
  for (int i = 0; i < dots.length; i++){
    dots[i] = new Particle();
    dots[i].X = dots[i].Y = 250;
  }
  dots[0] = new OddballParticle();
  dots[0].X = dots[0].Y = 250;
}
void draw()
{
  background(0);
  for (int i = 0; i < dots.length; i++){
     dots[i].move();
     dots[i].show();
  }
}
void mousePressed()
{
  dots = new Particle[1000];
  for (int i = 0; i < dots.length; i++){
    dots[i] = new Particle();
  }
  dots[0] = new OddballParticle();
}
class Particle
{
  double X, Y, speed, angle; int Color;
  Particle(){
    X = mouseX; Y = mouseY;
    angle = Math.random() * 2 * Math.PI;
    speed = Math.random() * 10; 
    Color = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move(){
    X += Math.cos(angle) * speed; Y += Math.sin(angle) * speed;
  }
  void show(){
    fill(Color);
    ellipse((float)X, (float)Y, 7, 7);
  }
}

class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle(){
    X = mouseX; Y = mouseY;
    speed = Math.random() * 10 + 3;
  }
  void move(){
    angle = Math.random() * 2 * Math.PI;
    X += Math.cos(angle) * speed; Y += Math.sin(angle) * speed;
  }
  void show(){
    Color = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256)); fill(Color);
    ellipse((float)X, (float)Y, 60, 60);
  }
}
