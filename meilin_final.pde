/********************************************************
 * MAT 259 - Winter 2019                                *
 * Final project                                        *    
 *                                                      *
 * Author: Meilin Shi                                   *
 * Supervisor: George Legrady                           *
 *                                                      *
 * Purpose: show hate groups distribution within the US *
 * in 2018.                                             *
 *                                                      *
 ********************************************************/
import peasy.*;
import controlP5.*;


PeasyCam cam;
ControlP5 cp5;
PFont font;

void setup(){
  fullScreen(P3D);
  //size(1280,720,P3D);
  cam = new PeasyCam(this,600);
  cp5 = new ControlP5(this);
  font = loadFont("SansSerif-24.vlw");
  textFont(font);
  read(); 
  GUI();
}

void draw(){
  background(250);
  drawPoints();
  drawGroups();
  drawCities();
  drawConnection();
  
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  drawInfo();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);

  
  if (cp5.getWindow().isMouseOver()){
    cam.setActive(false);
  }
  else{
    cam.setActive(true);
  }
}
