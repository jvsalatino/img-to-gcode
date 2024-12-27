
import processing.pdf.*;
import blobDetection.*;
import java.io.*;
import processing.svg.*;

MenuBar menuBar;
ImagePreview imgPreview;
String selectedImageFileName;
String dataPath = "";
String gcodePath = ""; 
String generatedImgs  = "";
String resultImgs = "";
PImage img;
float globalScale = 100.0; //PARA ARCHIVO 800 X 600 : A3 2.5 A4 3.3
float Densidad;
float Scale;
int e_d = 0;
int e_s = 0;
PFont font;
float ancho = 0.0;
float alto = 0.0;

void setup() {
  size(1200, 700);
  font = loadFont("AauxProBold-16.vlw");
  textFont(font);
  background(255);
  
  dataPath = sketchPath() + "/data";
  //dataPath = sketchPath() + "/data";
  gcodePath = sketchPath() + "/gcode";
  generatedImgs = sketchPath() + "/generatedImages";
  resultImgs = sketchPath() + "/resultImages";

  File gcodeDir = new File(gcodePath);
  if (!gcodeDir.exists()) {
    try {
      gcodeDir.mkdir();
    } 
    catch(SecurityException se) {
      //handle it
    }
  }
  File generatedImgsDir = new File(generatedImgs);
  if (!generatedImgsDir.exists()) {
    try {
      generatedImgsDir.mkdir();
    } 
    catch(SecurityException se) {
      //handle it
    }
  }
  File resultImgsDir = new File(resultImgs);
  if (!resultImgsDir.exists()) {
    try {
      resultImgsDir.mkdir();
    } 
    catch(SecurityException se) {
      //handle it
    }
  }

  menuBar = new MenuBar(this, dataPath);
  menuBar.setXPosition(1000);
  menuBar.setYPosition(150);
  menuBar.init();
}

public void controlEvent(ControlEvent theEvent) {
  menuBar.controlEvent(theEvent);
}

void draw() {

  fill(100);
  //println(menuBar.getSelectedFileIndex());
  if ( menuBar.getSelectedFileIndex() >= 0) {
    selectedImageFileName = menuBar.getSelectedFileName(menuBar.getSelectedFileIndex());
    imgPreview = new ImagePreview(selectedImageFileName);
    imgPreview.setXPosition(1000);
    imgPreview.setYPosition(250);
    imgPreview.showPreview();
    ancho = float(imgPreview.getOriginalWidth());
    alto = float(imgPreview.getOriginalHeight());
    }
 
  
  if(Densidad < 100.00){
    e_d = 2;
  }
  if(Densidad < 10){
    e_d = 1;
  }
  if(Densidad == 100){
   e_d = 3; 
  }
  String Dens = nf(Densidad,e_d,2); 
  noStroke();
  fill(255); 
  rect(975,00,300,25); 
  fill(0);
  text("Densidad: ",980,20);
  text(Dens,1100,20);
  if(Scale < 100.00){
    e_d = 2;
  }
  if(Scale < 10){
    e_d = 1;
  }
  if(Scale == 100){
   e_d = 3; 
  }
  String Escala = nf(Scale,e_s,2); 
 
  fill(255); 
  rect(975,50,300,25); 
  fill(0);
  text("Escala: ",980,70);
  text(Escala,1100,70);
 
 
  //text("Final size in mm",935,70);
  String ancho_final = nf(ancho*Scale/100,3,2);
  String alto_final = nf(alto*Scale/100,3,2);
  fill(255); 
  rect(990,100,300,50); 
  fill(0);
  text("Tamaño final en mm",1000,115);
  text(ancho_final,1010 , 135); 
  text(" x ",1060,135);
   text(alto_final,1080 , 135);
}

void cuatricromia(int value){
  Cuatricromia c = new Cuatricromia(imgPreview.getOriginalImage().get());
  c.calculate();
  c.saveImages(generatedImgs);
  //c.showPreview(1000,300);
}

void contour(int value){  
  ContourAlgorithm c = new ContourAlgorithm(imgPreview.getOriginalImage().get(), Scale);
  cuatricromia(0);
  c.calculate();
  
}

void crosshatch(int value) {
  cuatricromia(0);
  float densidad = Densidad;
  float scale = Scale;
  
  CrossHatchAlgorithm c = new CrossHatchAlgorithm(imgPreview.getOriginalName(), densidad, scale);

  c.drawYellow("yellow", generatedImgs + "/yellow-img.jpg", 255, 210, 0);

  c.drawMagenta("magenta", generatedImgs + "/magenta-img.jpg", 255, 80, 120);

  c.drawCyan("cyan", generatedImgs + "/cyan-img.jpg", 40, 255, 250);

  c.drawBlack("black", generatedImgs + "/black-img.jpg", 0, 0, 0);
   
}

public void savejpg(int value) {
  PImage imgc = get(0, 0, imgPreview.getOriginalWidth(), imgPreview.getOriginalHeight());
  imgc.save(resultImgs+ "/"+imgPreview.getOriginalName()+"-final.jpg");
}

public void clear(int value){
  background(255);
}