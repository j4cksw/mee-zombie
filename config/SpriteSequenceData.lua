local SpriteSequenceData = {
  ["bear_zombie"] ={
    {
      name="run",
      start=1,
      count=8,
      time=500
    },
    {
      name="walk",
      start=9,
      count=8,
      time=1000
    },
    {
      name="attack",
      start=18,
      count=10,
      time=1000,
      loopCount=1
    }
  },
  ["floor"] = {
    {
      name="top",
      start=1,
      count=1
    },
    {
      name="body",
      start=2,
      count=1
    }
  },
  ["enemy"] ={
    {
      name="enemy1_walk",
      start=1,
      count=8,
      time=500
    },
    {
      name="enemy2_walk",
      start=9,
      count=8,
      time=500
    },
    {
      name="enemy3_walk",
      start=17,
      count=8,
      time=500
    },
    {
      name="enemy4_walk",
      start=25,
      count=8,
      time=500
    },
    {
      name="swat",
      start=33,
      count=1,
    },
    {
      name="swat_shoot",
      start=34,
      count=4,
      time=200,
      loopCount=1
    },
    {
      name="dead",
      start=38,
      count=8,
      time=500,
      loopCount=1
    }
  }
}
return SpriteSequenceData