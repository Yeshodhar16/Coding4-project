int scene = 0;
int division = 0;
String teamname = "";
int goalcount = 0;
color col[] = new color[5];
/*
GF = Goals For
GA = Goals Against
GD = Goal Difference
*/
int GF = 0;
int GA = 0;
int GD = 0;
/*
Averages for each position
*/
int OffAvg = 0;
int MidAvg = 0;
int DefAvg = 0;

boolean transferWindow = false;

int totalAtt = 0;
int totalDef = 0;
int lastGA = 0;
int TeamAvg = 0;

elements signAttacker;
elements signMid;
elements signDef;
elements counter;
elements timer;
elements teamSpace;

ArrayList <Attackers> offence =  new ArrayList <Attackers>();
ArrayList <Midfielders> mid = new ArrayList <Midfielders>();
ArrayList <Defenders> defence = new ArrayList <Defenders>();
ArrayList <Goalkeepers> gk = new ArrayList <Goalkeepers>();

String[] names;
int seasonNo = 1;
int divNo = 0;
int reqdiff = 0;

int seasonTime = 30000;

void setup()
{
  names = loadStrings("playernames.txt");
  fullScreen();
  textSize(30);
  noStroke();
  
  //sets up the team players
  offence.add(new Attackers((int)random(30, 100), (int)random(70), 0, names[(int)random(0, names.length)]));
  offence.add(new Attackers((int)random(30, 100), (int)random(70), 0, names[(int)random(0, names.length)]));

  mid.add(new Midfielders((int)random(20, 100), (int)random(20, 100), 0, names[(int)random(0, names.length)]));
  mid.add(new Midfielders((int)random(20, 100), (int)random(20, 100), 0, names[(int)random(0, names.length)]));
  mid.add(new Midfielders((int)random(20, 100), (int)random(20, 100), 0, names[(int)random(0, names.length)]));
  mid.add(new Midfielders((int)random(20, 100), (int)random(20, 100), 0, names[(int)random(0, names.length)]));

  defence.add(new Defenders((int)random(70), (int)random(30, 100), 0, names[(int)random(0, names.length)]));
  defence.add(new Defenders((int)random(70), (int)random(30, 100), 0, names[(int)random(0, names.length)]));
  defence.add(new Defenders((int)random(70), (int)random(30, 100), 0, names[(int)random(0, names.length)]));
  defence.add(new Defenders((int)random(70), (int)random(30, 100), 0, names[(int)random(0, names.length)]));

  gk.add(new Goalkeepers((int)random(30, 100), (int)random(50), 0, names[(int)random(0, names.length)]));

  col[0] = color(255, 0, 0);
  col[1] = color(140, 140, 140);
  col[2] = color(0, 0, 0);
  col[3] = color(0, 255, 0);
  col[4] = color(0, 0, 255);
  
  //Draws the sign player buttons
  signAttacker = new elements(0, 0, width/5, height/3, col[0]);
  signMid = new elements(0, height/3, width/5, height/3, col[3]);
  signDef = new elements(0, 2*height/3, width/5, height/3, col[4]);
  teamSpace = new elements(0.2*width, height/6, 0.5*width, height, col[1]);
}

