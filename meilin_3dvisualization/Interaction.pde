boolean hist = false;
boolean time = false;
boolean point = true;

void mousePressed(){
  //clicking on language box
  for(int i = 0; i <10; i++){
    if ( mouseX > margin_to_left-125 && mouseX < margin_to_left-125+15 && 
    mouseY > 460 + gap*i && mouseY < 460+gap*i+15) {
      state[i] = true;
      if (language != i){
        language = i;
        func_num = 2;
      }
      else{language = 99;}
    }
    //click on RESET
    else if(mouseX > 225 && mouseX < 225+15 && 
    mouseY > 510 + gap && mouseY < 510+gap+15){
      state[i] = false;
      language = 99; type_num = 5;
    }
    //click on OVERVIEW
    else if(mouseX > 225 && mouseX < 225+15 && 
    mouseY > 510 && mouseY < 510+15){
      state[i] = true;
      language = 99; type_num = 5;
    }
  }
  
  //clicking on function box
  for(int i = 0; i < 2; i++){
    if ( mouseX > 225 && mouseX < 225+15 && 
    mouseY > 510 + gap*i && mouseY < 510+gap*i+15) {
      if(func_num != i){func_num = i;}
      else{func_num = 2;}
    }    
  }
  
  //clicking on itemtype box
  for(int i = 0; i < 5; i++){
    if ( mouseX > 225 && mouseX < 225+15 && 
    mouseY > 585 + gap*i && mouseY < 585+gap*i+15) {
      state2[i] = true;
      if(type_num != i){
        type_num = i;
        func_num = 2;
      }
      else{type_num = 5;}
    }
    //click on RESET
    else if(mouseX > 225 && mouseX < 225+15 && 
    mouseY > 510 + gap && mouseY < 510+gap+15){
      state2[i] = false;
      language = 99; type_num = 5;
    }
    //click on OVERVIEW
    else if(mouseX > 225 && mouseX < 225+15 && 
    mouseY > 510 && mouseY < 510+15){
      state2[i] = true;
      language = 99; type_num = 5;
    }
  }
 
}

void keyPressed(){
  if(key == 'h' ||key == 'H'){hist = !hist;}
  if(key == 't' ||key == 'T'){time = !time;}
  if(key == 'p' ||key == 'P'){point = !point;}
  if(key == 's' ||key == 'S'){saveFrame("3d_visual.png");}
}
