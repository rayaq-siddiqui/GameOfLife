//datafields
Board b;
boolean looping = false;

//setup
void setup()
{
  size(1200, 700);
  surface.setResizable(false);
  frameRate(1);
  
  b = new Board(700);
  b.drawBoard();
}

//draw
void draw()
{
  if (looping)
  {
    b.drawBoard();
    b.drawMoveable();
  }
  
  
  //testing
  //b.drawBoard();
  //noLoop();
}

void mouseClicked()
{
  if (b.tiles[mouseX/20][mouseY/20].e.name == "Grey")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Green";
    b.tiles[mouseX/20][mouseY/20].drawTile();
  }
  else if (b.tiles[mouseX/20][mouseY/20].e.name == "Green")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Grey";
    b.tiles[mouseX/20][mouseY/20].drawTile();
  }
}

void mouseDragged()
{
  if (b.tiles[mouseX/20][mouseY/20].e.name == "Grey")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Green";
    b.tiles[mouseX/20][mouseY/20].drawTile();
  }
  else if (b.tiles[mouseX/20][mouseY/20].e.name == "Green")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Grey";
    b.tiles[mouseX/20][mouseY/20].drawTile();
  }
}

void keyPressed()
{
  if (key == ENTER && looping == false)
  {
    looping = true;
  }
  else if (key == ENTER && looping == true)
  {
    looping = false;
  }
}
