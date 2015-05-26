class EBoidTwo extends EnemyBoids
{
  EBoidTwo(PVector loc, PVector vel)
  {
    super(loc, vel);
  }

  void display()
  {
    imageMode(CENTER);
    pushMatrix();
    translate(loc.x + 50, loc.y + 50);
    fill(#6A5ACD);
    stroke(#FF00FF);
    rect(0, 0, 18, 18, 5);
    popMatrix();
  }
}

