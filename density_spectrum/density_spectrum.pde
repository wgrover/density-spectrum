int xmax = 1200;
int ymax = 900;
PFont f;
PFont fbold;
PFont fbig;
int leftmargin = 100;
int topmargin = 150;
int linelength = xmax - leftmargin - 50;
int spacing = 220;
float line3y = topmargin + 3 * spacing;
float line2y = topmargin + 2 * spacing;
float line1y = topmargin + 1 * spacing;
float line0y = topmargin + 0 * spacing;
float topboxheight = 145;
float botboxheight = 5;
float boxlength = linelength / 10 / 2; // half box length
float box3center = 167;
float box2center = 450;
float box1center = 642;
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
int botbez = 75;  // Bezier control point offset
int topbez = 75;  // Bezier control point offset

//String[] materials = {"Platinum", "Osmium", "Water", "Heavy water", "Asbestos"};
//float[] densities = {22.0, 23.0, 1.0, 1.1, 12.3};

String[] materials = new String[1000];
float[] densities = new float[1000];
String[] filein;
int materials_length = 0;

void setup() {
  size(1200, 900);
  background(255);
  rectMode(CORNERS);
  f = loadFont("SansSerif.plain-12.vlw");
  fbold = loadFont("SansSerif.bold-12.vlw");
  fbig = loadFont("SansSerif.bold-20.vlw");
  filein = loadStrings("density_data.txt");
  for (int i = 0; i < filein.length; i++) {
    println(filein[i]);
    materials[i] = split(filein[i], TAB)[0];
    densities[i] = Float.parseFloat(split(filein[i], TAB)[1]);
  }
  
  for (int i = 0; i < materials.length; i++) {
    if (materials[i] == null) {
      materials_length = i;
      break;
    }
  }
}

void draw() {
  background(255);
  
  strokeWeight(1);
  
  // ADD THE MATERIAL NAMES
  
  fill(100);
  textFont(f, 12);
  
  translate(leftmargin, line0y - 5);
  rotate(-HALF_PI);
  textAlign(LEFT, CENTER);
  for (int i = 0; i < materials_length; i++) {
    if (rho0L <= densities[i] && densities[i] <= rho0R) {
      text(materials[i], 0, (densities[i]-rho0L) * linelength / 0.023);
    }
  }
  translate(-spacing, 0);
  for (int i = 0; i < materials_length; i++) {
    if (rho1L <= densities[i] && densities[i] <= rho1R) {
      text(materials[i], 0, (densities[i]-rho1L) * linelength / 0.23);
    }
  }
  translate(-spacing, 0);
  for (int i = 0; i < materials_length; i++) {
    if (rho2L <= densities[i] && densities[i] <= rho2R) {
      text(materials[i], 0, (densities[i]-rho2L) * linelength / 2.3);
    }
  }
  translate(-spacing, 0);
  for (int i = 0; i < materials_length; i++) {
    if (rho3L <= densities[i] && densities[i] <= rho3R) {
      text(materials[i], 0, (densities[i]-rho3L) * linelength / 23.0);
    }
  }
  
  
  rotate(HALF_PI);
  translate(-leftmargin, -line3y + 5);
  
  noFill();
  
  line(leftmargin, line3y, leftmargin + linelength, line3y); // line 3
  line(leftmargin, line2y, leftmargin + linelength, line2y); // line 2
  line(leftmargin, line1y, leftmargin + linelength, line1y); // line 1
  line(leftmargin, line0y, leftmargin + linelength, line0y); // line 0
  
  strokeWeight(2);
  
  fill(255,0,0,128);
  
  box3left = box3center - boxlength;
  box3right = box3center + boxlength;
  rect(box3left, line3y-topboxheight, box3right, line3y+botboxheight);
  box2left = box2center - boxlength;
  box2right = box2center + boxlength;
  rect(box2left, line2y-topboxheight, box2right, line2y+botboxheight);
  box1left = box1center - boxlength;
  box1right = box1center + boxlength;
  rect(box1left, line1y-topboxheight, box1right, line1y+botboxheight);
  
  noFill();

 
  bezier(box3left,  line3y-topboxheight, box3left,  line3y-topboxheight-botbez, leftmargin,            line2y+topbez, leftmargin,            line2y);
  bezier(box3right, line3y-topboxheight, box3right, line3y-topboxheight-botbez, leftmargin+linelength, line2y+topbez, leftmargin+linelength, line2y);
  bezier(box2left,  line2y-topboxheight, box2left,  line2y-topboxheight-botbez, leftmargin,            line1y+topbez, leftmargin,            line1y);
  bezier(box2right, line2y-topboxheight, box2right, line2y-topboxheight-botbez, leftmargin+linelength, line1y+topbez, leftmargin+linelength, line1y);
  bezier(box1left,  line1y-topboxheight, box1left,  line1y-topboxheight-botbez, leftmargin,            line0y+topbez, leftmargin,            line0y);
  bezier(box1right, line1y-topboxheight, box1right, line1y-topboxheight-botbez, leftmargin+linelength, line0y+topbez, leftmargin+linelength, line0y);
  
//  line(box3left,  line3y-topboxheight, leftmargin,            line2y);
//  line(box3right, line3y-topboxheight, leftmargin+linelength, line2y);
//  line(box2left,  line2y-topboxheight, leftmargin,            line1y);
//  line(box2right, line2y-topboxheight, leftmargin+linelength, line1y);
//  line(box1left,  line1y-topboxheight, leftmargin,            line0y);
//  line(box1right, line1y-topboxheight, leftmargin+linelength, line0y);
  
  
  fill(0);
  strokeWeight(1);
  
  textAlign(RIGHT, CENTER);
  
  textFont(fbig, 20);
  text("1000x", leftmargin*.7, line0y - 0);
  text("100x", leftmargin*.7, line1y - 0);
  text("10x", leftmargin*.7, line2y - 0);
  text("1x", leftmargin*.7, line3y - 0);
  
  textFont(fbold, 12);
  text("Density (g/mL)",leftmargin + linelength/2, ymax-40);
  
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
  if (line3y - 150 < mouseY && mouseY < line3y + 50) {
    box3center = mouseX;
  }
  if (line2y - 150 < mouseY && mouseY < line2y + 50) {
    box2center = mouseX;
  }
  if (line1y - 150 < mouseY && mouseY < line1y + 50) {
    box1center = mouseX;
  }
}
