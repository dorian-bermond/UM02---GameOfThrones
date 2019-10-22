//Balls information
  //Variables
float[] linkCoordinates = new float[8] ; //x1, y1... x4, y4
  //Defined
int TYPICAL_BALL_SIZE = 40 ;
//int MAX_LINK_DISTANCE = int(2 * typicalBallSize) ;
String INDICATOR = "score" ;
int MIN_SIZE = 75 ;
int MAX_SIZE = 150 ;
int SPEED = 3 ;
float HALF_INVERTED_SQRT2 = 1 / (2 * sqrt(2)) ;
ArrayList<String> urls = new ArrayList<String>() ;
int MAX_NUMBER_OF_CHARACTERS = 30 ;
float MAX_LINK_DISTANCE_COEF = 2 ;
float BORDER_SIZE_COEF = 0.1 ;

int currentIndex = 0 ;
Table table ;

class House 
{
  int[] borderColor ;
  //int borderColorG ;
  //int borderColorB ;
  int[] fillColor ;
  //int fillColorG ;
  //int fillColorB ;
  boolean active ;

  House ()
  {
    borderColor = new int[3] ;
    fillColor = new int[3] ;
    active = true ;
  }
}

House sta, arr, lan, tyr, gre, mar, bar, tar, tul, oth ;

void initHouses()
{
  int[] greyClr = {100, 100, 100} ;
  int[] whiteClr = {255, 255, 255} ;
  int[] blueClr = {21, 102, 255} ;
  int[] redClr = {153, 0, 0} ;
  int[] yellowClr = {255, 204, 0} ;
  int[] greenClr = {51, 102, 0} ;
  int[] blackClr = {0, 0, 0} ;

  //House Stark
  sta = new House() ;
  sta.borderColor[0] = greyClr[0] ;
  sta.borderColor[1] = greyClr[1] ;
  sta.borderColor[2] = greyClr[2] ;
  sta.fillColor[0] = whiteClr[0] ;
  sta.fillColor[1] = whiteClr[1] ;
  sta.fillColor[2] = whiteClr[2] ;
  //House Arryn
  arr = new House() ;
  arr.borderColor[0] = blueClr[0] ;
  arr.borderColor[1] = blueClr[1] ;
  arr.borderColor[2] = blueClr[2] ;
  arr.fillColor[0] = whiteClr[0] ;
  arr.fillColor[1] = whiteClr[1] ;
  arr.fillColor[2] = whiteClr[2] ;
  //House Lannister
  lan = new House() ;
  lan.borderColor[0] = redClr[0] ;
  lan.borderColor[1] = redClr[1] ;
  lan.borderColor[2] = redClr[2] ;
  lan.fillColor[0] = yellowClr[0] ;
  lan.fillColor[1] = yellowClr[1] ;
  lan.fillColor[2] = yellowClr[2] ;
  //House Tyrell
  tyr = new House() ;
  tyr.borderColor[0] = greenClr[0] ;
  tyr.borderColor[1] = greenClr[1] ;
  tyr.borderColor[2] = greenClr[2] ;
  tyr.fillColor[0] = yellowClr[0] ;
  tyr.fillColor[1] = yellowClr[1] ;
  tyr.fillColor[2] = yellowClr[2] ;
  //House Greyjoy
  gre = new House() ;
  gre.borderColor[0] = blackClr[0] ;
  gre.borderColor[1] = blackClr[1] ;
  gre.borderColor[2] = blackClr[2] ;
  gre.fillColor[0] = yellowClr[0] ;
  gre.fillColor[1] = yellowClr[1] ;
  gre.fillColor[2] = yellowClr[2] ;
  //House Martell
  mar = new House() ;
  mar.borderColor[0] = yellowClr[0] ;
  mar.borderColor[1] = yellowClr[1] ;
  mar.borderColor[2] = yellowClr[2] ;
  mar.fillColor[0] = redClr[0] ;
  mar.fillColor[1] = redClr[1] ;
  mar.fillColor[2] = redClr[2] ;
  //House Baratheon
  bar = new House() ;
  bar.borderColor[0] = yellowClr[0] ;
  bar.borderColor[1] = yellowClr[1] ;
  bar.borderColor[2] = yellowClr[2] ;
  bar.fillColor[0] = greyClr[0] ;
  bar.fillColor[1] = greyClr[1] ;
  bar.fillColor[2] = greyClr[2] ;
  //House Targaryen
  tar = new House() ;
  tar.borderColor[0] = blackClr[0] ;
  tar.borderColor[1] = blackClr[1] ;
  tar.borderColor[2] = blackClr[2] ;
  tar.fillColor[0] = redClr[0] ;
  tar.fillColor[1] = redClr[1] ;
  tar.fillColor[2] = redClr[2] ;
  //House Tully
  tul = new House() ;
  tul.borderColor[0] = redClr[0] ;
  tul.borderColor[1] = redClr[1] ;
  tul.borderColor[2] = redClr[2] ;
  tul.fillColor[0] = blueClr[0] ;
  tul.fillColor[1] = blueClr[1] ;
  tul.fillColor[2] = blueClr[2] ;
  //Others
  oth = new House() ;
  oth.borderColor[0] = blackClr[0] ;
  oth.borderColor[1] = blackClr[1] ;
  oth.borderColor[2] = blackClr[2] ;
  oth.fillColor[0] = greyClr[0] ;
  oth.fillColor[1] = greyClr[1] ;
  oth.fillColor[2] = greyClr[2] ;
}

