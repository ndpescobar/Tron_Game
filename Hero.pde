class Hero
{
  PVector loc, vel;
  boolean up, down, left, right, stop;

  Hero(PVector loc, PVector vel)
  {
    this.loc = loc;
    this.vel = vel;
    up = false;
    down = false;
    left = false;
    right = false;
    stop = false;
  }

  void run()
  {
    display();
    update();
    checkEdges();
    heroHitTest(new PVector(mouseX, mouseY));
  } 

  void display()
  {
    shapeMode(CENTER);
    pushMatrix();
    translate(loc.x, loc.y);
    fill(#708090);
    stroke(#00FFFF);
    rect(0, 0, wh, wh, 3);
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
    else if (stop == true)
    {
      vel.set(0, 0);
      loc.add(vel);
    }
  }

  void setDirection(int d)
  {
    up = false;
    down = false;
    left = false;
    right = false;
    stop = false;

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
    case 5:
      stop = true;  
      break;
    }
  }

  //one check for death
  void checkEdges()
  {
    if (loc.x > width-1 || loc.x < 1) {
      println("Hero is dead X");
      playGame = false;
    }
    if (loc.y > height-1 || loc.y < 71) {
      println("Hero is dead Y");
      playGame = false;
    }
  }

  void heroHitTest(PVector mouseLoc)
  {
    // 
    if (mouseLoc.x >= loc.x &&
      mouseLoc.x <= loc.x + 23 &&
      mouseLoc.y >= loc.y &&
      mouseLoc.y <= loc.x + 23)
    {
      println("mouse hits hero!");
    }
  }
}

//  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Move head according to direction set in keyPressed()
//    if ( millis() - peedDelay > 30 && moved) { //millis() - peedDelay > 100 &&
//      if (west)   body.get(0).loc.x -= blockSize/1.5;
//      if (east)   body.get(0).loc.x += blockSize/1.5;
//      if (north)  body.get(0).loc.y -= blockSize/1.5;
//      if (south)  body.get(0).loc.y += blockSize/1.5;
//      peedDelay = millis();
//      // move body to follow head
//      for (int i = heroBoids.size() - 1; i > 0 ; i--) {
//        //  let loc of segment equal loc of segment ahead
//        heroBoids.get(i).loc.x = heroBoids.get(i-1).loc.x;
//        heroBoids.get(i).loc.y = heroBoids.get(i-1).loc.y;
//      }
//    }
//    //  Add segments to player after addSegmentInterval
//    if (millis() - lastSegmentAdded > addSegmentInterval) {
//      addBodySegments(1);
//      lastSegmentAdded = millis();
//    }
