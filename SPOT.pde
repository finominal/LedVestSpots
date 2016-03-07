class SPOT
{
  int r,g,b; //color
  PVector  position = new PVector();
  PVector velocity= new PVector();
  PVector target = new PVector();
  PVector positionNormalized = new PVector();
  PVector targetNormalized = new PVector();
  
  int radius; //size of object
  //movement
  PVector steeringForce = new PVector();
  PVector steeringCurrent = new PVector();
  PVector steeringDesired = new PVector();
  
  public SPOT(int _x, int _y, int _r, int _g, int _b)
  {
    position.set(_x, _y);
    velocity.set(1,1);
    r = _r;
    g = _g;
    b = _b;
    radius = (int)random(40,60);
    setNewDestination();
  }
  
  public void move()
  {
    message = "";//reset the message
    
    positionNormalized = position.get();
    positionNormalized.normalize();
    
    targetNormalized = target.get();
    targetNormalized.normalize();
    
   if(displayMessages)
   {
      message += " position.x=" + position.x;
      message += " position.y=" + position.y;
      message += " heading=" + velocity.heading();
      message += " velocity=" + velocity.mag();
      message += "\n\r";
      message += " target.x=" + target.x;
      message += " target.y=" + target.y;
      message += " targetDist=" + position.dist(target);
   }

    accelerate();

    //apply velocitargetY to X and Y with discretion to angle
    position.x += velocity.x;
    position.y += velocity.y;
    
    println(message);
    
  }
  
  private void accelerate()
  {
    //First gets heading, second sets steering Force,
    //Easier to think about when done in two seperate objects "steeringHeading and steeringForce"
    
    steeringDesired.set( (target.x - position.x), (target.y - position.y)); //target direction relative to me
    steeringDesired.limit(maxVelocity);
    steeringCurrent = velocity.get();
    
    if(displayMessages)
    {
      message += "\n\r steeringCurrentHead=" + steeringCurrent.heading();
      message += "\n\r steeringCurrentMag=" + steeringCurrent.mag();
      message += "\n\r steeringDesiredHead=" + steeringDesired.heading();
      message += "\n\r steeringDesiredMag=" + steeringDesired.mag();
    }
    
    steeringForce = steeringDesired.get();
    steeringForce.sub(steeringCurrent);
    steeringForce.limit(acceleration);

    if(displayMessages)
    {
      message += "\n\r steeringMag=" + steeringForce.mag();
      message += " steeringForce.heading=" + steeringForce.heading();
    }
    velocity.x += steeringForce.x ;
    velocity.y += steeringForce.y ;
    
    if(velocity.mag() > maxVelocity)//govern the speed
    {
      float overshoot = velocity.mag() / maxVelocity;
      velocity.x /= overshoot;
      velocity.y /= overshoot;
    }

  }
  
  private boolean behind(PVector velocity, PVector steeringHeading)
  {
    float dot = velocity.dot(steeringHeading);
    if(dot < 0) message += "  BEHIND";
    return (dot < 0);
  }
  
  public void checkIfDestinationReached()
  {
    if(abs(position.x-target.x) < arrivalSize   && abs(position.y-target.y) < arrivalSize ) 
    {
      setNewDestination();
    }
    
  }
  
  public void setNewDestination()
  {
    target.x = (int)random(WorldWidth-gutterDepth*2) + gutterDepth;
    target.y = (int)random(WorldHeight-gutterDepth*2) + gutterDepth;
  }
}





