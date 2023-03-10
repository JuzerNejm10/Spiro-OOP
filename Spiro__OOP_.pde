import com.hamoid.*;

VideoExport videoExport;

boolean record=false;

PrintWriter output;

String datetime = str(year())+str(month())+str(day())+str(hour())+str(minute())+str(second());

Spiro spiro;

void setup() {
  fullScreen(P3D);
  background(0);
  noCursor();
  spiro = new Spiro();
  videoExport = new VideoExport(this);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    record = !record;
    videoExport.setMovieFileName("spiro_" + "spiro_" + datetime + ".mp4");
    videoExport.startMovie();
    if (key == ESC) {
      videoExport.endMovie();  
      exit();
    }
  }
}

void draw() {
  background(0);
  spiro.transRota();
  spiro.drawMe();
  spiro.writeParams();
  videoExport.saveFrame();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    spiro.follCur();
  } else if (mouseButton == RIGHT) {
    spiro.restart();
  }
}

void mouseWheel(MouseEvent event) {
  spiro.moWhee(event);
}
