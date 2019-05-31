final float totalWeeks = 670; 
int startyear = 2006;
float gap = 25;
final float margin_to_left = 160;
final float margin_to_top = 100;
int language = 99;
int type_num = 5;
int func_num = 2;

String [] languages = {"English","German & related","French & related","Italian & related",
"Spanish & related", "Russian","Arabic","Chinese","Japanese","Korean"};
String[] types = {"Book","CD/CD-ROM","DVD","Audio Tape","Others"};
String[] func ={"OVERVIEW","RESET"};

color clr[] = {#FEFFFF,#DFB7BF,#82C4E5,#71787A,#537E97,
              #EDE2E6,#B4AEDE/*#512D47*/,#A39281,#D5D2C3,#B9C5C3};
boolean[] state = {true, true, true, true, true, true, true, true, true, true};
boolean[] state2 = {true, true, true, true, true};

//draw histogram based on total checkout counts in log scale
void histogram(){
  for(int i = 0; i < numCols-2; i++){
    for(int j = 0; j < numRows; j++){
      stroke(clr[i],data_matrix[i][j]);
      fill(clr[i],data_matrix[i][j]*2);
      pushMatrix();
      translate((-totalWeeks/2+j*4)+30,i*20-80, data_matrix[i][j]/4-40);
      box(4,15,data_matrix[i][j]/2);
      popMatrix();
    }
  } 
}
    
//draw lines based on keeptime of the items
void drawLines(){
  for(int i = 0; i < cols-2; i++){
    for(int j = 0; j < rows-1; j++){
      
      if(language == 0){if(!(languages[i].equals("English"))){continue;}}
      if(language == 1){if(!(languages[i].equals("German & related"))){continue;}}
      if(language == 2){if(!(languages[i].equals("French & related"))){continue;}}
      if(language == 3){if(!(languages[i].equals("Italian & related"))){continue;}}
      if(language == 4){if(!(languages[i].equals("Spanish & related"))){continue;}}
      if(language == 5){if(!(languages[i].equals("Russian"))){continue;}}
      if(language == 6){if(!(languages[i].equals("Arabic"))){continue;}}
      if(language == 7){if(!(languages[i].equals("Chinese"))){continue;}}
      if(language == 8){if(!(languages[i].equals("Japanese"))){continue;}}
      if(language == 9){if(!(languages[i].equals("Korean"))){continue;}} 
      
      if(languages[i].equals("English")){stroke(clr[0]);}
      if(languages[i].equals("German & related")){stroke(clr[1]);}
      if(languages[i].equals("French & related")){stroke(clr[2]);}
      if(languages[i].equals("Italian & related")){stroke(clr[3]);}
      if(languages[i].equals("Spanish & related")){stroke(clr[4]);}
      if(languages[i].equals("Russian")){stroke(clr[5]);}
      if(languages[i].equals("Arabic")){stroke(clr[6]);}
      if(languages[i].equals("Chinese")){stroke(clr[7]);}
      if(languages[i].equals("Japanese")){stroke(clr[8]);}
      if(languages[i].equals("Korean")){stroke(clr[9]);}

      pushMatrix();
      translate((-totalWeeks/2),i-130,0);
      strokeWeight(2);
      line(35+j*4,20+gap*i,-40+time_matrix[i][j],
      35+(j+1)*4,20+gap*i,-40+time_matrix[i][j+1]);
      popMatrix();
      }
  }   
}
//draw points based on checkout counts
void drawData(){
  for(int i = 0; i < 10; i++){
    if(state[i]){
      drawPoints(i);
    }
  }
  for(int i = 0; i < 5; i++){
    if(state2[i]){
      drawPoints(types[i]);
    }
  } 
}

//draw points based on languages
void drawPoints(int c){
  for(int i=0; i<items.size()-1; i++){
      float pointSize = map((items.get(i).count),0,max,5,50);
      int lang = languageDetermine(items.get(i).dewey);
      if (lang == c){
        stroke(clr[c]);
      }
      else{noStroke();}
      strokeWeight(pointSize);   
      pushMatrix();
      float[] rotations = cam.getRotations();
      translate((items.get(i).x),(items.get(i).y),(items.get(i).z));
      rotateX(rotations[0]);
      rotateY(rotations[1]);
      rotateZ(rotations[2]);
      point(0,0,0);
      //draw hovering text
      float mouseObjectDistance = sq(mouseX-screenX(0, 0, 0))+sq(mouseY-screenY(0, 0, 0)); 
      if (mouseObjectDistance < 75) {
        if(lang == c){
          strokeWeight(pointSize*2.5);
          stroke(clr[lang]);
          point(0, 0, 0);
          stroke(#FFFFFF);
          fill(#FFFFFF);
          textSize(5);
          text(items.get(i).title, 0, 15);
          strokeWeight(pointSize);
          stroke(clr[lang], 255);
          point(0, 0, 0);
          stroke(0, 0, 0, 0);
        }
      }
      popMatrix();
    }
}

//draw points based on itemtypes
void drawPoints(String s){
for(int i=0; i<items.size()-1; i++){
      float pointSize = map((items.get(i).count),0,max,5,50);
      color c = deweyDetermine(items.get(i).dewey);
      String type = typeDetermine(items.get(i).itemtype);
      if (type == s){
        stroke(c);
      }
      else{noStroke();}
      strokeWeight(pointSize);   
      pushMatrix();
      float[] rotations = cam.getRotations();
      translate((items.get(i).x),(items.get(i).y),(items.get(i).z));
      rotateX(rotations[0]);
      rotateY(rotations[1]);
      rotateZ(rotations[2]);
      point(0,0,0);
      //draw hovering text
      float mouseObjectDistance = sq(mouseX-screenX(0, 0, 0))+sq(mouseY-screenY(0, 0, 0)); 
      if (mouseObjectDistance < 75) {
        if(type == s){
          strokeWeight(pointSize*2.5);
          stroke(c);
          point(0, 0, 0);
          stroke(#FFFFFF);
          fill(#FFFFFF);
          textSize(5);
          text(items.get(i).title, 0, 15);
          strokeWeight(pointSize);
          stroke(c);
          point(0, 0, 0);
          stroke(0, 0, 0, 0);
        }
      }
      popMatrix();
    }
}

//draw all the points
void drawPoints(){
for(int i=0; i<items.size()-1; i++){
      float pointSize = map((items.get(i).count),0,max,5,50);
      color c = deweyDetermine(items.get(i).dewey);
      stroke(c);
      strokeWeight(pointSize);   
      pushMatrix();
      float[] rotations = cam.getRotations();
      translate((items.get(i).x),(items.get(i).y),(items.get(i).z));
      rotateX(rotations[0]);
      rotateY(rotations[1]);
      rotateZ(rotations[2]);
      point(0,0,0);
      //draw hovering text
      float mouseObjectDistance = sq(mouseX-screenX(0, 0, 0))+sq(mouseY-screenY(0, 0, 0)); 
      if (mouseObjectDistance < 75) {
          strokeWeight(pointSize*2.5);
          stroke(c);
          point(0, 0, 0);
          stroke(#FFFFFF);
          fill(#FFFFFF);
          textSize(5);
          text(items.get(i).title, 0, 15);
          strokeWeight(pointSize);
          stroke(c);
          point(0, 0, 0);
          stroke(0, 0, 0, 0);
        }
        popMatrix();
    }
} 
  
color deweyDetermine(float dewey){
  color c = #FFFFFF;
  if(dewey >= 420 && dewey < 430){c = clr[0];}
  else if(dewey >= 430 && dewey < 440){c = clr[1];}
  else if(dewey >= 440 && dewey < 450){c = clr[2];}
  else if(dewey >= 450 && dewey < 460){c = clr[3];}
  else if(dewey >= 460 && dewey < 470){c = clr[4];}
  else if(dewey >= 491.7 && dewey < 491.8){c = clr[5];}
  else if(dewey >= 492.7 && dewey < 492.8){c = clr[6];}
  else if(dewey >= 495.1 && dewey < 495.2){c = clr[7];}
  else if(dewey >= 495.6 && dewey < 495.7){c = clr[8];}
  else if(dewey >= 495.7 && dewey < 495.8){c = clr[9];}
  return c;
}

int languageDetermine(float dewey){
  int lang = 99;
  if(dewey >= 420 && dewey < 430){lang = 0;}
  else if(dewey >= 430 && dewey < 440){lang = 1;}
  else if(dewey >= 440 && dewey < 450){lang = 2;}
  else if(dewey >= 450 && dewey < 460){lang = 3;}
  else if(dewey >= 460 && dewey < 470){lang = 4;}
  else if(dewey >= 491.7 && dewey < 491.8){lang = 5;}
  else if(dewey >= 492.7 && dewey < 492.8){lang = 6;}
  else if(dewey >= 495.1 && dewey < 495.2){lang = 7;}
  else if(dewey >= 495.6 && dewey < 495.7){lang = 8;}
  else if(dewey >= 495.7 && dewey < 495.8){lang = 9;}
  return lang;
}

String typeDetermine(String itemtype){
  String type = "";
  if(itemtype.endsWith("bk")){ type = "Book";}
  else if(itemtype.endsWith("cd")||
          itemtype.endsWith("cdrom")){type = "CD/CD-ROM";}
  else if(itemtype.endsWith("cas")){type = "Audio Tape";}
  else if(itemtype.endsWith("dvd")){type = "DVD";}
  else{type = "Others";}
  return type;
}

void axis(){
  //x-axis -- year
  for(int i = 0; i < 13; i++){
    textSize(14);
    fill(255);
    textAlign(LEFT);
    text(startyear+i,(-totalWeeks/2+i*48)+30, 150,-40);
    stroke(255);
    strokeWeight(2);
    line((-totalWeeks/2+i*48)+30,-130,-40,(-totalWeeks/2+i*48)+30,130,-40);
  }
  
  //y-axis -- languages
  rotateZ(-PI/2);
  textAlign(LEFT);
  text("Languages",-50,-350,-40);
  fill(255);
  
  //z-axis -- checkout counts
  rotateZ(PI/2);
  rotateY(-PI/2);
  textSize(10);
  textAlign(LEFT);
  if(hist){
  text("Log(Checkout Counts)", -totalWeeks/2+300, -140,310);}
  if(time){
  text("Keeping time of items (days)", -totalWeeks/2+300, -140, 310);}
  rotateY(PI/2); 
  line(-totalWeeks/2+30,-130,-40,-totalWeeks/2+30, -130,100);
  rotateZ(-PI/2);
}


void legend() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  
  for(int i = 0; i<languages.length; i++){
    stroke(clr[i]);
    strokeWeight(2);
    if(language == i){noFill();}
    else{fill(clr[i]);}
    rect(margin_to_left-125,460+gap*i,15,15);
    fill(255);
    textAlign(LEFT);
    textSize(16);
    pushMatrix();
    translate(0,i*gap,0);
    text(languages[i],margin_to_left-100,475);
    popMatrix();
  }
  
  if(point == true){
    for(int i = 0; i < 2; i++){
      stroke(150);
      strokeWeight(2);
      if(func_num == i){
        noFill();
      }
      else{fill(150);}
      rect(225, 510+gap*i,15,15);
      fill(255);
      textAlign(LEFT);
      textSize(16);
      pushMatrix();
      translate(0,i*gap,0);
      text(func[i],250,525);
      popMatrix();
    } 
    for(int i = 0; i < 5; i++){
      stroke(150);
      strokeWeight(2);
      if(type_num == i){noFill();}
      else{fill(150);}
      rect(225, 585+gap*i,15,15);
      fill(255);
      textAlign(LEFT);
      textSize(16);
      pushMatrix();
      translate(0,i*gap,0);
      text(types[i],250,600);
      popMatrix();
    }
  }
    
  //title
  textAlign(LEFT);
  pushMatrix();
  translate(0, gap,0);
  textSize(24);
  text("Language Learning Interests at Seattle Public Library",35,30);
  textSize(18);
  text("Total checkouts, average keeping time and popular items within Dewey Class 400",35,60);
  strokeWeight(2);
  line(35,35,650,35);
  textSize(16);
  text(" MAT 259 | Meilin Shi",35,85);
  textAlign(RIGHT);
  text("h - show histogram", 1250,635);
  text("t - show line graph of keeping time", 1250,655);
  text("p - show point view of popular items", 1250, 675);
  popMatrix();
  
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
