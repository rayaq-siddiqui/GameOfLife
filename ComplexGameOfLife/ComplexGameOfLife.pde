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
  // if clicked on Grass tile, it will turn human
  if (b.tiles[mouseX/20][mouseY/20].e.name == "Grass")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Human";
    b.tiles[mouseX/20][mouseY/20].drawTile();
  }
  
  // if clicked on green tile, it will turn Grass
  else if (b.tiles[mouseX/20][mouseY/20].e.name == "Human")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Grass";
    b.tiles[mouseX/20][mouseY/20].drawTile();
  }
}

void mouseDragged()
{
  // if clicked on Grass tile, it will turn green
  if (b.tiles[mouseX/20][mouseY/20].e.name == "Grass")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Human";
    b.tiles[mouseX/20][mouseY/20].drawTile();
  }
  
  // if clicked on human tile, it will turn Grass
  else if (b.tiles[mouseX/20][mouseY/20].e.name == "Human")
  {
    b.tiles[mouseX/20][mouseY/20].e.newName = "Grass";
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
