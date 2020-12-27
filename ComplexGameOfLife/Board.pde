class Board
{
  // datafields
  int rows, cols, size;
  Tile[][] tiles = new Tile[60][35];
  
  /* Position in the r/c
    [r, c]   [r+1, c]   [r+2, c]
    [r, c+1] [r+1, c+1] [r+2, c+1]
    [r, c+2] [r+1, c+2] [r+2, c+2]
  */
  
  //constructors
  Board(int size)
  {
    rows = 60; 
    cols = 35;
    this.size = size/cols;
    
    initializeTiles();  
  }
  
  //methods
  void initializeTiles()
  {
    for (int r = 0; r < rows; r++)
    {
      for (int c = 0; c < cols; c++)
      {
        // creating the tiles
        tiles[r][c] = new Tile(r, c, size);
        
        //initalizing grass tiles
        if (Math.random() < 0.01) 
        {
          tiles[r][c].e = new Element(0, 119, 190, "Water");
        }
        else if (Math.random() < 0.02) 
        {
          tiles[r][c].e = new Element(255, 255, 255, "Cow");
        }
        else 
        {
          tiles[r][c].e = new Element(34, 139, 34, "Grass");     // initializing Grass tiles
        }
      }
    }
  }
  
  void drawBoard()
  {
    for (int r = 0; r < rows; r++)
    {
      for (int c = 0; c < cols; c++)
      {
        tiles[r][c].drawTile();
      }
    }
  }
  
  boolean inRange(int row, int col, int evenDist, String searchElement)
  {
    for (int r = row - evenDist; r <= row + evenDist; r++)
    {
      for (int c = col - evenDist; c <= col + evenDist; c++)
      {
        if (r >= 0 && r <= 59 && c >= 0 && c <= 34)
        {
          if (tiles[r][c].e.name.equals(searchElement))
          {
            return true;
          }
        }
      }
    }
    
    return false;
  }
  
  void volcConvertRange(int row, int col, int evenDist, String element, int type)
  {
    for (int r = row - evenDist; r <= row + evenDist; r++)
    {
      for (int c = col - evenDist; c <= col + evenDist; c++)
      {
        if (r >= 0 && r <= 59 && c >= 0 && c <= 34)
        {
          tiles[r][c].e.newName = element;
          tiles[r][c].e.volcType = type; 
        }
      }
    }
  }
  
  int elementCounter(int row, int col, String element)
  {
    int counter = 0;
          
    if (row > 0) 
    {
      if (col > 0)
        if (tiles[row-1][col-1].e.name.equals(element)) counter++;
      
      if (col < 34)
        if (tiles[row-1][col+1].e.name.equals(element)) counter++;
      
      if (tiles[row-1][col].e.name.equals(element)) counter++;              
    }
    
    if (col > 0)
      if (tiles[row][col-1].e.name.equals(element)) counter++;
      
    if (col < 34)
      if (tiles[row][col+1].e.name.equals(element)) counter++;
    
    if (row < 59) 
    {
      if (col > 0)
        if (tiles[row+1][col-1].e.name.equals(element)) counter++;
      
      if (tiles[row+1][col].e.name.equals(element)) counter++;
      
      if (col < 34)
        if (tiles[row+1][col+1].e.name.equals(element)) counter++;
    }
    
    return counter;
  }
  
  void drawMoveable()
  {
    for (int r = 0; r < rows; r++) 
    {
      for (int c = 0; c < cols; c++)
      {
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Grass"))
        {
          int count = elementCounter(r, c, "Human");
          
          if (!inRange(r, c, 6, "Water"))
          {
            tiles[r][c].e.newName = "Dirt";
          }
          else if (count == 3) 
          {
            tiles[r][c].e.newName = "Human";          // changing colour
          }
          else if (Math.random() < 0.0003)
          {
            tiles[r][c].e.newName = "Water";
          }
          else if (Math.random() < 0.0003)
          {
            tiles[r][c].e.newName = "Cow";
          }
          else if (Math.random() < 0.00005)
          {
            tiles[r][c].e.newName = "Volcano";
          }
        }
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Human"))
        {       
          int count = elementCounter(r, c, "Human");
          
          if (count < 2 || count > 3) tiles[r][c].e.newName = "Grass";  // changing colour
          
          tiles[r][c].e.type++;
          
          if (inRange(r, c, 6, "Water") && inRange(r, c, 6, "Cow"))
          {
            tiles[r][c].e.type = 0;
          }
          
          if (tiles[r][c].e.type == 10)
          {
            tiles[r][c].e.newName = "Grass";
          }
        }
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Dirt"))
        {          
          if (inRange(r, c, 6, "Water"))
          {
            tiles[r][c].e.newName = "Grass";
          }
          else if (Math.random() < 0.0002)
          {
            tiles[r][c].e.newName = "Water";
          }
          else if (Math.random() < 0.00001)
          {
            tiles[r][c].e.newName = "Volcano";
          }
        }
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Water"))
        {          
          if (inRange(r, c, 1, "Human"))
          {
            tiles[r][c].e.newName = "Grass";
          }
        }
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Volcano"))
        {
          if (tiles[r][c].e.volcType == 0)
          {
            volcConvertRange(r, c, 5, "Volcano", 1);         
          }
          else if (tiles[r][c].e.volcType == 1)
          {
            // turn to dirt
            tiles[r][c].e.newName = "Dirt";
            tiles[r][c].e.type = 0;
          }
        }
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Cow"))
        {          
          if (!inRange(r, c, 6, "Grass") || !inRange(r, c, 6, "Water"))
          {
            tiles[r][c].e.newName = "Grass";
          }
          
          if (inRange(r, c, 1, "Human"))
          {
            tiles[r][c].e.newName = "Human";
          }
        }
      }
    }
  }
}
