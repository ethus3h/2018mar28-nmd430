//adapted from https://github.com/nok/leap-motion-processing/blob/master/examples/e1_basic/e1_basic.pde
//Sends 15 features ((x,y,z) tip of each finger) to Wekinator
// sends to port 6448 using /wek/inputs message

import de.voidplus.leapmotion.*;

import oscP5.*;
import netP5.*;

int num=0;

int c = 1;

OscP5 oscP5;
NetAddress dest;
LeapMotion leap;
int numFound = 0;

float[] features = new float[15];

void setup() {

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
}

void draw() {
}



void oscEvent(OscMessage theOscMessage) {
  System.out.println("got it");
  if (theOscMessage.addrPattern().equals("/wek/outputs")) {
    float value = theOscMessage.get(0).floatValue();
    if (value > -0.05) {
      if (value > 0) {
        if (value > 0.3) {
          if ( value > 0.4) {
            if (value > 0.8) {
              System.out.println("More than 8");
            }
            System.out.println("More than 6");
          }
          System.out.println("More than 4");
        }
        System.out.println("More than 0.05");
      }
      System.out.println("More than 0");
    } else {
      System.out.println("Lessthan or equal to 0");
    }
  }
}