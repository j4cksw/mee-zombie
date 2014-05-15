local FloorBuilder = {}

SpriteInitializer = SpriteInitializer or require("scripts.Spriteinitializer")

function FloorBuilder.build()

  local floorPieceHeight=128

  local floorChunkPattern = {"body", "top"}

  for key, value in pairs(floorChunkPattern) do
    SpriteInitializer.initializeByData({
      name="floor",
      x=128/2,
      y=display.viewableContentHeight- (floorPieceHeight*key) + (floorPieceHeight/2),
      sequence=value
    })
  end

end

return FloorBuilder