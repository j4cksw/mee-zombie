local FloorBuilder = {}

ImageSheetsData = ImageSheetsData or require("config.ImageSheetsData")
SpriteInitializer = SpriteInitializer or require("scripts.Spriteinitializer")

function FloorBuilder.build()
  
  local floorSpriteOptions = ImageSheetsData["floor"].options 
  local floorPieceWidth = floorSpriteOptions.width
  local floorPieceHeight = floorSpriteOptions.height

  local floorChunkPattern = {"body", "top"}

  for key, value in pairs(floorChunkPattern) do
    SpriteInitializer.initializeByData({
      name="floor",
      x=floorPieceWidth/2,
      y=display.viewableContentHeight- (floorPieceHeight*key) + (floorPieceHeight/2),
      sequence=value
    })
  end

end

return FloorBuilder