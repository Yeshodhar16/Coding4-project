/*
Defenders class
Generates and Renders defenders
named and placed in the main code
*/
class Defenders
{
  String name = "";
  int att = (int)random(70);
  int def = (int)random(30, 100);
  int total = (int)((att+(49*def))/50);


  Defenders(int _att, int _def, int _total, String _name)
  {
    att = _att;
    def = _def;
    total = (int)((att+(49*def))/50);
    name = _name;
  }

  void showTotal(float _x, float _y)
  {
    textAlign(CENTER);
    fill(0, 0, 0);
    textSize(25);
    text(total, _x, _y+10);
    textAlign(LEFT);
    textSize(30);
  }

  void showName(float x1, float y1)
  {
    textAlign(CENTER);
    fill(0, 0, 0);
    textSize(25);
    text(name, x1, y1+40);
    textAlign(LEFT);
    textSize(30);
  }

  void recalc()
  {
    total = (int)((att+(49*def))/50);
  }

  void signdef()
  {
  }
}
