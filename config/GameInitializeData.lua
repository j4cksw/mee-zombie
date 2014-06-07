local GameInitializeData = {
  ["bear_zombie"] = {
    name="bear_zombie",
    x=512,
    y=1125,
    sequence="walk"
  },
  ["enemy1"] = {
    name="enemy",
    x=2000,
    y=1125,
    sequence="enemy1_walk"
  },
  ["enemy2"] = {
    name="enemy",
    x=2000,
    y=1125,
    sequence="enemy2_walk"
  },
  ["enemy3"] = {
    name="enemy",
    x=2000,
    y=1125,
    sequence="enemy3_walk"
  },
  ["enemy4"] = {
    name="enemy",
    x=2000,
    y=1125,
    sequence="enemy4_walk"
  },
  ["swat"] = {
    name="enemy",
    x=1800,
    y=1125,
    sequence="swat"
  },
  ["floor"] = {
    name="floor",
    initializeChunks=18
  },
  ["floor_physics"] = {
    y=1460,
    height=268
  },
  ["background"] = {
    name="background",
    x=display.contentCenterX,
    y=display.contentCenterY,
    sequence="background"
  },
  ["chairs"] = {
    name="chairs",
    x=display.contentCenterX,
    y=display.contentCenterY,
    sequence="chairs"
  }
}
return GameInitializeData