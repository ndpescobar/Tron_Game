class EBoidTwo extends EnemyBoids
{
  EBoidTwo(PVector loc, PVector vel)
  {
    super(loc, vel);
  }

  void display()
  {
    shapeMode(CENTER);
    pushMatrix();
    translate(loc.x + 50, loc.y + 50);
    fill(#FA8072);
    stroke(#FF0000);
    rect(0, 0, 16, 16, 5);
    popMatrix();
  }
  
  //void spawnEOne()
  //{
  //  
  //}
}

