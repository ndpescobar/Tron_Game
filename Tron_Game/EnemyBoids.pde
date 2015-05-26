class EnemyBoids
{
  PVector loc, vel;
  int r = 2;
  boolean dead = false;

  //Default constructor
  EnemyBoids()
  {
    this.loc = new PVector(width/2, height/2);
    this.vel = new PVector(random(-5, 5), random(-5, 5));
  } 

  EnemyBoids(PVector loc, PVector vel)
  {
    this.loc = loc;
    this.vel = vel;
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
    translate(loc.x + 25, loc.y + 25);
    fill(#FF00FF);
    stroke(150);
    ellipse(0, 0, 25, 25);
    popMatrix();
  }

  void update()
  {
    loc.add(vel);
  }

  void checkEdges()
  {
    if (loc.x > width) {
      loc.x = 0;
    }
    else if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    }
    else if (loc.y < 0) {
      loc.y = height;
    }
  }
  
//  boolean isDead()
//  {
//    //write here
//  }
}

