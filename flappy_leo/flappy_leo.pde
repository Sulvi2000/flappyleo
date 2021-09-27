PImage bg;
int bgx, bgy;
void setup()
{
  size(800,800);
  bg= loadImage("escenario.png"); //la imagen tiene que ser de 1200 x 800
  
}
//bucle del escenario
void draw()
{
  setBg();
}
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
  
