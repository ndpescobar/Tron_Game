import java.util.*;
int timeLapse;
boolean playGame;
ArrayList<EnemyBoids> enemyGOs;
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
    iui.run();
  }else
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
  h = new Hero(new PVector(width-200, height-200), 
      new PVector(random(0, 0), random(0, 0)));
  iui = new InfoUI();
  createGOs("E1", 21);
  createGOs("E2", 3);
  butt = new Button(new PVector(width/2, height/2), 650, 200, "Don't Touch MY BOOTY!");
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
  else if (keyCode == ' ')
  {
    h.setDirection(5);
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
  playGame = true;
  timeLapse = millis();
}

void isGameOver()
{
  if(playGame = false)
  {
    for(int i = enemyGOs.size()-1; i >= 0; i--)
    {
      enemyGOs.remove(i);
    }
  h = new Hero(new PVector(width-200, height-200), 
      new PVector(random(0, 0), random(0, 0))); 
  }
}

