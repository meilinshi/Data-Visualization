/*************************************************************************************
Data Visualization - Basic 3D Demo                
Tested in Processing 3.4                                    
                                                     
Author: Meilin Shi                                                

Purpose: Show how to present volume data in a basic 3D environment   
Reference: Part of the code referred from Jared Brooks and Chantel Chan   

Usage: 1. Show a histogram of total checkouts related to Dewey Class languages
       2. Show a line graph of monthly average keeping time of items
       3. Show a point view of popular items over time
*************************************************************************************/
import peasy.*;
import controlP5.*;

PeasyCam cam;
ControlP5 cp5;

void setup(){
  size(1280,720,P3D);
  //colorMode(HSB);
  cam = new PeasyCam(this,600);
  cp5 = new ControlP5(this);
  read(); 
}

void draw(){
  background(40);
  rotateX(PI/4);
  textMode(SHAPE);
  colorMode(HSB);
  legend();
  if(hist){histogram(); axis();}  
  if(time){drawLines(); axis();}
  if(point){
    drawData();
  }
}
