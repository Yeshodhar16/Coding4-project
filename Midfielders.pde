/*
Midfielders class
generates and renders midfielders
named and placed in main code
*/
class Midfielders
{
  int att = (int)random(20, 100);
  int def = (int)random(20, 100);
  int total = 0;
  {
    if (att < def)
    {
      total = ((3*att)+def)/4;
    } else if (def < att)
    {
      total = (att+(3*def))/4;
    } else if (def == att)
    {
      total = (att + def)/2;
    }
  }
  String name = "";
  Midfielders(int _att, int _def, int _total, String _name)
  {
    att = _att;
    def = _def;
    if (att < def)
    {
      total = ((3*att)+def)/4;
    } else if (def < att)
    {
      total = (att+(3*def))/4;
    } else if (def == att)
    {
      total = (att + def)/2;
    };
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
    if (att < def)
    {
      total = ((3*att)+def)/4;
    } else if (def < att)
    {
      total = (att+(3*def))/4;
    } else if (def == att)
    {
      total = (att + def)/2;
    }
  }

  void signmid()
  {
  }
}
