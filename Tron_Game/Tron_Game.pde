import java.util.*;
int timeLapse;
boolean playGame;
ArrayList<EnemyBoids> enemyGOs;
ArrayList<Trail> heroBoids;
InfoUI iui;
Hero h;
Button butt;

void setup()
{
  size(1200, 900);
  background(#00FF00);
  loadInits();
}

void draw()
{
  background(#2F4F4F);
  //fill(20, 60, 80, 255);
  //rect(0,0,1200,900);
  if (playGame)
  {
    for (int i = 0; i < enemyGOs.size(); i++)
    {
      enemyGOs.get(i).run();
    }
    h.run();
    for (int i = 0; i < heroBoids.size(); i++)
    {
      heroBoids.get(i).run();
    }
    iui.run();
  }
  else
  {
    butt.run();
  }

  //checkEBoids();
}

void loadInits()
{
  timeLapse = millis();
  playGame = true;
  enemyGOs = new ArrayList<EnemyBoids>();
  heroBoids = new ArrayList<Trail>(4);
  h = new Hero(new PVector(width-200, height-200), 
  new PVector(random(0, 0), random(0, 0)));
  iui = new InfoUI();
  createGOs("E1", 21);
  createGOs("E2", 3);
  createGOs("HB", 4);
  butt = new Button(new PVector(width/4, height/4), 650, 200, "Don't Touch MY BOOTY!");
}

void createGOs(String name, int n)
{
  if (name.equals("E1"))
  {
    for (int i = 0; i < n; i++)
    {
      enemyGOs.add(new EBoidOne(new PVector(random(10, 300), random(10, 300)), 
      new PVector(random(-2, 2), random(-2, 2))));
      println("E1 spawned");
    }
  }
  if (name.equals("E2"))
  {
    for (int i = 0; i < n; i++)
    {
      enemyGOs.add(new EBoidTwo(new PVector(random(10, 300), random(10, 300)), 
      new PVector(random(-2, 2), random(-2, 2))));
      println("E2 spawned");
    }
  }
  if (name.equals("HB"))
  {
    for (int i = 0; i < n; i++)
    {
      heroBoids.add(new Trail(new PVector(width-177, height-177), 
      new PVector(random(0, 0), random(0, 0))));
      println("HB spawned");
    }
  }
}

//void checkEBoids()
//{
//
//  if (enemyGOs.size() > 0) {
//    for (int i = enemyGOs.size()-1; i >= 0; i--) {
//      if (enemyGOs.get(i).isDead())  enemyGOs.remove(i);
//    }
//    println("enemyGOs size = " + enemyGOs.size());
//  }
//  // if(boids.size() <= 0) makeboids
//}

void keyPressed()
{
  if (keyCode == 'W')
  {
    h.setDirection(1);
    for (int i = 0; i < heroBoids.size(); i++)
    {
      heroBoids.get(i).setDirection(1);
    }
  } 
  else if (keyCode == 'S')
  {
    h.setDirection(2);
    for (int i = 0; i < heroBoids.size(); i++)
    {
      heroBoids.get(i).setDirection(2);
    }
  }
  else if (keyCode == 'A')
  {
    h.setDirection(3);
    for (int i = 0; i < heroBoids.size(); i++)
    {
      heroBoids.get(i).setDirection(3);
    }
  }
  else if (keyCode == 'D')
  {
    h.setDirection(4);
    for (int i = 0; i < heroBoids.size(); i++)
    {
      heroBoids.get(i).setDirection(4);
    }
  }
  else if (keyCode == ' ')
  {
    h.setDirection(5);
    for (int i = 0; i < heroBoids.size(); i++)
    {
      heroBoids.get(i).setDirection(5);
    }
  }
}

void mouseMoved()
{
  if (butt.buttonHitTest(new PVector(mouseX, mouseY)))
  {
    butt.setColor(color(#00FA9A));
  } 
  else
    butt.setColor(color(#00FF00));
}

void mousePressed()
{
  if (butt.buttonHitTest(new PVector(mouseX, mouseY)))
  {
    gameReset();
  }
}

void gameReset()
{
  loadInits();
}

