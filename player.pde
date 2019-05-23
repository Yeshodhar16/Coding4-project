/*
player class
unimportant, not actually part of the code
the player classes were based off of this template
*/
class player
{
  String name;
  String pos;
  int att;
  int def;
  int total = att/def;

  player(String _name, String _pos, int _att, int _def, int _total)
  {
    name = _name;
    att = _att;
    def = _def;
    total = _total;
  }
}
