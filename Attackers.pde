/*
Attackers class
Generates and renders strikers
Strikers named and placed in main code
*/
class Attackers
{
  int att = (int)random(30, 100);
  int def = (int)random(70);
  String name = "";
  int total = (int)(((49*att)+def)/50);

  Attackers(int _att, int _def, int total, String _name)
  {
    att = _att;
    def = _def;
    total = (int)(((49*att)+def)/50);
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
    total = (int)(((49*att)+def)/50);
  }

  void signatt()
  {
  }
}
