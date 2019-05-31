boolean[] state = {true, true, true, true, true, true, true, true, true, true,
                  true, true, true, true, true};  
                  
void controlEvent(ControlEvent event){
  //click on overview
  if(event.isFrom(checkbox1)){
    if(checkbox1.getState(0)){
      checkbox2.activateAll();
      myTextarea.setText("Description");
      myTextarea.setHeight(25);
    }
    else
      checkbox2.deactivateAll();
  }
  
  //click on ideology
  if(event.isFrom(checkbox2)){
    for(int i = 0; i < ideo.length; i++){
      if(checkbox2.getState(i)){
        state[i] = true;
        myTextarea.setHeight(designHeight[i]);
        myTextarea.setText("Description" +"\n"+"\n"+description[i]);       
      }
      else{
        state[i] = false;
      }
    }
    if(!(checkbox2.getState(0)||checkbox2.getState(1)||checkbox2.getState(2)||checkbox2.getState(3)||checkbox2.getState(4)||
    checkbox2.getState(5)||checkbox2.getState(6)||checkbox2.getState(7)||checkbox2.getState(8)||checkbox2.getState(9)||
    checkbox2.getState(10)||checkbox2.getState(11)||checkbox2.getState(12)||checkbox2.getState(13)||checkbox2.getState(14))){
      checkbox1.deactivate(0);
      myTextarea.setText("Description");
      myTextarea.setHeight(25);
    }
  }
}

void keyPressed(){
  if(key == 's' ||key == 'S'){saveFrame("screenshot.png");}
}
