class Hero
{

  PVector loc, vel;
  boolean up, down, left, right;

  Hero(PVector loc, PVector vel)
  {
    this.loc = loc;
    this.vel = vel;
    up = false;
    down = false;
    left = false;
    right = false;
  }

  void run()
  {
    display();
    update();
    checkEdges();
  } 

  void display()
  {
    imageMode(CENTER);
    pushMatrix();
    translate(loc.x, loc.y);
    fill(#00008B);
    stroke(#00FF00);
    rect(0, 0, 23, 23, 3);
    popMatrix();
  }

  void update()
  {
    if (up == true)
    {
      vel.set(0, -3);
      loc.add(vel);
    }
    else if (down == true)
    {
      vel.set(0, 3);
      loc.add(vel);
    }
    else if (left == true)
    {
      vel.set(-3, 0);
      loc.add(vel);
    }
    else if (right == true)
    {
      vel.set(3, 0);
      loc.add(vel);
    }
  }

  void setDirection(int d)
  {
    up = false;
    down = false;
    left = false;
    right = false;

    switch(d)
    {
    case 1:
      up = true;
      break;
    case 2: 
      down = true;
      break;
    case 3:
      left = true;
      break;
    case 4:
      right = true;
      break;
    }
  }

  //one check for death
  boolean checkEdges()
  {
    if (loc.x > width || loc.x < 0) {
      println("Hero is dead X");
      return true;
    }
    if (loc.y > height || loc.y < 0) {
      println("Hero is dead Y");
      return true;
    }
    return false;
  }
}

