//VERSION 2

PImage bg , leonel,toppipe,bottompipe;
int bgx, bgy , lx,ly,g, Vly;
int[] pipeX,pipeY; //dos arreglos para las tuberías
int gamestate;
void setup()
{
  size(800,800);
  bg= loadImage("FONDO1.png"); //la imagen tiene que ser de 1200 x 800
  leonel= loadImage("leo.png"); //personaje
  toppipe= loadImage("tube1.png");
  bottompipe=loadImage("tube2.png");
  lx=100;
  ly=50;
  g=1; // gravedad
  pipeX=new int[4]; //cantidad de tubos
  pipeY=new int[pipeX.length];
  for(int i = 0; i<pipeX.length; i++)
  {
    pipeX[i]=width+200*i;
    pipeY[i]=(int)random(-350,0);
    pipeX[i]--;
  }
  
}
//bucle del escenario
void draw()
{
  if(gamestate ==0)
  {
  setBg();
  setPipes();
  leonel();
  }
  else
  {
    text("PERDISTE",20,100);
  }
}
 void setPipes()
 {
  
  for(int i = 0; i< pipeX.length; i++)
  {
  image(toppipe,pipeX[i],pipeY[i]);
  image(bottompipe,pipeX[i],pipeY[i]+680);
  pipeX[i]-=2;
  if(pipeX[i] <-200)
  {
    pipeX[i]=width;
  }
    if(lx > pipeX[i]-35 && lx <pipeX[i] + 92) 
    {
      if (!(ly > pipeY [i] +499 && ly < pipeY[i] + 499-49))
      {
      gamestate=1;
      } 
    }
  }
  }

 void leonel()
 {
  image(leonel,lx,ly);
  ly=ly + Vly;
  Vly=Vly+g;
 }
  void keyPressed() //codigo par saltitos uso keypressed nada () es espacio
  {
    Vly=-15;
    gamestate=1;
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
  
