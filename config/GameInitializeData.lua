local GameInitializeData = {
  ["bear_zombie"] = {
    name="bear_zombie",
    x=-300,
    y=730,
    sequence="walk"
  },
  ["enemy1"] = {
    name="enemy",
    x=2000,
    y=730,
    sequence="enemy1_walk"
  },
  ["enemy2"] = {
    name="enemy",
    x=2000,
    y=730,
    sequence="enemy2_walk"
  },
  ["enemy3"] = {
    name="enemy",
    x=2000,
    y=730,
    sequence="enemy3_walk"
  },
  ["enemy4"] = {
    name="enemy",
    x=2000,
    y=730,
    sequence="enemy4_walk"
  },
  ["swat"] = {
    name="enemy",
    x=1800,
    y=730,
    sequence="swat"
  },
  ["floor"] = {
    name="floor",
    initializeChunks=24
  },
  ["floor_physics"] = {
    y=1050,
    height=268
  },
  ["background"] = {
    name="background",
    x=1360,
    y=640,
    sequence="background"
  },
  ["chairs"] = {
    name="chairs",
    x=1360,
    y=800,
    sequence="chairs"
  }
}
return GameInitializeData