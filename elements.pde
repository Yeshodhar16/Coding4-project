/*
class for the onscreen elements (like the signing buttons, etc.)
includes the clicked function, that allows you to click the buttons on the screen
*/
class elements
{
  float x;
  float y;
  int shapeID;
  color col;
  float w;
  float h;
  boolean clicked = false;

  elements(float _x, float _y, float _w, float _h, color _col)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    col = _col;
  }
  elements(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    col = color(0, 0, 255);
  }
  void render()
  {
    fill(col);
    rect(x, y, w, h);
  }

  boolean isClicked()
  {
    if (mousePressed && clicked == false)
    {
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
      {
        clicked = true;
        return true;
      }
    }
    return false;
  }
}
