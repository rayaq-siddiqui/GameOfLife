class Element
{
  // data fields
  int r, g, b;
  String name, newName;
  int type, volcType;
  
  // constructor
  Element(int r, int g, int b, String name)
  {
    this.name = name;
    newName = "";
    this.r = r;
    this.g = g;
    this.b = b;
    type = 0;
    volcType = 0;
  }
}
