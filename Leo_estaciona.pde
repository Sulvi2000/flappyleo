//VERSION 2

PImage bg , leonel,toppipe,bottompipe;
int bgx, bgy , lx,ly,g, Vly;
int[] pipeX,pipeY; //dos arreglos para las tuberías
int gamestate, puntos;
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
  }
}
//bucle del escenario
void draw()
{
  if(gamestate==-1)
  {
    inicio();
  }
 else if(gamestate==0)
  {
 
  setBg();
  setPipes();
  leonel();
  puntuacion();
 // inicio();
  }

  {
    fill(255);
    text("PERDISTE",20,100);
  }
}
 void puntuacion()
 
 {
   fill(0);
   textSize(32);
   text("Puntos:"+puntos,500,100);
 }
 void inicio()
 {
  image(bg,0,0);
  textSize(40);
  text("Leo en el estacionamiento",40,100);
  text("Click the mouse to begin",40,200);
  if(mousePressed)
  {
   ly=height/2;
   gamestate=0;
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
    if(lx > (pipeX[i]-75) && lx <pipeX[i] + 128) 
    {
      if (!(ly > pipeY [i] +382 && ly < pipeY[i] + (449+231-30)))
      {
      gamestate=1;
      } 
      else if (lx==pipeX[i] || lx == pipeX[i] + 1)
      {
        puntos ++;
      }
    }
  }
  }

 void leonel()
 {
  image(leonel,lx,ly);
  ly=ly + Vly;
  Vly=Vly+g;
  if ( ly>height || ly < 0)
  { 
    textSize(32);
    text("oh no Leonel estacionó mal...",120,400);
    gamestate=1;
  }
}

  void keyPressed() //codigo par saltitos uso keypressed nada () es espacio
  {
    Vly=-15;
    puntos=puntos+1;

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
  
