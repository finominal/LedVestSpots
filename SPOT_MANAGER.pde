void SpotManager_InitializeSpots()
{
  spots = new SPOT[9];
  // public SPOT(int _x, int _y, int _r, int _g, int _b)
  spots[0] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),0,255,0);
  spots[1] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),0,0,255);
  spots[2] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),255,0,0);
  spots[3] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),255,0,255);
  spots[4] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),0,255,255);
  spots[5] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),255,255,0);
  spots[6] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),255,128,0);
  spots[7] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),255,0,128);
  spots[8] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),0,255,128);
  spots[8] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),128,0,200);
  spots[8] = new SPOT((int)random(WorldWidth),(int)random(WorldHeight),128,64,0);
}
 
