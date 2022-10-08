class Spiro {

  int radius;
  float rotatexrnd, rotateyrnd;
  float anglernd; 
  float srnd, trnd;
  int colornd, colornd2;
  int rotation;
  int x, y;
  boolean followCursor;
  float e, zoom;
  float randradians; 
  float randradiant;

  Spiro() {
    radius = 150;
    rotatexrnd = random(0.01, 0.1);
    rotateyrnd = random(0.01, 1);
    anglernd = (int)random(90, 360); 
    srnd = random(-5, 5);
    trnd = random(0.1, 10);
    colornd = (int)random(0, 255);
    colornd2 = (int)random(0, 255);
    rotation = 1;
    stroke(colornd, colornd2, 255);
    x=width/2;
    y=height/2;
    followCursor = false;
    zoom=1;
  }

  void transRota() {
    if (followCursor==true) {
      x=mouseX;
      y=mouseY;
    }
    translate(x, y);
    if (colornd>127) {
      rotateY(frameCount * rotatexrnd);
      rotateX(frameCount * rotatexrnd);
      rotation = 2;
    } else {
      rotateY(frameCount * rotateyrnd);
      rotateX(frameCount * rotatexrnd);
    }
    scale(zoom);
  }

  void drawMe() {
    float s = 0;
    float t = 0;
    float lastx = 0; 
    float lasty = 0;
    float lastz = 0;

    if (colornd>127) {
      randradians = 1;
    } else {
      randradians = 0;
    }

    if (rotatexrnd>0.25) {
      randradiant = 1;
    } else {
      randradiant = 0;
    }

    while (t < anglernd) {
      s += srnd;  
      t += trnd;  
      if (randradians==1) {
        randradians=radians(s);
      } else {
        randradians=radians(t);
      }
      if (randradiant==1) {
        randradiant=radians(s);
      } else {
        randradiant=radians(t);
      }

      float thisx = 0 + (radius * cos(radians(s)) * cos(randradians));
      float thisy = 0 + (radius * sin(radians(s)) * sin(randradiant));
      float thisz = 0 + (radius * cos(radians(t)));

      if (lastx != 0) {
        if (colornd>=0&&colornd<40) {
          line(thisx, thisy, thisz, lastx, lasty, lastz);
        } else if (colornd>=40&&colornd<80) {
          line(thisx, thisy, thisz, lastx+50, -lasty, lastz+100);
        } else {
          line(thisx, thisy, thisz, lastx, lasty, lastz);
          line(thisx, thisy, thisz, lastx+50, -lasty, lastz+100);
        }
      }
      lastx = thisx; 
      lasty = thisy; 
      lastz = thisz;
    }
  }

  void writeParams() {
    if (record==true) {
      output = createWriter("params_" + day + "." + mnth + "." + year + "." + "_" + hr + mnt + mls + ".txt");
      output.println("*****************************");
      output.println("color:" + "\t\t" + "("+colornd+","+colornd2+",255"+")");
      output.println("rotatexrnd:" + "\t" + rotatexrnd);
      output.println("rotateyrnd:" + "\t" + rotateyrnd);
      output.println("rotation:" + "\t" + rotation);
      output.println("anglernd:" + "\t" + anglernd);
      output.println("srnd:" + "\t\t" + srnd);
      output.println("trnd:" + "\t\t" + trnd);
      output.println("randradians:" + "\t" + randradians);
      output.println("randradiant:" + "\t" + randradiant);
      output.println("*****************************");
      output.flush();
      output.close();
    }
  }

  void moWhee(MouseEvent event) {
    e = event.getCount();
    if (e==0) {
      zoom=1.0;
    } else if (e>0) {
      zoom-=0.1;
    } else if (e<0) {
      zoom+=0.1;
    }
  }

  void follCur() {
    followCursor=!followCursor;
  }
}
