int xmax = 1200;
int ymax = 700;
PFont f;
int leftmargin = 100;
int topmargin = 150;
int linelength = xmax - leftmargin - 50;
int spacing = 150;
float line3y = topmargin + 3 * spacing;
float line2y = topmargin + 2 * spacing;
float line1y = topmargin + 1 * spacing;
float line0y = topmargin + 0 * spacing;
float boxheight = 10; // half box height
float boxlength = linelength / 10 / 2; // half box length
float box3center = 500.0;
float box2center = 400.0;
float box1center = 300.0;
float box3left;
float box2left;
float box1left;
float box3right;
float box2right;
float box1right;
float rho;
float rho3L;
float rho3R;
float rho2L;
float rho2R;
float rho1L;
float rho1R;
float rho0L;
float rho0R;
int botbez = 180;  // Bezier control point offset
int topbez = 80;  // Bezier control point offset

void setup() {
  size(1200, 700);
  background(255);
  rectMode(CORNERS);
  f = loadFont("SansSerif.plain-12.vlw");
  textFont(f, 12);
}

void draw() {
  background(255);
  line(leftmargin, line3y, leftmargin + linelength, line3y); // line 3
  line(leftmargin, line2y, leftmargin + linelength, line2y); // line 2
  line(leftmargin, line1y, leftmargin + linelength, line1y); // line 1
  line(leftmargin, line0y, leftmargin + linelength, line0y); // line 0
  
  box3left = box3center - boxlength;
  box3right = box3center + boxlength;
  rect(box3left, line3y-boxheight, box3right, line3y+boxheight);
  box2left = box2center - boxlength;
  box2right = box2center + boxlength;
  rect(box2left, line2y-boxheight, box2right, line2y+boxheight);
  box1left = box1center - boxlength;
  box1right = box1center + boxlength;
  rect(box1left, line1y-boxheight, box1right, line1y+boxheight);
  
  noFill();
 
  bezier(box3left,  line3y-boxheight, box3left,  line3y-boxheight-botbez, leftmargin,            line2y+topbez, leftmargin,            line2y);
  bezier(box3right, line3y-boxheight, box3right, line3y-boxheight-botbez, leftmargin+linelength, line2y+topbez, leftmargin+linelength, line2y);
  bezier(box2left,  line2y-boxheight, box2left,  line2y-boxheight-botbez, leftmargin,            line1y+topbez, leftmargin,            line1y);
  bezier(box2right, line2y-boxheight, box2right, line2y-boxheight-botbez, leftmargin+linelength, line1y+topbez, leftmargin+linelength, line1y);
  bezier(box1left,  line1y-boxheight, box1left,  line1y-boxheight-botbez, leftmargin,            line0y+topbez, leftmargin,            line0y);
  bezier(box1right, line1y-boxheight, box1right, line1y-boxheight-botbez, leftmargin+linelength, line0y+topbez, leftmargin+linelength, line0y);
  
  fill(0);
  
  rho3L = 0;
  rho3R = 23;
  rho = floor(rho3L);
  while (rho <= ceil(rho3R)) {
    line(leftmargin + rho * linelength / 23, line3y, leftmargin + rho * linelength / 23, line3y+10);
    textAlign(CENTER, CENTER);
    text(nf(rho, 0, 0), leftmargin + rho * linelength / 23, line3y+20);
    rho += 1;
  }
  
  rho2L = (box3left - leftmargin) * 23 / linelength;
  rho2R = (box3right - leftmargin) * 23 / linelength;
  rho = ceil(rho2L * 10) / 10.0;
  while (rho < ceil(rho2R * 10) / 10.0) {
    line(leftmargin + (rho-rho2L) * linelength / 2.3, line2y, leftmargin + (rho-rho2L) * linelength / 2.3, line2y+10);
    textAlign(CENTER, CENTER);
    text(nf(rho, 0, 1), leftmargin + (rho-rho2L) * linelength / 2.3, line2y+20);
    rho += 0.1;
  }
  
  rho1L = (box2left - leftmargin) * 2.3 / linelength + rho2L;
  rho1R = (box2right - leftmargin) * 2.3 / linelength + rho2L;
  rho = ceil(rho1L * 100) / 100.0;
  while (rho < ceil(rho1R * 100) / 100.0) {
    line(leftmargin + (rho-rho1L) * linelength / 0.23, line1y, leftmargin + (rho-rho1L) * linelength / 0.23, line1y+10);
    textAlign(CENTER, CENTER);
    text(nf(rho, 0, 2), leftmargin + (rho-rho1L) * linelength / 0.23, line1y+20);
    rho += 0.01;
  }

  rho0L = (box1left - leftmargin) * 0.23 / linelength + rho1L;
  rho0R = (box1right - leftmargin) * 0.23 / linelength + rho1L;
  rho = ceil(rho0L * 1000) / 1000.0;
  while (rho < ceil(rho0R * 1000) / 1000.0) {
    line(leftmargin + (rho-rho0L) * linelength / 0.023, line0y, leftmargin + (rho-rho0L) * linelength / 0.023, line0y+10);
    textAlign(CENTER, CENTER);
    text(nf(rho, 0, 3), leftmargin + (rho-rho0L) * linelength / 0.023, line0y+20);
    rho += 0.001;
  }

}

void mouseDragged() {
  if (line3y - 50 < mouseY && mouseY < line3y + 50) {
    box3center = mouseX;
  }
  if (line2y - 50 < mouseY && mouseY < line2y + 50) {
    box2center = mouseX;
  }
  if (line1y - 50 < mouseY && mouseY < line1y + 50) {
    box1center = mouseX;
  }
}