void draw()
{
  if (scene == 0)
  {
    //startup scene w/ enter name
    textAlign(CENTER);
    background(0);
    textSize(50);
    fill(255, 255, 255);
    text("Enter Team Name", width/2, (height/2)-200);
    text(teamname, width/2, height/2);
  } else if (1 == scene)
  {
    // pick country scene, the country name doesn't actually change anything yet
    textAlign(CENTER);
    background(0);
    textSize(50);
    fill(0, 255, 0);
    text("Pick Country", width/2, (height/2)-400);
    fill(255, 0, 0);
    text("ITALY", width/4, height/2);
    fill(255, 255, 255);
    text("ENGLAND", 3*width/4, height/2);
  } else if (scene == 2)
  {
    //Italy picked
    background(0);
    textAlign(CENTER);
    text("COUNTRY CHOSEN: ITALY", width/2, height/2);
    textAlign(LEFT);
    text("Press 'enter' to continue", 0, height);
  } else if (scene == 3)
  {
    //England picked
    background(0);
    textAlign(CENTER);
    text("COUNTRY CHOSEN: ENGLAND", width/2, height/2);
    textAlign(LEFT);
    text("Press 'enter' to continue", 0, height);
  } else if (4<=scene)
  {
    //actual game homescreen, w/ all the buttons displayed
    background(0);
    textSize(32);
    textAlign(LEFT);

    totalDef = 0;
    totalAtt = 0;

    //offence.get(0).render();
    OffAvg = 0;
    MidAvg = 0;
    DefAvg = 0;
    TeamAvg = 0;
    //calculates the offensive/defensive averages and totals (for ratings)
    for (int i = 0; i < 2; i++)
    {
      OffAvg += offence.get(i).total;
      totalAtt += (offence.get(i).att)*1.4;
      totalDef += (offence.get(i).def)*0.2;
    }
    for (int i = 0; i < 4; i++)
    {
      MidAvg += mid.get(i).total;
      totalAtt += (mid.get(i).att)*0.95;
      totalDef += (mid.get(i).def)*0.75;
    }
    for (int i = 0; i < 4; i++)
    {
      DefAvg += defence.get(i).total;
      totalAtt += (defence.get(i).att)*0.3;
      totalDef += (defence.get(i).def)*0.9;
    }
    DefAvg += gk.get(0).total;
    totalAtt += (gk.get(0).att)*0.1;
    totalDef += (gk.get(0).def)*1.2;
    OffAvg = OffAvg/2;
    MidAvg = MidAvg/4;
    DefAvg = DefAvg/5;

    TeamAvg = (int)(OffAvg + MidAvg + DefAvg)/3;
    
    //renders the different elements on the screen
    signAttacker.render();
    signMid.render();
    signDef.render();
    teamSpace.render();
    otherelements();
    midfielders();
    defenders();
    attackers();
    goalkeepers();
    fill(255, 255, 255);
    text("sign attacker", 0, height/3-10);
    text("sign midfielder", 0, 2*height/3-10);
    text("sign defender", 0, height-10);
    text(teamname, 0.2*width, height/6-10);
    textSize(50);
    text("season number :" + seasonNo, 0.75*width, 0.2*height);
    textSize(100);
    textAlign(CENTER);
    //season timer
    text(seasonTime/1000 -millis()/1000, 0.85*width, 0.65*height);
    int index = -1;
    int low  = 999;
    
    //transfer window setup
    if (transferWindow == true)
    {
      //in the transfer window, the lowest rated player in the chosen position is replaced by the signed player. the signed player may be worse than the replaced one
      textAlign(LEFT);
      text("TRANSFER WINDOW", 0.2*width, height/6);
      if (seasonTime/1000-millis()/1000 <= 60)
      {
        transferWindow = false;
        GF =0;
        GA =0;
      }
      //sign striker
      if (15 <= GF)
      {
        if (signAttacker.isClicked()==true)
        {
          offence.add(new Attackers((int)random(30, 100), (int)random(70), 0, names[(int)random(0, names.length)]));
          for (int i = 0; i<2; i++)
          {
            if (offence.get(i).total<low)
            {
              low = offence.get(i).total;
              index = i;
            }
          }

          Attackers temp = offence.get(index);
          offence.set(index, offence.get(offence.size()-1));
          GF = GF-15;
        }
        //sign defender/goalkeeper
        if (signDef.isClicked() == true)
        {
          for (int i = 0; i < 4; i++)
          {
            if (defence.get(i).total<low)
            {
              low = defence.get(i).total;
              index = i;
            }
          }
          if (gk.get(0).total < defence.get(index).total)
          {
            gk.add(new Goalkeepers((int)random(40), (int)random(30, 100), 0, names[(int)random(0, names.length)]));
            Goalkeepers temp = gk.get(0);
            gk.set(0, gk.get(gk.size()-1));
            GF = GF-15;
          } else if (defence.get(index).total <= gk.get(0).total)
          {
            defence.add(new Defenders((int)random(70), (int)random(30, 100), 0, names[(int)random(0, names.length)]));
            Defenders temp = defence.get(index);
            defence.set(index, defence.get(defence.size()-1));
            GF= GF-15;
          }
          //Defenders temp = defence.get(index);
          //defence.set(index, defence.get(defence.size()-1));
          //GF = GF-15;
          //if(gk.get(0).total < defence.get(index).total)
          //{
          //  Goalkeepers temp = gk.get(0);
          //  gk.set(0,gk.get(gk.size()-1));
          //  GF = GF-15;
          //}
          //else
          //{
          //  Defenders temp = defence.get(index);
          //  defence.set(index,defence.get(defence.size()-1));
          //}
        }
        //sign midfielder
        if (20<= GF)
        {
          if (signMid.isClicked()==true)
          {
            mid.add(new Midfielders((int)random(20, 100), (int)random(20, 100), 0, names[(int)random(0, names.length)]));
            for (int i = 0; i < 4; i++)
            {
              if (mid.get(i).total < low)
              {
                low = mid.get(i).total;
                index = i;
              }
            }

            Midfielders temp = mid.get(index);
            mid.set(index, mid.get(mid.size()-1));
            GF = GF-20;
          }
        }
      }
    }
    if (seasonTime/1000 -millis()/1000 < 0)
    {
      transferWindow = true;
      seasonTime = millis() + 90000;
      seasonNo++;
      if (transferWindow == false)
      {
        //player upgrade by +2 every season
        for (int i = 0; i<2; i++)
        {
          println(offence.get(i).att);
          offence.get(i).att += 2;
          offence.get(i).recalc();
          println(offence.get(i).att);
          totalAtt += (offence.get(i).att)*1.4;
          totalDef += (offence.get(i).def)*0.2;
        }
        for (int i = 0; i<4; i++)
        {
          mid.get(i).att += 2;
          mid.get(i).def += 2;
          mid.get(i).recalc();
          totalAtt += (mid.get(i).att)*0.95;
          totalDef += (mid.get(i).def)*0.75;
        }
        for (int i = 0; i<4; i++)
        {
          defence.get(i).def += 2;
          defence.get(i).recalc();
          totalAtt += (mid.get(i).att)*0.95;
          totalDef += (mid.get(i).def)*0.75;
        }
        gk.get(0).def += 2;
        gk.get(0).recalc();
        totalAtt += (gk.get(0).att)*0.1;
        totalDef += (gk.get(0).def)*1.2;
        //reset goals
        GA = 0;
        GF = 0;
      }
    }
    //goals scored/against per time
    if (transferWindow == false)
    {
      //edit the number in the if() statement to change the number of seconds for each goal addition
      if (5000 < millis() - lastGA)
      {
        lastGA = millis();
        //goals against calculation
        GA += 50-0.01*totalDef;
        //goals for calculation
        GF += totalAtt/10;
        //Goal Diff.
        GD = GF - GA;
      }
    }
    textAlign(LEFT);
    textSize(50);
    fill(0, 0, 0);
    text((int)GF, 0.7*width, height/2-10);
    text((int)GA, 0.7*width+150, height/2-10);
    GD = GF - GA;
    text((int)GD, 0.9*width, height/2-10);
    textSize(50);
    text("GF", 0.7*width, height/2-150);
    text("GA", 0.7*width+150, height/2-150);
    text("GD", 0.7*width+450, height/2-150);
    fill(255, 255, 255);
    text("totalAtt =" + totalAtt, 0.7*width, 0.8*height);
    //text("midAvg = " + MidAvg, 0.7*width, 0.9*height);
    text("totalDef =" + totalDef, 0.7*width, height);
    textMode(CENTER);
    textSize(100);
    fill(255, 0, 255);
    text("OVR", 0.89*width, height-180);
    text(TeamAvg, 0.91*width, height-50);
  }
}


