import processing.serial.*; 
Serial myPort;
import processing.sound.*;
AudioIn in;
import processing.sound.*;
int[] button = new int[10];
SoundFile file;
SoundFile file2;
PImage img;
PImage img2;
int j;

int r1=0;
void setup(){
  //Serial.list()[0]
  myPort = new Serial(this,Serial.list()[0], 9600);
  // change '[0]' with '[Arduino_port_on_Processing]'! 
  myPort.bufferUntil(10);
  
  size(800,800,P2D);
  button[0]=350;
  button[1]=600;
  button[2]=300;
  button[3]=75;
  button[4]=0;
  button[5]=1350;
  button[6]=600;
  button[7]=300;
  button[8]=75;
  button[9]=0;
  
  background(255);
  
  file=new SoundFile(this,"Shoes1.mp3");
  file2=new SoundFile(this,"Shoes2.mp3");
      //file.play();
  //file.amp(2);
  img=loadImage("MUSIC.png");
  img2=loadImage("fire.png");
  in = new AudioIn(this, 0);
  in.play();
}


void serialEvent(Serial p) {
  String a = p.readString();
   if(a.contains("one")){
     String[] out = a.split(" ",2);
     System.out.println("first "+out[1]);
     //String y1=out[1];
     //int r1 = 50;  
     //r1=Integer.parseInt(out[1]);
   // try{ 
  //if(( file.isPlaying()==true)&&(Integer.parseInt(out[1])<100))
   //{
    //System.out.println("running");
    //file.amp(0);
   //}
   //}catch(Exception e){
     // println("Error parsing:");
      //e.printStackTrace();
  //}
 }
    if(a.contains("two")){
     String[] out = a.split(" ",2);
     System.out.println("second "+out[1]);
     //String y2=out[1];
   }
   if(a.contains("three")){
     String[] out = a.split(" ",2);
     System.out.println("third "+out[1]);
     //String y3=out[1];
   }
   if(a.contains("four")){
     String[] out = a.split(" ",2);
     System.out.println("fourth "+out[1]);
     //String y4=out[1];
   }
   
}
void draw(){
  //image(img,1800,300);
  //background(255,140,0);
  if(button[4]==1 && file.isPlaying()==false){
    file.play();
    file.amp(1);
  }
  if(button[9]==1 && file2.isPlaying()==false){
    file2.play();
    file.amp(1);
  }
  textAlign(CENTER);
  //fill(0);
  noStroke();
  fill(0);
  rect(500,220,1050,100,15);
  textSize(60);
  fill(255,105,180);
  text("BEAT SHOES",1000,300);
  
  fill(0);
  //noStroke();
  background(127,0,0);
  image(img,1500,180);
  image(img,1700,180);
  image(img,0,180);
  image(img,200,180);
  int s=0;
  for(int i=0;i<10;i++){
    image(img,s,50);
    s=s+200;
  }
  //image(img2,1500,180);
  int t=0;
  for (int i=0;i<10;i++){
    image(img2,t,850);
    t=t+200;
  }
  
  
  rect(button[0],button[1],button[2],button[3],15);
  rect(450,220,1050,100,15);
  textSize(80);
  fill(255,140,0);
  text("BEAT SHOES",1000,300);
  
  textSize(50);
  fill(225);
  //fill(0);
  text("SONG1",500,650);
  
  fill(0);
  rect(button[5],button[6],button[7],button[8],15);
  textSize(50);
  fill(225);
  text("SONG2",1500,650);
  //fill(0);
  
  
  
  
}
void mousePressed(){
  if((mouseY<(button[1]+button[3]))&&(mouseY>(button[1]))){
    if((mouseX<(button[0]+button[2]))&&(mouseX>(button[0]))){
     button[4]=1; 
    }
  }
  if((mouseY<(button[6]+button[8]))&&(mouseY>(button[6]))){
    if((mouseX<(button[5]+button[7]))&&(mouseX>(button[5]))){
     button[9]=1; 
    }
  }
}
  
