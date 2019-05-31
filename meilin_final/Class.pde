class Group{
  String title;
  String city;
  String state;
  String ideology;
  
  Group(String title, String city, String state, String ideology){
    this.title = title;
    this.city = city;
    this.state = state;
    this.ideology = ideology;
  }
}

class Demo{
  String cityName;
  String stateName;
  int pop;
  float latitude;
  float longitude;
  
  Demo(String cityName,String stateName,int pop,float latitude,float longitude){
    this.cityName = cityName;
    this.stateName = stateName;
    this.pop = pop;
    this.latitude = latitude;
    this.longitude = longitude;
  }
}

class State{
  String state;
  float lat;
  float lon;
  
  State(String state, float lat, float lon){
    this.state = state;
    this.lat = lat;
    this.lon = lon;
  }
}

class Coord{
  float x;
  float y;
  float z;
  String s;
  
  Coord(float x, float y, float z, String s){
    this.x = x;
    this.y = y;
    this.z = z;
    this.s = s;
  }
}
