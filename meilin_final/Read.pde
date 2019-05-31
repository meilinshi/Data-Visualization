Table hategroup;
Table demographics;
Table states_coord;
int rows,numRows,nrow;

ArrayList <Group> groups = new ArrayList<Group>();
ArrayList <Demo> demos = new ArrayList <Demo>();
ArrayList <State> states = new ArrayList <State>();
ArrayList <Coord> coord = new ArrayList <Coord>();
ArrayList <Coord> cities = new ArrayList <Coord>();


void read(){
  hategroup = loadTable("splc-hate-groups-2018.csv","header");
  demographics = loadTable("demographics.csv","header");
  states_coord = loadTable("states.csv","header");
  rows = hategroup.getRowCount();
  numRows = demographics.getRowCount();
  nrow = states_coord.getRowCount();
  
  //load hategroups data
  for(int i = 0; i < rows; i++){
    String title = hategroup.getString(i,0);
    String city = hategroup.getString(i,1);
    String state = hategroup.getString(i,2);
    String ideology = hategroup.getString(i,4);
    groups.add(new Group(title,city,state,ideology));
  }
  
  //load demographics and city coordinates
  for(int i = 0; i < numRows; i++){
    String cityName = demographics.getString(i,0);
    String stateName = demographics.getString(i,2);
    int pop = demographics.getInt(i,4);
    float latitude = demographics.getFloat(i,5);
    float longitude = demographics.getFloat(i,6);
    demos.add(new Demo(cityName, stateName, pop,latitude,longitude));
  }
  
  //load states coordinates for those entries w/o city name
  for(int i = 0; i < nrow; i++){
    String state = states_coord.getString(i,0);
    float lat = states_coord.getFloat(i,1);
    float lon = states_coord.getFloat(i,2);
    states.add(new State(state, lat, lon));
  }  

}
