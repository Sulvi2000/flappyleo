PImage bg;
int bgx,bgyg, Vly;
void setup()
{
  size(800,800);
  bg= loadImage("escenario.png"); //la imagen tiene que ser de 1200 x 800
  leonel= loadImage("leonelprueba.png"); //personaje
  lx=100;
  ly=50;
  g=1; // gravedad
}
//bucle del escenario
void draw()
{
  setBg();
   image(leonel,lx,ly);
  ly=ly + Vly;
  Vly=Vly+g;
}
void keyPressed()
{
Vly=-15;
void setBg()
{
   image(bg, bgx, bgy);
 image(bg, bgx+bg.width,bgy);
 bgx=bgx-1; //velocidad del escenario
 if(bgx <-bg.width)
 {
   bgx=0; //reinicia el bucle
 }
}
  
