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
    fill(#00008B);
    stroke(#00FF00);
    rect(0, 0, 23, 23, 3);
    popMatrix();
  }
  
  void fadeLastBoid()
  {
    
  }
}

