/********************************************************
 * MAT 259 2D-Visualization                             *
 * Tested in Processing 3.4                             *     
 *                                                      *
 * Meilin Shi                                           *
 *                                                      *
 * Purpose: Show a 2D Matrix of language checkouts thru *
 *          time with color scheme.                     *
 *                                                      *
 * Usage:                                               *
 *          Press 't' to show the keeping time of       *
 *          language checkouts; 'c' to change the       *
 *          colorbar and 's' to save screenshot.        *
 ********************************************************/

/*******************initialize variables*****************/
 Table bookcount,keeptime;
 int rows, cols;
 int rows_2,cols_2;
 
 float[][] data_matrix,time_matrix;
 int[] row_sum, avg_array;
 float max, max_t, min, sum, avg;
 float cell_width, cell_height;
 
 final float margin_to_left = 150;
 final float margin_to_top = 70;
 
 color book_color;
 
 PImage colorbar;
 
 PImage[] flags;
 String[] Languages = {"English \n Dewey Class 420","German & related\n Dewey Class 430",
 "French & related \n Dewey Class 440", "Italian & related\n Dewey Class 450", 
 "Spanish & related\n Dewey Class 460","Russian \n Dewey Class \n 491.7","Arabic \n Dewey Class \n 492.7",
 "Chinese \n Dewey Class \n 495.1", "Japanese \n Dewey Class \n 495.6","Korean \n Dewey Class \n 495.7"};
 
 String [] Year = {"2006", "2007", "2008", "2009", "2010", "2011", 
 "2012", "2013", "2014", "2015", "2016","2017","2018"};
 
 boolean show = false;
 boolean change = false;

