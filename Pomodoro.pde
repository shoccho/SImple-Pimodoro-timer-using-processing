import static javax.swing.JOptionPane.*;
String timeS="";
int time=1500;
String btn1="Start";
boolean running=false;
void setup(){
  size(600,300);

}

void draw(){
  background(255);
  stroke(0);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  if(running)update();
  timeS=gentime(time);
  text(timeS,width/2,height/2);
  fill(51);
  textSize(20);
  text(btn1,100,250);
  text("Reset",500,250);
  if(time<=0){
    if(running)
    ended();
  }
}
void ended(){
    
   showMessageDialog(null, "Pomodoro ended","Info", INFORMATION_MESSAGE);
   running=false;
}
void mouseClicked(){
  if(dist(mouseX,mouseY,100,250)<200){ 
    if(!running){running=true;
      btn1="Pause";
      }
      
     else {
      running=false;
      btn1="Start";
     }
  }
   else if(dist(mouseX,mouseY,500,250)<200)
   reset();
}
void reset(){
  btn1="Start";
 running=false;
 time=1500;
}
void update(){
   
  if(time==0){
      running=false;
  }
  else{
    time-=1;
    delay(1000);
  }
  
}
String gentime(int i){
  String x;
  int m=int(i/60);
  int s=i-(m*60);
  x=str(m)+" : "+str(s) ;
  if(s==0)x+='0';
  if(m<10)x='0'+x;
  return  x;
}
