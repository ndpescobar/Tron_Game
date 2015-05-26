class EBoidOne extends EnemyBoids
{
  EBoidOne(PVector loc, PVector vel)
  {
    super(loc, vel);
  }

  void display()
  {
    float theta = vel.heading2D() + radians(90);

    imageMode(CENTER);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    fill(#008080);
    stroke(#7CFC00);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
}

