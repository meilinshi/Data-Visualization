Table bookcount,keeptime,item;
int numRows, numCols;
int rows,cols;
int item_row, item_col;
float r,x,y,z;
float max = 0;
float[] maxCount = {0,0,0,0,0,0,0,0,0,0};  
ArrayList <Item> items = new ArrayList<Item>();

float[][] data_matrix,time_matrix,item_matrix;

void read(){
  bookcount = loadTable("bookcount.csv","header");
  keeptime = loadTable("keeptime.csv","header");
  item = loadTable("popular.csv","header");
  
  numRows = bookcount.getRowCount();
  numCols = bookcount.getColumnCount();
  rows = keeptime.getRowCount();
  cols = keeptime.getColumnCount();
  item_row = item.getRowCount();
  item_col = item.getColumnCount();
  
  println("numRows: " + numRows);
  println("numCols: " + numCols);
  println("rows: " + rows);
  println("cols: " + cols);
  println("item_row: " + item_row);
  println("item_col: " + item_col);
  
  data_matrix = new float [numCols-2][numRows];
  for(int i = 0; i < numCols-2 ; i++){
    for(int j = 0; j < numRows; j++){
      data_matrix[i][j] = 20*log(bookcount.getFloat(j,i+2));
      //data_matrix[i][j] = bookcount.getFloat(j,i+2);
    }
  }
  
  for(int i = 0; i < numCols-2 ; i++){
    for(int j = 0; j < numRows; j++){
      if (exp(data_matrix[i][j]/20) > maxCount[i]){
        maxCount[i] = exp(data_matrix[i][j]/20);
      }
    }
  }
  println("the max of english is: " + maxCount[9]);
      
  
  time_matrix = new float[cols-2][rows];
  for(int i = 0; i < cols-2;i++){
    for(int j = 0; j < rows; j++){
      time_matrix[i][j] = keeptime.getFloat(j,i+2);
    }
  }
    
  item_matrix = new float[cols-4][rows];
  for(int i = 0; i < cols-4; i++){
    for(int j = 0; j < rows; j++){
      item_matrix[i][j] = item.getFloat(j,i+4);
    }
  }
  
  for(int i = 0; i < item_row; i++){
    String title = item.getString(i,0);
    String itemtype = item.getString(i,1);
    float dewey = item.getFloat(i,2);
    int count = item.getInt(i,3);
    float r = 200;                              
    float x = random(-(r-10), r-10); 
    float y = random(-sqrt((sq(r)-sq(x))), sqrt((sq(r)-sq(x)))); 
    float z = random(-sqrt((sq(r)-sq(x)-sq(y))), sqrt((sq(r)-sq(x)-sq(y))));
    items.add(new Item(title, itemtype, dewey, count,x,y,z));
    max = max(max, item.getFloat(i,3));
  }
}
