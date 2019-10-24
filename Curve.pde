import java.util.*; 

class Curve {
  float cx, cy;
  float angle_x = 0;
  float angle_y = 0;
  float r;
  
  public static final int history = 120;
  
  List<PVector> path;
  
  Curve(float cx, float cy, float r, float phase) {
    this.cx = cx;
    this.cy = cy;
    this.angle_x = phase;
    this.angle_y = phase;
    this.r = r;
    colorMode(HSB);

    path = new ArrayList<PVector>();
  }
  
  void nextAngle(float delta_x, float delta_y) {
    this.angle_x += delta_x;
    this.angle_y += delta_y;
    float x = this.cx + this.r * cos(this.angle_x);
    float y = this.cy + this.r * sin(this.angle_y);
    
    this.path.add(new PVector(x, y));
    
    if (this.path.size() > Curve.history) {
      this.path = this.path.subList(1, Curve.history + 1);
    }
  }
  
  void draw() {
    strokeWeight(1);
    noFill();
    beginShape();
    for (int i = 0; i < this.path.size(); i++) {
      PVector vector = this.path.get(i);
      stroke((i % (255 * 1) / 1), 255, 255);
      vertex(vector.x, vector.y);
    }
    endShape();
    
    strokeWeight(5);
    PVector lastV = this.path.get(this.path.size() - 1);
    point(lastV.x, lastV.y);
  }
}
