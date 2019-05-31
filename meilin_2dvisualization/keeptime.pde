void keeptime() {
  
  //draw lines of keeping time
  for(int i = 0; i < rows_2-1; i++){
    for(int j = 0; j < cols_2-1; j++){
      stroke(255);
      strokeWeight(2);
      line(margin_to_left+30+6*cell_width+i*12*cell_width, margin_to_top+cell_height*(j+1)+23-(time_matrix[j][i]/100*(cell_height-7)),
      margin_to_left+30+6*cell_width+(i+1)*12*cell_width, margin_to_top+cell_height*(j+1)+23-(time_matrix[j][i+1]/100*(cell_height-7)));  
    }
  }
    
  /*draw x and y axis coord system for reference
  for (int j = 0; j < cols_2-1; j++){
    line(margin_to_left+30, margin_to_top+cell_height*(j+1)+23, 
    width-margin_to_left+30, margin_to_top+cell_height*(j+1)+23);
  
    line(margin_to_left+30, margin_to_top+cell_height*j+30, 
    margin_to_left+30, margin_to_top+cell_height*(j+1)+23);
  } */
  
  
  //show the first and last value
  for (int i = 0; i < cols_2-1; i++){
    textAlign(LEFT, CENTER);
    fill(255);
    textSize(15);
    text(int(time_matrix[i][0]),margin_to_left+30+6*cell_width-25, 
    margin_to_top+(i+1)*cell_height+23-(time_matrix[i][0]/100*(cell_height-7)));
    text(int(time_matrix[i][rows_2-1]),margin_to_left+12.5*12*cell_width+30,
    margin_to_top+(i+1)*cell_height+23-(time_matrix[i][rows_2-1]/100*(cell_height-7))-15);
  }
}
