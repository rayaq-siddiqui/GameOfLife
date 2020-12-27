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
    if (e.newName == "Grey") 
    {
      e.r = 128;
      e.g = 128;
      e.b = 128;
      
      e.name = e.newName;
      e.newName = "";
    }
    
    if (e.newName == "Green") 
    {
      e.r = 0;
      e.g = 255;
      e.b = 0;
      
      e.name = e.newName;
      e.newName = "";
    }
  }
}
