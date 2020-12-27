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
        
        //initalizing elements
        tiles[r][c].e = new Element(128, 128, 128, "Grey");
      }
    }
    
    //for (int i = 26; i < 29; i++)
    //{
    //  tiles[i][17].e.r = 0;
    //  tiles[i][17].e.g = 255;
    //  tiles[i][17].e.b = 0;
    //  tiles[i][17].e.name = "Green";
    //}
    
    //tiles[27][18].e.r = 0;
    //tiles[27][18].e.g = 255;
    //tiles[27][18].e.b = 0;
    //tiles[27][18].e.name = "Green";
    
    //tiles[26][16].e.r = 0;
    //tiles[26][16].e.g = 255;
    //tiles[26][16].e.b = 0;
    //tiles[26][16].e.name = "Green";
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
  
  void drawMoveable()
  {
    for (int r = 0; r < rows; r++)
    {
      for (int c = 0; c < cols; c++)
      {
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Grey"))
        {
          int greenCounter = 0;
          
          if (r > 0) 
          {
            if (c > 0)
              if (tiles[r-1][c-1].e.name.equals("Green")) greenCounter++;
            
            if (c < 34)
              if (tiles[r-1][c+1].e.name.equals("Green")) greenCounter++;
            
            if (tiles[r-1][c].e.name.equals("Green")) greenCounter++;              
          }
          
          if (c > 0)
            if (tiles[r][c-1].e.name.equals("Green")) greenCounter++;
            
          if (c < 34)
            if (tiles[r][c+1].e.name.equals("Green")) greenCounter++;
          
          if (r < 59) 
          {
            if (c > 0)
              if (tiles[r+1][c-1].e.name.equals("Green")) greenCounter++;
            
            if (tiles[r+1][c].e.name.equals("Green")) greenCounter++;
            
            if (c < 34)
              if (tiles[r+1][c+1].e.name.equals("Green")) greenCounter++;
          }
          
          if (greenCounter == 3) tiles[r][c].e.newName = "Green";
        }
//******************************************************************************************************************************************************
        if (tiles[r][c].e.name.equals("Green"))
        {
          int greenCounter = 0;
          
          if (r > 0) 
          {
            if (c > 0)
              if (tiles[r-1][c-1].e.name.equals("Green")) greenCounter++;
            
            if (c < 34)
              if (tiles[r-1][c+1].e.name.equals("Green")) greenCounter++;
            
            if (tiles[r-1][c].e.name.equals("Green")) greenCounter++;              
          }
          
          if (c > 0)
            if (tiles[r][c-1].e.name.equals("Green")) greenCounter++;
            
          if (c < 34)
            if (tiles[r][c+1].e.name.equals("Green")) greenCounter++;
          
          if (r < 59) 
          {
            if (c > 0)
              if (tiles[r+1][c-1].e.name.equals("Green")) greenCounter++;
            
            if (tiles[r+1][c].e.name.equals("Green")) greenCounter++;
            
            if (c < 34)
              if (tiles[r+1][c+1].e.name.equals("Green")) greenCounter++;
          }
          
          if (greenCounter < 2 || greenCounter > 3) tiles[r][c].e.newName = "Grey";
          println(greenCounter);
          println(tiles[r][c].e.newName);
        }
      }
    }
  }
}
