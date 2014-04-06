//version 3

int WorldWidth = 8000;
int WorldHeight = 6000;
int gutterDepth = 100;
int arrivalSize = 500;


float maxVelocity = 100;
float acceleration = maxVelocity/20;
float arriveDistance = 1000;

boolean paused = false;
long loopTime = 0;
int fps = 25;

String message = "test"; 
boolean displayDevMode = false;


SPOT[] spots;

void setup()
{
  frameRate(25);
  size(WorldWidth/10, WorldHeight/10);
  noStroke();
  SpotManager_InitializeSpots();

}

void draw()
{
  
  loopTime = millis();
  
  if(paused)
  {
    noStroke();
    textSize(12);
    fill(128,128,128);
    text(message,20,20);
  }
  else
  {
    background(0);
    AnimateSpots();
  }
  saveFrame("/users/finbot/desktop/processingOutput/seq-####.jpg");
}

void AnimateSpots()
{
  MoveSpots();
  DrawSpots();
}

void MoveSpots()
{
  for(SPOT s : spots)
  {
    s.checkIfDestinationReached();
    s.move();
  }
}

void DrawSpots()
{
  for(SPOT s : spots)
  {
    stroke(s.r, s.g, s.b);
    fill(s.r, s.g, s.b);
    
    ellipse(s.position.x/10, s.position.y/10, s.radius, s.radius);//object
    
    if(displayDevMode)
    {
      stroke(255,0,0);
      fill(255,0,0);
      ellipse(s.target.x/10, s.target.y/10, 2, 2);//draw target
      
      stroke(0,64,0);
      line(s.position.x/10, s.position.y/10,s.target.x /10, s.target.y/10 );//draw direciton of target
      updatePixels();
      
      stroke(0,0,255);
      line(s.position.x/10, s.position.y/10,s.position.x/10 + s.velocity.x,s.position.y/10 +  s.velocity.y);//objectVelocitargetY
      
      stroke(255,255,0);
      line(s.position.x/10, s.position.y/10, s.position.x/10 + s.steeringForce.x*10, s.position.y/10 + s.steeringForce.y*10); //steering Force
    }  
}
}

void mousePressed() {
  if(paused) {paused = false;}
  else {paused = true;}
}



