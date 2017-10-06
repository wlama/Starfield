Particle[] particles;
NormalParticle particle;
void setup()
{
  size(800, 500);
  background(0);
  particles = new Particle[1500];
  particles[0] = new OddballParticle();
  particles[1] = new JumboParticle();
  for (int i = 2; i < particles.length; i++) {
    particles[i] = new NormalParticle();
  }
}
void draw()
{   
  if (mousePressed == true) {
    for (int i = 2; i < particles.length; i++) {
      particles[0] = new OddballParticle();
      particles[1] = new JumboParticle();
      particles[i] = new NormalParticle();
    }
  }
  background(0);
  for (int i = 0; i < particles.length; i++) {
    particles[i].show();
    particles[i].move();
  }
}
class NormalParticle implements Particle
{
  double dX, dY, dSpeed, dTheta;
  int opacity;
  NormalParticle() {
    dX = mouseX;
    dY = mouseY;
    dSpeed = Math.random()*5;
    dTheta = Math.random()*2*Math.PI;
    opacity = 130;
  }
  public void move() {
    dX += Math.cos(dTheta) / dSpeed * 5;
    dY += Math.sin(dTheta) / dSpeed * 5;
  }
  public void show() {
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), opacity);
    noStroke();
    ellipse((float)dX, (float)dY, 20, 20);
    opacity--;
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle//uses an interface
{
  double dX, dY, dSpeed, dTheta;
  int opacity;
  OddballParticle() {
    dX = mouseX;
    dY = mouseY;
    dSpeed = Math.random()*2;
    dTheta = Math.random()*2*Math.PI;
    opacity = 210;
  }
  public void move() {
    dX += Math.cos(dTheta) * dSpeed;
    dY += Math.sin(dTheta) * dSpeed;
  }
  public void show() {
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), opacity);
    noStroke();
    rect((float)dX, (float)dY, 20, 20);
    opacity--;
  }
}
class JumboParticle extends OddballParticle
{
  public void show() {
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), opacity);
    noStroke();
    ellipse((float)dX, (float)dY, 40, 40);
    opacity--;
  }
}