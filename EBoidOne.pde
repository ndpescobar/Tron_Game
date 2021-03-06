class EBoidOne extends EnemyBoids
{
  EBoidOne(PVector loc, PVector vel)
  {
    super(loc, vel);
  }

  void display()
  {
    float theta = vel.heading2D() + radians(90);

    shapeMode(CENTER);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    fill(#FF6347);
    stroke(#FF0000);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
}