class Button
{
  House house ; 
  String name ;
  int posXleftUpCorner ;
  int posYleftUpCorner ;
  int size ;

  Button(House Maison, String Name, int index)
  {
    house = Maison ;
    name = Name ;
    posXleftUpCorner = width - int(height / 10) ;
    posYleftUpCorner = index * int(height / 10) ;
    size = int(height/10) ;
  }
}

ArrayList<Button> buttons = new ArrayList<Button>() ;

void initButtons()
{
  buttons.add(new Button(sta, "Stark", 0)) ;
  buttons.add(new Button(arr, "Arryn", 1)) ;
  buttons.add(new Button(lan, "Lannister", 2)) ;
  buttons.add(new Button(tyr, "Tyrell", 3)) ;
  buttons.add(new Button(gre, "Greyjoy", 4)) ;
  buttons.add(new Button(mar, "Martell", 5)) ;
  buttons.add(new Button(bar, "Baratheon", 6)) ;
  buttons.add(new Button(tar, "Targaryen", 7)) ;
  buttons.add(new Button(tul, "Tully", 8)) ;
  buttons.add(new Button(oth, "Others", 9)) ;
}

int randint(int low, int high)
{
  return int(random(low, high)) ;
}

class Ball
{
  String name ;
  House house ;
  int index ;
  int size ;
  int posX ;
  int posY ;
  float dirX ;
  float dirY ;
  ArrayList<Integer> relations ;

  Ball (String Name, int Size, House itsHouse, ArrayList<Integer> Relations)
  {
    name = Name ;
    house = itsHouse ;
    index = currentIndex ;
    size = Size ;
    posX = randint(int(size/2), int(width-size/2));
    posY = randint(int(size/2), int(height-size/2));
    dirX = random(-1,1) ;
    dirY = random(-1,1) ;
    relations = Relations ;
  }
}

ArrayList<Ball> tabBall = new ArrayList<Ball>() ;

void drawBall(Ball ball)
{
  if (ball.house.active)
  {
    int dec = int(HALF_INVERTED_SQRT2 * ball.size) ;
    strokeWeight(int(BORDER_SIZE_COEF * ball.size)) ;
    stroke(ball.house.borderColor[0], ball.house.borderColor[1], ball.house.borderColor[2]) ;
    fill(ball.house.fillColor[0], ball.house.fillColor[1], ball.house.fillColor[2], 100) ;
    circle(ball.posX, ball.posY, ball.size) ;
    /*noFill() ;
    rect(ball.posX - dec, ball.posY - dec,  2 * dec, 2* dec) ;*/
    fill(ball.house.borderColor[0], ball.house.borderColor[1], ball.house.borderColor[2]) ;
    text(ball.name, ball.posX - dec, ball.posY - dec,  2 * dec, 2* dec) ;
  }  
}

House determineHouse (String name) 
{
  name = name.toLowerCase() ;
  if (name.indexOf("stark") != -1)
  {
    return sta ;
  }
  else if (name.indexOf("arryn") != -1)
  {
    return arr ;
  }
  else if (name.indexOf("lannister") != -1)
  {
    return lan ;
  }
  else if (name.indexOf("tyrell") != -1)
  {
    return tyr ;
  }
  else if (name.indexOf("greyjoy") != -1)
  {
    return gre ;
  }
  else if (name.indexOf("martell") != -1)
  {
    return mar ;
  }
  else if (name.indexOf("baratheon") != -1)
  {
    return bar ;
  }
  else if (name.indexOf("targaryen") != -1)
  {
    return tar ;
  }
  else if (name.indexOf("tully") != -1)
  {
    return tul ;
  }
  else return oth ;
}

ArrayList<Integer> getRelations(String relations)
{
  ArrayList<Integer> result = new ArrayList<Integer>() ;
  ArrayList<String> availableUrls = new ArrayList(urls) ;
  relations = relations.toLowerCase() ;
  /*relations = relations.substring(2) ;
  relations = relations.substring(0, relations.length() - 2) ;
  List<String> relationsAL = new ArrayList(Arrays.asList(relations.split("', '"))) ;*/
  int i = 0 ;
  for (String person : availableUrls)
  {
    if (relations.indexOf(person.toLowerCase()) != -1)
    {
      result.add(new Integer(i)) ;
    }
    i++ ;
  }
  return result ;  
}

