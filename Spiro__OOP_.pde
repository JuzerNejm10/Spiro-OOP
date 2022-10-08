import com.hamoid.*;

VideoExport videoExport;

boolean record=false;

PrintWriter output;

int mls = millis();
int mnt = minute();
int hr = hour();
int day = day();
int mnth = month();
int year = year();

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
    videoExport.setMovieFileName("spir_" + day + "." + mnth + "." + year + "." + "_" + hr + mnt + mls + ".mp4");
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

void mouseClicked() {
  spiro.follCur();
}

void mouseWheel(MouseEvent event) {
  spiro.moWhee(event);
}
