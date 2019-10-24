import java.util.*; 

float angle = 0;
float angle_delta_coeff = 0.5;
float angle_delta = 2 * PI / Curve.history / angle_delta_coeff;

int s_w = 200;
int s_h = 200;

int cols = 1000 / s_w - 1;
int padding = 10;
float r = (s_w - padding) / 2.0;

Curve[][] curves = new Curve[cols][cols];

void setup() {
  size(1000, 1000, P2D);
  
  for (int i = 1; i <= cols; i++) {
    float cx = i * s_w + s_w / 2;
    for (int j = 1; j <= cols; j++) {
      float cy = j * s_h + s_h / 2;
      curves[i - 1][j - 1] = new Curve(cx, cy, r, 0);
    }
  }

}

void draw() {
  background(0);
  stroke(255);
  noFill();
  
  for (int i = 1; i <= cols; i++) {
    float cx = s_w / 2;
    float cy = i * s_h + s_h / 2;
    stroke(255);
    strokeWeight(1);
    ellipse(cx, cy, r * 2, r * 2);
    
    float x = cx + r * cos(angle * i * angle_delta_coeff);
    float y = cy + r * sin(angle * i * angle_delta_coeff);
    strokeWeight(5);
    point(x, y);
    
    stroke(255, 50);
    strokeWeight(1);
    line(0, y, width, y);
  }
  
  for (int i = 1; i <= cols; i++) {
    float cx = i * s_w + s_w / 2;
    float cy = s_h / 2;
    stroke(255);
    strokeWeight(1);
    ellipse(cx, cy, r * 2, r * 2);
    
    float x = cx + r * cos(angle * i * angle_delta_coeff);
    float y = cy + r * sin(angle * i * angle_delta_coeff);
    strokeWeight(5);
    point(x, y);
    
    stroke(255, 50);
    strokeWeight(1);
    line(x, 0, x, height);
  }

  stroke(255);
   
  for (int i = 1; i <= cols; i++) {
    float delta_x = angle_delta * i * angle_delta_coeff;
    for (int j = 1; j <= cols; j++) {
      float delta_y = angle_delta * j * angle_delta_coeff;
      curves[i - 1][j - 1].nextAngle(delta_x, delta_y);
      curves[i - 1][j - 1].draw();
    }
  }
  angle += angle_delta;
}
