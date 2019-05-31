color clr[] = {#643A71,#06A77D,#005377,#D5C67A,#F1A208,
              #677F01,#4E4A00,#A6C36F,#8F420B,#D71D0C,
              #56637A,#A87D5A,#BC7D00,#753B0B,#AA4028};
                
String[] ideo = {"Anti-LGBT","Anti-Muslim","Black Nationalist","Christian Identity","Anti-Immigrant",
                 "Hate Music","Holocaust Denial","General Hate","Radical Traditional Catholicism",
                 "Ku Klux Klan","Male Supremacy","Neo-Confederate","Neo-Nazi","Racist Skinhead",
                 "White Nationalist"};               


//draw all the hate groups based on their location and color coded by ideology
void drawPoints(){
  cities.clear(); //clear the cities arraylist when run it for a second time
  for(int i = 0; i < groups.size()-1; i++){
    String ideo = groups.get(i).ideology;
    float xaxis = map(lonDetermine(groups.get(i).city,groups.get(i).state),-140,-60, -390,390);
    float yaxis = map(latDetermine(groups.get(i).city,groups.get(i).state),67,20, -380,380);
    float zaxis = -40;
    color c = #000000;
    stroke(c);
    strokeWeight(5);
    pushMatrix();
    float[] rotations = cam.getRotations();
    translate(xaxis,yaxis,zaxis);
    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);
    cities.add(new Coord(xaxis,yaxis,zaxis,ideo));
    point(0,0,0);
    float mouseObjectDistance = sq(mouseX-screenX(0, 0, 0))+sq(mouseY-screenY(0, 0, 0)); 
    if (mouseObjectDistance < 75) {
      if(!ideo.equals(groups.get(i+1).ideology)||(i+2 == groups.size())){
          strokeWeight(2.5*5);
          stroke(c);
          point(0,0,0);
          stroke(#000000);
          fill(#000000);
          textSize(15);
          text(groups.get(i).state,0,15);
          strokeWeight(5);
          stroke(c);
          point(0, 0, 0);
          stroke(0, 0, 0, 0);
       }
     }
    popMatrix();
   }
}

//Draw each distinct hate group based on the last entry location and total count, color coded by ideology
void drawGroups(){
    int minGroupNum = findMin(); //move the function find min and max out of the for loop
    int maxGroupNum = findMax();
    coord.clear(); //clear the coord arraylist when run it for a second time
    for(int i = 0; i < groups.size()-1; i++){
      String ideo = groups.get(i).ideology;
      color c = ideoDetermine(ideo);
      float xaxis = map(lonDetermine(groups.get(i).city, groups.get(i).state),-140,-60, -390,390);
      float yaxis = map(latDetermine(groups.get(i).city, groups.get(i).state),67,20, -380,380);
      float zaxis = map(countGroups(groups.get(i).ideology),minGroupNum,maxGroupNum,60,160); 
      float pointSize = map((countGroups(ideo)), minGroupNum, maxGroupNum,10,60);    
      stroke(c);      
      strokeWeight(pointSize);
      pushMatrix();
      float[] rotations = cam.getRotations();   
      translate(xaxis,yaxis,zaxis);
      rotateX(rotations[0]);
      rotateY(rotations[1]);
      rotateZ(rotations[2]);
      if(!ideo.equals(groups.get(i+1).ideology) || i+2 == groups.size()) {
        coord.add(new Coord(xaxis,yaxis,zaxis,ideo));
        point(0,0,0);
      }
    float mouseObjectDistance = sq(mouseX-screenX(0, 0, 0))+sq(mouseY-screenY(0, 0, 0)); 
    if (mouseObjectDistance < 75) {
      if(!ideo.equals(groups.get(i+1).ideology)||(i+2 == groups.size())){
          strokeWeight(pointSize*2);
          stroke(c);
          point(0,0,0);
          stroke(#000000);
          fill(#000000);
          textSize(15);
          text(ideo + " ("+String.valueOf(countGroups(ideo))+")", pointSize, 15);
          strokeWeight(pointSize);
          stroke(c);
          point(0, 0, 0);
          stroke(0, 0, 0, 0);
       }
     }
   popMatrix();
  }
}

//draw 1000 largest cities on the base level
void drawCities(){
  for(int i = 0; i < numRows; i++){
    float xaxis = map(demos.get(i).longitude,-140,-60, -390,390);
    float yaxis = map(demos.get(i).latitude,67,20, -380,380);
    float zaxis = -40;
    color c = #000000;
    stroke(c);
    strokeWeight(5);
    pushMatrix();
    float[] rotations = cam.getRotations();
    translate(xaxis,yaxis,zaxis);
    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);
    point(0,0,0);
    float mouseObjectDistance = sq(mouseX-screenX(0, 0, 0))+sq(mouseY-screenY(0, 0, 0)); 
    if (mouseObjectDistance < 75) {
        strokeWeight(2.5*5);
        stroke(c);
        point(0,0,0);
        stroke(#000000);
        fill(#000000);
        textSize(10);
        text(demos.get(i).cityName, 0, 15);
        strokeWeight(5);
        stroke(c);
        point(0, 0, 0);
        stroke(0, 0, 0, 0);
       }
    popMatrix();
   }
}

//draw lines 
void drawConnection(){
  for(int i = 0; i < ideo.length; i++){
    if(state[i]){
      connection(ideo[i]);
    }
  }
}


void connection(String s){
  color c = ideoDetermine(s);
  for(int i = 0; i < coord.size(); i++){
    if(coord.get(i).s.equals(s)){
      float x1 = coord.get(i).x;
      float y1 = coord.get(i).y;
      float z1 = coord.get(i).z;
      for(int j = 0; j < cities.size(); j++){
         if(cities.get(j).s.equals(s)){
           float x2 = cities.get(j).x;
           float y2 = cities.get(j).y;
           float z2 = cities.get(j).z;
           strokeWeight(0.5);
           beginShape(LINES);
           stroke(c);
           vertex(x1,y1,z1);
           stroke(c);
           vertex(x2,y2,z2);
           endShape(); 
        }
      }
    }
  }
}
     
//determine color based on ideology
color ideoDetermine(String ideology){
  color c = #000000;
  for(int i = 0; i < ideo.length; i++){
    if(ideology.equals(ideo[i])){c = clr[i];}
  }
  return c;
}

//count for the total number of groups in each ideology
int countGroups(String S){
  int count = 0;
  for(int i = 0; i < groups.size()-1; i++){
    if(S.equals(groups.get(i).ideology)){
      count+=1;
    }
  }
  return count;
}

//find max number of groups
int findMax(){
  int max = 0;
  for(int i = 0; i < ideo.length; i++){
    if(countGroups(ideo[i]) > max){
      max = countGroups(ideo[i]);
    }
  }
  return max;
}

//find min number of groups
int findMin(){
  int min = 100000;
  for(int i = 0; i < ideo.length; i++){
    if(countGroups(ideo[i]) < min){
      min = countGroups(ideo[i]);
    }
  }
  return min;
}

//determine latitude based on city and state name
float latDetermine(String city, String state){
  float lat = 0;
  for(int i = 0; i < numRows; i++){
    if(state.equals(demos.get(i).stateName)){
      if(city.equals(demos.get(i).cityName)){
        lat = demos.get(i).latitude;
      }
      else{
        for(int j = 0; j < nrow; j++){
          if(state.equals(states.get(j).state)){
            lat = states.get(j).lat;
          }
        }
      }
    }
  }
  return lat;
}

//determine longitude based on city and state name
float lonDetermine(String city, String state){
  float lon = 0;
  for(int i = 0; i < numRows; i++){
    if(state.equals(demos.get(i).stateName)){
      if(city.equals(demos.get(i).cityName)){
        lon = demos.get(i).longitude;
      }
      else{
        for(int j = 0; j < nrow; j++){
          if(state.equals(states.get(j).state)){
            lon = states.get(j).lon;
          }
        }
      }
    }
  }
  return lon;
}

void drawInfo(){
  strokeWeight(0.5);
  stroke(#000000);
  textSize(32);
  textAlign(LEFT,CENTER);
  text("HATED IN THE NATION", 20,40);
  line(20,58,375,58);
  
  fill(#000000);
  textSize(18);
  text("2018 Hate Group Distribution across the Nation",20,75);
  text("Data Source: Southern Poverty Law Center",20,100);
  text("MAT 259 | Meilin Shi",20,140); 
}
