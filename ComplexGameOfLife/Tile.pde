class Tile
{
  // data fields
  Element e;
  int row, col, size;
  PVector loc;
  
  // constructors
  Tile(int row, int col, int size)
  {
    this.row = row;
    this.col = col;
    this.size = size;
    
    loc = new PVector(row*size, col*size);
  }
  
  //methods
  void drawTile()
  {
    updateColor();
    
    fill(e.r, e.g, e.b);
    
    rectMode(CORNER);
    rect(loc.x, loc.y, size, size);
  }
  
  void updateColor()
  {
    if (e.newName == "Grass") 
    {
      e.r = 34;
      e.g = 139;
      e.b = 34;

      e.name = e.newName;
      e.newName = "";
    }
    
    if (e.newName == "Human") 
    {
      e.r = 224;
      e.g = 172;
      e.b = 105;

      e.name = e.newName;
      e.newName = "";
    }
    
    if (e.newName == "Water")
    {
      e.r = 0;
      e.g = 119;
      e.b = 190;
      
      e.name = e.newName;
      e.newName = "";
    }
    
    if (e.newName == "Dirt")
    {
      e.r = 155;
      e.g = 118;
      e.b = 83;
      
      e.name = e.newName;
      e.newName = "";
    }
    
    if (e.newName == "Volcano")
    {
      e.r = 238;
      e.g = 58;
      e.b = 21;
      
      e.name = e.newName;
      e.newName = "";
    }
    
    if (e.newName == "Cow")
    {
      e.r = 255;
      e.g = 255;
      e.b = 255;
      
      e.name = e.newName;
      e.newName = "";
    }   
  }
}
