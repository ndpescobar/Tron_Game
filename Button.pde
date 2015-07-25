class Button 
{
  PVector loc;
  int w, h;
  String text;
  color c;

  Button(PVector location, int myWidth, int myHeight, String btnText)
  {
    loc = location;
    w = myWidth;
    h = myHeight;
    text = btnText;
    c = color(#00FF00);
  }

  void run()
  {
    display();
  }

  void display()
  {
    background(#B22222);
    fill(c);
    rect(loc.x, loc.y, w, h, 10);
    textSize(60);
    fill(#000080);
    text(text, loc.x + w/4, loc.y + h/2);
  }

  boolean buttonHitTest(PVector mouseLoc)
  {
    if (mouseLoc.x >= loc.x &&
      mouseLoc.x <= loc.x + w &&
      mouseLoc.y >= loc.y &&
      mouseLoc.y <= loc.x + h)
    {
      return true;
    } 
    else
      return false;
  }

  void setColor(color clr)
  {
    c = clr;
  }
}

