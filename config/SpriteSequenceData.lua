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
      name="walk",
      start=1,
      count=8,
      time=500
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