/******************************set up****************************************/
 void setup(){
   size(1280,720);
   
   //for book checkouts query
   bookcount = loadTable("bookcount.csv","header");
   rows = bookcount.getRowCount();
   cols = bookcount.getColumnCount();
   
   println("Rows = " + rows);
   println("Columns = " + cols);
  
  //for keeping time query
   keeptime = loadTable("keeptime.csv","header");
   rows_2 = keeptime.getRowCount();
   cols_2 = keeptime.getColumnCount();
 
  
  //fill the data matrix
  data_matrix = new float [cols-2][rows];
  for(int i = 0; i < cols-2 ; i++){
    for(int j = 0; j < rows; j++){
      data_matrix[i][j] = bookcount.getFloat(j,i+2);
    }
  }
  
  //fill the time matrix
  time_matrix = new float[cols_2-1][rows];
  for(int i = 0; i < cols_2-1;i++){
    for(int j = 0; j < rows_2; j++){
      time_matrix[i][j] = keeptime.getFloat(j,i+1);
    }
  }
  
  //get min & max from the data_matrix
  for(int i = 0; i < cols-2; i++){
    for(int j = 0; j < rows; j++){
      if(data_matrix[i][j] > max){
        max = data_matrix[i][j];
      }
    }
  }
  min = max; //get min
  for(int i = 0; i < cols-2; i++){
    for(int j = 0; j < rows; j++){
      if(data_matrix[i][j] < min){
        min = data_matrix[i][j];
      }
    }
  }
  
  max_t = 0;
  //get max for the time matrix
  for(int i = 0; i < cols_2-1; i++){
    for(int j = 0; j < rows_2; j++){
      if(time_matrix[i][j] > max_t){
        max_t = time_matrix[i][j];
      }
    }
  }
  
   //find average of each language checkouts
   row_sum = new int [cols-2];
   avg_array = new int[cols-2];
   for (int i = 0; i < cols -2; i++){
     for(int j = 0; j < rows; j++){
       row_sum[i] += data_matrix[i][j];
     }
    avg_array[i] = int(row_sum[i]/rows);
  }
 
  //find average for the three least checkout languages
  for(int i = 0; i < rows; i++){
    sum += data_matrix[5][i]+data_matrix[6][i]+data_matrix[9][i];
  }avg = sum/(3*rows);
  
  println("Max: " + max);
  println("Min: " + min);
  println("Average for 3 least checkouts: " + int(avg));

  //load colorbar
  //colorbar = loadImage("try.jpg");
    colorbar = loadImage("test.png");
  
  //load flag icons
  flags = new PImage[Languages.length];
  for(int i = 0; i < flags.length; i++){
    flags[i] = loadImage(i + ".png");
  }
  
  cell_width = (width - margin_to_left*2)/rows;
  cell_height = (height - margin_to_top*2)/cols;
  
 }
 
 /*************************************** draw ************************************/
 void draw(){
   background(40);
   
   //draw rect matrix
   for(int i = 0; i < cols-2; i++){
    for(int j = 0; j < rows; j++){
      color c = colorbar.get((int)map(data_matrix[i][j], min, max, 
      (colorbar.width-2)*5/6, 2), colorbar.height/2);
      fill(c,240);
      stroke(80);
      strokeWeight(0.2);
      rect(margin_to_left+j*cell_width+30, margin_to_top + i*cell_height+30, cell_width, cell_height-7,7);
      }
  }
  
  //y-axis label icons
  for(int i = 0; i < Languages.length; i++){
    imageMode(CENTER);
    image(flags[i], margin_to_left, margin_to_top+cell_height*i+50, 40,40);
    tint(255,200);  
}

  //y-axis title when hovering around the flag icon
  if(margin_to_left-10 < mouseX && mouseX <  margin_to_left+10){
    for(int i = 0; i < Languages.length; i++){
      if (margin_to_top+cell_height*i+40 < mouseY && mouseY < margin_to_top+cell_height*(i+1)+40){
        textAlign(RIGHT, CENTER);
        fill(200);
        textSize(14);
        text(Languages[i],margin_to_left-25, margin_to_top+cell_height*i+50);
      }
    }
  }
  
  //another y-axis label, show average number of checkouts when hovering around avg
  textAlign(RIGHT,CENTER);
  textSize(14);
  fill(225);
  text("Avg", width-margin_to_left+70,margin_to_top+20);
  if((width-margin_to_left+60) < mouseX && mouseX < (width-margin_to_left+80) &&
  (margin_to_top+10) < mouseY && mouseY < (margin_to_top+30)){
    for(int i = 0; i < avg_array.length; i++){
      textAlign(RIGHT, CENTER);
      fill(225);
      textSize(14);
      text(avg_array[i], width-margin_to_left+70, margin_to_top+50+i*cell_height);
    }
  }
    
  //x-axis label + highlight when hovering around each year
  for(int j = 0; j < Year.length; j++){
    textAlign(CENTER,CENTER);
    fill(255);
    textSize(14);
    text(Year[j], margin_to_left+j*12*cell_width+60, height-margin_to_top*2+20);
    if((margin_to_left+cell_width*j*12+60) < mouseX && 
    mouseX < (margin_to_left+cell_width*j*12+60+12*cell_width) &&
    (height-margin_to_top*2+10) < mouseY && 
    mouseY < (height-margin_to_top*2+30)){
      fill(33,70,139,35);
      noStroke();
      rect(margin_to_left+30+cell_width*j*12,margin_to_top+20,cell_width*12*0.85,height-2*margin_to_top-40);
    }
}
    
  //title
  textAlign(LEFT,CENTER);
  fill(205);
  textSize(28);
  text("Language Learning Interests at Seattle Public Library",
  margin_to_left+30,40);
  fill(120);
  textSize(20);
  text("Total checkouts and keeping time of language related items within Dewey Class 400", margin_to_left + 30 ,75);
 
  
  //author
  textAlign(RIGHT,CENTER);
  fill(225);
  textSize(14);
  text("MAT 259 \n Meilin Shi", width-margin_to_left+30, height-margin_to_top);
  
  //Colorbar Legend
  textAlign(LEFT);
  textSize(12);
  fill(255);
  text("Number of checkouts", 
  margin_to_left+12*cell_width+110, height-margin_to_left+75);
  
  imageMode(CENTER);
  image(colorbar,margin_to_left + 12*cell_width+20,
  height-margin_to_left+70,150,12);
  
  textAlign(LEFT);
  textSize(12);
  fill(255);
  text(int(max), 
  margin_to_left+cell_width+10, height-margin_to_left+90);
  text(int(avg), 
  margin_to_left+cell_width+150,height-margin_to_left+90);
 
 /************************** keypressed functions ******************************/
 //show additional keeping time information
 if(show){
   keeptime();
 }
 
 //change colorbar
 if(change)
   colorbar = loadImage("try.jpg");
 else
   colorbar = loadImage("test.png");
 }
 
 void keyPressed() {
  if (key == 't'||key == 'T') 
    show= !show;
  if (key == 'c'||key == 'C') 
    change = !change;
 if (key == 's' ||key == 'S')
   saveFrame("2d_visual.png");
}
   
 