void otherelements()
{
  //fill(255, 0, 0);
  //rect(0, 0, width/5, height/3);
  //fill(0, 255, 0);
  //rect(0, height/3, width/5, height/3);
  //fill(0, 0, 255);
  //rect(0, 2*height/3, width/5, height/3);
  //fill(140, 140, 140);
  //rect(0.2*width, height/6, 0.5*width, height);
  fill(0, 0, 255);
  rect(0.2*width, 0, 0.5*width, height/6);
  fill(255, 0, 0);
  rect(0.7*width, 0, 0.3*width, height/4);
  fill(0, 255, 0);
  rect(0.7*width, height/4, 0.3*width, height/4);
  fill(0, 0, 255);
  rect(0.7*width, 0.5*height, 0.3*width, height/4);
}

void midfielders()
{
  //draws the midfielders
  fill(0, 255, 0);
  ellipse(0.3875*width, 0.6*height, 35, 35);
  ellipse(0.5125*width, 0.6*height, 35, 35);
  ellipse(0.2625*width, 0.45*height, 35, 35);
  ellipse(0.638*width, 0.45*height, 35, 35);

  mid.get(0).showTotal(0.3875*width, 0.6*height);
  mid.get(0).showName(0.3875*width, 0.6*height);

  mid.get(1).showTotal(0.5125*width, 0.6*height);
  mid.get(1).showName(0.5125*width, 0.6*height);

  mid.get(2).showTotal(0.2625*width, 0.45*height);
  mid.get(2).showName(0.2625*width, 0.45*height);

  mid.get(3).showTotal(0.638*width, 0.45*height);
  mid.get(3).showName(0.638*width, 0.45*height);
}

