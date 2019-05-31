CheckBox checkbox1, checkbox2; 
DropdownList ddl;
Textarea myTextarea;
int[] designHeight = {150,200,225,215,175,120,225,
                      165,150,170,85,200,150,185,200};

void GUI(){
  cp5 = new ControlP5(this);
  
  //add checkbox for overview
  checkbox1 = cp5.addCheckBox("checkBox1")
    .setPosition(width-250-2, height-425)
    .setSize(24, 24)
    .setColorForeground(color(100))
    .setColorBackground(color(200))
    .setColorActive(color(50))
    .setItemsPerRow(1)
    .setSpacingColumn(50) 
    .setSpacingRow(5)
    .addItem("Overview", 1)
    .setColorLabel(30)
    .activate(0)
    ;
  checkbox1.getItem(0).setFont(createFont("SansSerif-24.vlw",16));

  //add checkbox for ideology
  checkbox2 = cp5.addCheckBox("checkbox2")
    .setPosition(width-250, height-390)
    .setSize(20, 20)
    .setItemsPerRow(1)
    .setSpacingColumn(20)
    .setSpacingRow(5)
    .setCaptionLabel("ideology")
    .setColorLabel(30)
    ;

  for (int i = 0; i < ideo.length; i++){
    checkbox2.addItem(ideo[i], i);
  };
  for (int i = 0; i< ideo.length; i++){
    checkbox2.getItem(i).setColorForeground(clr[i]);
    checkbox2.getItem(i).setColorBackground(color(clr[i],100));
    checkbox2.getItem(i).setColorActive(clr[i]);
    checkbox2.getItem(i).setFont(createFont("SansSerif-24.vlw",14));
    checkbox2.toUpperCase(false);
    checkbox2.activate(i);  
  }
  
  //add text place for description
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(width-370,25)
                  .setSize(350,280)
                  .setLineHeight(20)
                  .setHeight(25)
                  .setColorBackground(color(40,100))
                  .setColorForeground(color(40,100))
                  .setFont(createFont("SansSerif-24.vlw",16))
                  .setText("Description")
                  .setColor(0)
                  ;
               
  
  cp5.setAutoDraw(false);
}
