class Trail extends Hero
{
  Trail(PVector loc, PVector vel)
  {
    super(loc, vel);
  }
  
  void run()
  {
    display();
    update();
    checkEdges();
    heroHitTest(new PVector(mouseX, mouseY));
    //fadeLastBoid();
  } 

  void display()
  {
    shapeMode(CENTER);
    pushMatrix();
    translate(loc.x, loc.y);
    fill(#C0C0C0);
    stroke(#00FFFF);
    rect(0, 0, wh, wh, 3);
    popMatrix();
  }
  
  void fadeLastBoid()
  {
    
  }
}

