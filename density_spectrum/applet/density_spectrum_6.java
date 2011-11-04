import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class density_spectrum_6 extends PApplet {

int xmax = 1200;
int ymax = 850;
PFont f;
PFont fbold;
PFont fbig;
PFont fmedium;
int leftmargin = 50;
int topmargin = 175;
int linelength = xmax - leftmargin - 50;
int spacing = 200;
float line3y = topmargin + 3 * spacing;
float line2y = topmargin + 2 * spacing;
float line1y = topmargin + 1 * spacing;
float line0y = topmargin + 0 * spacing;
float topboxheight = 180;
float botboxheight = 35;
float boxlength = linelength / 10 / 2; // half box length
float box3center = 109;
float box2center = 567;
float box1center = 296;
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

public void setup() {
  smooth();
  size(1200, 850);
  background(255);
  rectMode(CORNERS);
  f = loadFont("SansSerif.plain-12.vlw");
  fbold = loadFont("SansSerif.bold-12.vlw");
  fbig = loadFont("SansSerif.bold-30.vlw");
  fmedium = loadFont("SansSerif.plain-18.vlw");
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

public void draw() {
  background(255);
  
  
  
  strokeWeight(4);
  
  fill(0,0,0);
  
  box3left = box3center - boxlength;
  box3right = box3center + boxlength;
  box2left = box2center - boxlength;
  box2right = box2center + boxlength;
  box1left = box1center - boxlength;
  box1right = box1center + boxlength;
  
  
//  rect(box3left, line3y-topboxheight, box3right, line3y+botboxheight);
//  rect(box2left, line2y-topboxheight, box2right, line2y+botboxheight);
//  rect(box1left, line1y-topboxheight, box1right, line1y+botboxheight);
//  
//  noFill();
//
// 
//  bezier(box3left,  line3y-topboxheight, box3left,  line3y-topboxheight-botbez, leftmargin,            line2y+topbez, leftmargin,            line2y);
//  bezier(box3right, line3y-topboxheight, box3right, line3y-topboxheight-botbez, leftmargin+linelength, line2y+topbez, leftmargin+linelength, line2y);
//  bezier(box2left,  line2y-topboxheight, box2left,  line2y-topboxheight-botbez, leftmargin,            line1y+topbez, leftmargin,            line1y);
//  bezier(box2right, line2y-topboxheight, box2right, line2y-topboxheight-botbez, leftmargin+linelength, line1y+topbez, leftmargin+linelength, line1y);
//  bezier(box1left,  line1y-topboxheight, box1left,  line1y-topboxheight-botbez, leftmargin,            line0y+topbez, leftmargin,            line0y);
//  bezier(box1right, line1y-topboxheight, box1right, line1y-topboxheight-botbez, leftmargin+linelength, line0y+topbez, leftmargin+linelength, line0y);
//  
//  line(box3left,  line3y-topboxheight, leftmargin,            line2y);
//  line(box3right, line3y-topboxheight, leftmargin+linelength, line2y);
//  line(box2left,  line2y-topboxheight, leftmargin,            line1y);
//  line(box2right, line2y-topboxheight, leftmargin+linelength, line1y);
//  line(box1left,  line1y-topboxheight, leftmargin,            line0y);
//  line(box1right, line1y-topboxheight, leftmargin+linelength, line0y);
  
//  noStroke();
  
  stroke(255);
  
  fill(255*.50f);          // BOTTOM
  beginShape();
  vertex(leftmargin-20, line3y+55);
  vertex(leftmargin-20, line3y-150);
  vertex(leftmargin+20+linelength, line3y-150);
  vertex(leftmargin+20+linelength, line3y+55);
  endShape(CLOSE);

  fill(255*0.65f);
  beginShape();
  vertex(box3left, line3y+65);  // this one is different
  vertex(box3left, line3y-165);
  vertex(leftmargin-20, line3y-165);
  vertex(leftmargin-20, line2y-150);
  vertex(leftmargin+20+linelength, line2y-150);
  vertex(leftmargin+20+linelength, line3y-165);
  vertex(box3right, line3y-165);
  vertex(box3right, line3y+65);  // this one is different
  endShape(CLOSE);
  
  fill(255*0.80f);
  beginShape();
  vertex(box2left, line2y+45);
  vertex(box2left, line2y-165);
  vertex(leftmargin-20, line2y-165);
  vertex(leftmargin-20, line1y-150);
  vertex(leftmargin+20+linelength, line1y-150);
  vertex(leftmargin+20+linelength, line2y-165);
  vertex(box2right, line2y-165);
  vertex(box2right, line2y+45);
  endShape(CLOSE);
  
  fill(255*0.90f);         // TOP
  beginShape();
  vertex(box1left, line1y+45);
  vertex(box1left, line1y-165);
  vertex(leftmargin-20, line1y-165);
  vertex(leftmargin-20, line0y-150);
  vertex(leftmargin+20+linelength, line0y-150);
  vertex(leftmargin+20+linelength, line1y-165);
  vertex(box1right, line1y-165);
  vertex(box1right, line1y+45);
  endShape(CLOSE);
  
  strokeWeight(1);
  
  // ADD THE MATERIAL NAMES
  
  fill(0);
  textFont(f, 12);
  
  translate(leftmargin, line0y - 5);
  rotate(-HALF_PI);
  textAlign(LEFT, CENTER);
  for (int i = 0; i < materials_length; i++) {
    if (rho0L <= densities[i] && densities[i] <= rho0R) {
      text(materials[i], 0, (densities[i]-rho0L) * linelength / 0.023f);
    }
  }
  translate(-spacing, 0);
  for (int i = 0; i < materials_length; i++) {
    if (rho1L <= densities[i] && densities[i] <= rho1R) {
      text(materials[i], 0, (densities[i]-rho1L) * linelength / 0.23f);
    }
  }
  
  fill(0);
  translate(-spacing, 0);
  for (int i = 0; i < materials_length; i++) {
    if (rho2L <= densities[i] && densities[i] <= rho2R) {
      text(materials[i], 0, (densities[i]-rho2L) * linelength / 2.3f);
    }
  }
  translate(-spacing, 0);
  for (int i = 0; i < materials_length; i++) {
    if (rho3L <= densities[i] && densities[i] <= rho3R) {
      text(materials[i], 0, (densities[i]-rho3L) * linelength / 23.0f);
    }
  }
  
  
  rotate(HALF_PI);
  translate(-leftmargin, -line3y + 5);
  
  noFill();
  
  stroke(0);
  line(leftmargin, line3y, leftmargin + linelength, line3y); // line 3
  line(leftmargin, line2y, leftmargin + linelength, line2y); // line 2
  stroke(0);
  line(leftmargin, line1y, leftmargin + linelength, line1y); // line 1
  line(leftmargin, line0y, leftmargin + linelength, line0y); // line 0
  

  
  fill(0);
  strokeWeight(1);
  
  textAlign(RIGHT, CENTER);
  
  fill(0);
  textFont(fbig, 30);
  text("1000x", xmax*.96f, line0y - 120);
  text("100x", xmax*.96f, line1y - 120);
  fill(0);
  text("10x", xmax*.96f, line2y - 120);
  text("1x", xmax*.96f, line3y - 120);
  
  fill(0);
  textFont(fbold, 12);
  text("Density (g/mL)",leftmargin + linelength/2, ymax-35);
  
  stroke(0);
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
  rho = ceil(rho2L * 10) / 10.0f;
  while (rho < ceil(rho2R * 10) / 10.0f) {
    line(leftmargin + (rho-rho2L) * linelength / 2.3f, line2y, leftmargin + (rho-rho2L) * linelength / 2.3f, line2y+10);
    textAlign(CENTER, CENTER);
    text(nf(rho, 0, 1), leftmargin + (rho-rho2L) * linelength / 2.3f, line2y+20);
    rho += 0.1f;
  }
  
  stroke(0);
  fill(0);
  rho1L = (box2left - leftmargin) * 2.3f / linelength + rho2L;
  rho1R = (box2right - leftmargin) * 2.3f / linelength + rho2L;
  rho = ceil(rho1L * 100) / 100.0f;
  while (rho < ceil(rho1R * 100) / 100.0f) {
    line(leftmargin + (rho-rho1L) * linelength / 0.23f, line1y, leftmargin + (rho-rho1L) * linelength / 0.23f, line1y+10);
    textAlign(CENTER, CENTER);
    text(nf(rho, 0, 2), leftmargin + (rho-rho1L) * linelength / 0.23f, line1y+20);
    rho += 0.01f;
  }

  rho0L = (box1left - leftmargin) * 0.23f / linelength + rho1L;
  rho0R = (box1right - leftmargin) * 0.23f / linelength + rho1L;
  rho = ceil(rho0L * 1000) / 1000.0f;
  while (rho < ceil(rho0R * 1000) / 1000.0f) {
    line(leftmargin + (rho-rho0L) * linelength / 0.023f, line0y, leftmargin + (rho-rho0L) * linelength / 0.023f, line0y+10);
    textAlign(CENTER, CENTER);
    text(nf(rho, 0, 3), leftmargin + (rho-rho0L) * linelength / 0.023f, line0y+20);
    rho += 0.001f;
  }
  
  
  strokeWeight(3.0f);
  stroke(255,0,0);
  line(166,150,213,150);
  line(166,150,166,160);
  line(        213,150,213,160);
  line((166+213)/2,150, (166+213)/2, 140);
  fill(255,0,0);
  textFont(fmedium, 18);
  text("Current resolution of", (166+213)/2, 78);
  text("density spectrometry", (166+213)/2, 100);
  text("(0.001 g/mL)", (166+213)/2, 122);
}

public void mouseDragged() {
  println(mouseX);
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

public void mouseClicked() {
  if (mouseX < 20 && mouseY < 20) {
    save("out.png");
  }
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "density_spectrum_6" });
  }
}