void defenders()
{
  
  //draw defenders
  fill(0, 255, 255);
  ellipse(0.3875*width, 0.8*height, 35, 35);
  ellipse(0.5125*width, 0.8*height, 35, 35);
  ellipse(0.2625*width, 0.7*height, 35, 35);
  ellipse(0.638*width, 0.7*height, 35, 35);

  defence.get(0).showTotal(0.5125*width, 0.8*height);
  defence.get(0).showName(0.5125*width, 0.8*height);

  defence.get(1).showTotal(0.3875*width, 0.8*height);
  defence.get(1).showName(0.3875*width, 0.8*height);

  defence.get(2).showTotal(0.2625*width, 0.7*height);
  defence.get(2).showName(0.2625*width, 0.7*height);


  defence.get(3).showTotal(0.638*width, 0.7*height);
  defence.get(3).showName(0.638*width, 0.7*height);
}

void attackers()
{
  
  //draw attackers
  fill(255, 0, 0);
  ellipse(0.5125*width, 0.25*height, 35, 35);
  ellipse(0.3875*width, 0.25*height, 35, 35);
  if (offence.size()>0)
  {
    offence.get(0).showTotal(0.5125*width, 0.25*height);
    offence.get(0).showName(0.5125*width, 0.25*height);
  }
  if (offence.size()>1)
  {
    offence.get(1).showTotal(0.3875*width, 0.25*height);
    offence.get(1).showName(0.3875*width, 0.25*height);
  }
}


void goalkeepers()
{
  
  //draw goalkeepers
  fill(255, 255, 0);
  ellipse(0.45*width, 0.9*height, 35, 35);
  if (gk.size()>0)
  {
    gk.get(0).showTotal(0.45*width, 0.9*height);
    gk.get(0).showName(0.45*width, 0.9*height);
  }
}
void keyReleased()
{
  if (scene == 0)
  {
    teamname += key;
    if (keyCode == ENTER)
    {
      scene++;
    }
    if (keyCode == BACKSPACE)
    {
      teamname = teamname.substring(0, teamname.length()-2);
    }

    text(teamname, width/2, height/2);
  }

  if (scene == 2)
  {
    if (keyCode == ENTER)
    {
      scene = scene+2;
    }
  } else if (scene == 3)
  {
    scene++;
  }
}

void mouseReleased()
{
  signAttacker.clicked = false;
  signMid.clicked = false;
  signDef.clicked = false;

  if (scene == 1)
  {
    if (mouseX < width/2)
    {
      textAlign(LEFT);
      fill(255, 0, 0);
      textSize(70);
      scene++;
    } else if (width/2 < mouseX)
    {
      textAlign(LEFT);
      fill(255, 255, 255);
      textSize(70);
      text("COUNTRY CHOSEN: ENGLAND", 0, 0);
      scene=scene+2;
    }
  }
}
