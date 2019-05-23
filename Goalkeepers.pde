/*
Goalkeepers class
Generates and renders goalkeepers
named and placed in main
*/
class Goalkeepers
{
  int att = (int)random(40);
  int def = (int)random(30, 100);
  int total = ((199*def)+att)/200;
  String name = "";

  Goalkeepers(int _att, int _def, int _total, String _name)
  {
    att = _att;
    def = _def;
    total = ((199*def)+att)/200;
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
    total = ((199*def)+att)/200;
  }

  void signgk()
  {
  }
}
