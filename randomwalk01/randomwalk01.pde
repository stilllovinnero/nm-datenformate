ArrayList<skywalker> skywalkers;
int stepSize = 20;       //int(random (5));

void setup () {
  background (#0D0D0D);
  size(300, 600);
  colorMode(RGB);
  skywalkers = new ArrayList<skywalker>();
  
}

void draw () {
  for (int i=0; i< skywalkers.size (); i++)
  {
    skywalkers.get(i).update();
  }
}

class skywalker {

  int x;
  int y;
  int r;

  skywalker (int posX, int posY, int r) {
    x = posX;
    y = posY;
  }

  void update () {

    stroke((frameCount+r)%255, 50, 50);
    r = r + 1;
    float pointSize = random(2, 10);
    int stepSize = 20;       //int(random (5));
    strokeWeight(pointSize);
    point(x, y);


    x = updatePoint(x, stepSize, width);
    y = updatePoint(y, stepSize, height);
  } 




  int updatePoint(int position, int stepSaize, int maximum) {
    int offset;
    float leftOrRight = random (-1, 1);
    int newPosition;
    if (leftOrRight<0) {
      offset = stepSaize;
    } else {
      offset = -stepSaize;
    }

    newPosition = position + offset;
    if (!isOnStage(newPosition, maximum)) {
      return updatePoint(position, stepSaize, maximum);
    } else {
      return newPosition;
    }
  }

  boolean isOnStage (int position, int maximum) {
    if (position < 0|| position >= maximum) {
      return false;
    } else {
      return true;
    }
  }
}

void mouseClicked() {
  int gerastertX = mouseX;
  int gerastertY = mouseY;
  boolean imRaster = false;
  while (imRaster==false)
  {
    if (gerastertX%stepSize!=0)
    {
      gerastertX = gerastertX -1;
    } 
    else if (gerastertY%stepSize!=0)
    {
      gerastertY = gerastertY -1;
    }
    else {
    imRaster = true;
    }
  }
    skywalkers.add(new skywalker(gerastertX, gerastertY, 0));
  
}

void keyReleased() {
  if (key == 's') {
    saveFrame("bildsche-######.tiff");
    println("picture saved");
  }
}