void setup()
{
  fullScreen();
  initHouses();
  initButtons();
  textAlign(CENTER, CENTER) ;
  
  float maxInd, minInd ;
  int size ;
  TableRow row ;
  House house ;
  ArrayList<Integer> relations ;

  table = loadTable("GOT.csv", "header") ;
  table.sortReverse(INDICATOR) ;
  maxInd = table.getRow(0).getFloat(INDICATOR) ;
  minInd = table.getRow(MAX_NUMBER_OF_CHARACTERS - 1).getFloat(INDICATOR) ;
  for (int i = 0 ; i < MAX_NUMBER_OF_CHARACTERS ; i++)
  {
    row = table.getRow(i) ;
    size = int(MIN_SIZE + (MAX_SIZE - MIN_SIZE) * (row.getFloat(INDICATOR) - minInd) / (maxInd - minInd)) ;
    house = determineHouse(row.getString("common_name")) ;
    relations = getRelations(row.getString("awoif_links")) ;
    tabBall.add(new Ball(row.getString("short_name"), size, house, relations)) ;
    urls.add(new String(row.getString("url"))) ;
    currentIndex++ ;
  }

  for (Ball ball : tabBall)
  {
    drawBall(ball) ;
  }
}

void drawButtons()
{
  int borderSize = int(buttons.get(0).size * BORDER_SIZE_COEF) ;
  strokeWeight(borderSize) ;
  for (Button but : buttons)
  {
    if (but.house.active)
    {
      stroke(but.house.borderColor[0], but.house.borderColor[1], but.house.borderColor[2]) ;
      fill(but.house.fillColor[0], but.house.fillColor[1], but.house.fillColor[2]) ;
      rect(but.posXleftUpCorner - int(borderSize / 2) , but.posYleftUpCorner + int(borderSize / 2), but.size, but.size - borderSize) ;
      fill(but.house.borderColor[0], but.house.borderColor[1], but.house.borderColor[2]) ;
      text(but.name, but.posXleftUpCorner - int(borderSize / 2) , but.posYleftUpCorner + int(borderSize / 2), but.size, but.size - borderSize) ;
    }
    else
    {
      stroke(but.house.borderColor[0], but.house.borderColor[1], but.house.borderColor[2], 100) ;
      fill(but.house.fillColor[0], but.house.fillColor[1], but.house.fillColor[2], 100) ;
      rect(but.posXleftUpCorner - int(borderSize / 2), but.posYleftUpCorner + int(borderSize / 2), but.size, but.size - borderSize) ;
      fill(but.house.borderColor[0], but.house.borderColor[1], but.house.borderColor[2], 100) ;
      text(but.name, but.posXleftUpCorner - int(borderSize / 2) , but.posYleftUpCorner + int(borderSize / 2), but.size, but.size - borderSize) ;
    }
  }
}

void draw()
{
  background(200) ;
  drawButtons() ;
  for (Ball ball : tabBall)
  {
    ball.posX += SPEED * ball.dirX ;
    ball.posY += SPEED * ball.dirY ;

    if (ball.posX >= width - ball.size / 2 - buttons.get(0).size )
    {
      ball.posX = int(width - ball.size / 2 - buttons.get(0).size) - 1 ;
      ball.dirX *= -1 ;
    }
    if (ball.posX <= ball.size/2)
    {
      ball.posX = int (ball.size/2) + 1 ;
      ball.dirX *= -1 ;
    }
    if (ball.posY >= height - ball.size/2)
    {
      ball.posY = int(height - ball.size/2) - 1 ;
      ball.dirY *= -1 ;
    }
    if (ball.posY <= ball.size/2)
    {
      ball.posY = int(ball.size/2) + 1 ;
      ball.dirY *= -1 ;
    }

    if (ball.house.active) 
      for(Integer index : ball.relations)
      {
        Ball ballBis = tabBall.get(index) ;
        if (!ballBis.house.active)
          continue ;
        float distanceSQ = pow(ball.posX - ballBis.posX, 2) + pow(ball.posY - ballBis.posY, 2) ;
        float maxLinkDistanceSQ = pow(ballBis.size * MAX_LINK_DISTANCE_COEF, 2) ;
        float maxLinkSize = ball.size / 2 ;
        if (distanceSQ <= maxLinkDistanceSQ)
        {
          //int sumOfSemiDiameters = (ballSize[i] + ballSize[k]) / 2 ;
          stroke(ballBis.house.fillColor[0], ballBis.house.fillColor[1], ballBis.house.fillColor[2]) ;
          strokeWeight(maxLinkSize * (1 - ((distanceSQ - pow(ballBis.size, 2)) / (maxLinkDistanceSQ - pow(ballBis.size, 2))))) ;
          line(ball.posX, ball.posY, ballBis.posX, ballBis.posY) ;
          //getLinkCoordinate(i, k, maxLinkSize, distance) ;
          //quad(linkCoordinates[0], linkCoordinates[1], linkCoordinates[2], linkCoordinates[3], linkCoordinates[4], linkCoordinates[5], linkCoordinates[6], linkCoordinates[7]) ;
        }
      }
  }
  for (Ball ball : tabBall)
  {
    drawBall(ball) ;
  }
}

void mouseClicked()
{
  if (mouseX <= width && mouseX >= width - int(height / 10) && mouseY >= 0 && mouseY <= 10 * int (height / 10))
  {
    buttons.get(int(10 * mouseY / height)).house.active = !buttons.get(int(10 * mouseY / height)).house.active ;
  }
}
