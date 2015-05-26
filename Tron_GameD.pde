import java.util.*;
int timeLapse;
ArrayList<EnemyBoids> enemyGOs;
Hero h;

void setup()
{
  size(1200, 900);
  background(#00FF00);
  loadInits();
}

void draw()
{

  background(#2F4F4F);

  for (int i = 0; i < enemyGOs.size(); i++) {
    enemyGOs.get(i).run();
  }
  h.run();
  //checkEBoids();
}

void loadInits()
{
  timeLapse = millis();
  enemyGOs = new ArrayList<EnemyBoids>();
  h = new Hero(new PVector(width-200, height-200), 
  new PVector(random(0, 0), random(0, 0)));
  createGOs("E1", 21);
  createGOs("E2", 3);
}

void createGOs(String name, int n)
{
  if (name.equals("E1"))
  {
    for (int i = 0; i < n; i++)
    {
      enemyGOs.add(new EBoidOne(new PVector(random(10, 300), random(10, 300)), 
      new PVector(random(-2, 2), random(-2, 2))));
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
  } 
  else if (keyCode == 'S')
  {
    h.setDirection(2);
  }
  else if (keyCode == 'A')
  {
    h.setDirection(3);
  }
  else if (keyCode == 'D')
  {
    h.setDirection(4);
  }
}

