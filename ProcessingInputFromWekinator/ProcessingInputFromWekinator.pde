//adapted from https://github.com/nok/leap-motion-processing/blob/master/examples/e1_basic/e1_basic.pde
//Sends 15 features ((x,y,z) tip of each finger) to Wekinator
// sends to port 6448 using /wek/inputs message


import de.voidplus.leapmotion.*;

import ddf.minim.*;

AudioPlayer pray;
AudioPlayer handsUp;
AudioPlayer point;
AudioPlayer fistBump;

Minim minim;

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

   minim = new Minim(this);
   //append(sounds, minim.loadFile("pray.mp3"));
   pray = minim.loadFile("pray.mp3");
   handsUp = minim.loadFile("hands_up.mp3");
   fistBump = minim.loadFile("fist_bump.mp3");
   point = minim.loadFile("point.mp3");
   
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  
  //append(sounds,new SoundFile(this, "sounds/pray.mp3"));
  //append(sounds,new SoundFile(this, "sounds/point.mp3"));
  //append(sounds,new SoundFile(this, "sounds/hands_up.mp3"));
  //append(sounds,new SoundFile(this, "sounds/fist_bump.mp3"));

  
}

void draw() {
  readme();
   
}

void readme(){
  
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.addrPattern().equals("/wek/outputs")) {
    float value = theOscMessage.get(0).floatValue();
        
    System.out.println(value);
    //can't switch float vals :(
    
 
  
    if(value < 0.05){
      //base state
      pray.play();
      //delay(2000);
      pray.rewind();

    }else if(value > 0.27 && value < 0.34){
      //fist
      fistBump.play();
      //delay(2000);
      fistBump.rewind();

    }else if(value > 0.47 && value < 0.54){
      //point finger
      point.play();
      //delay(2000);
      point.rewind();
    }else if(value > .89){
      //arms up
      handsUp.play();
     // delay(2000);
      handsUp.rewind();
    }
    
  }
}