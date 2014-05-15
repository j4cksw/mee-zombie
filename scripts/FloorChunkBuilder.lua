local FloorChunkBuilder = {}

ImageSheetsData = ImageSheetsData or require("config.ImageSheetsData")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function FloorChunkBuilder.buildFromPatternAndVerticalOffset(floorChunkPattern, verticalOffset)
  
  local floorPieceWidth, floorPieceHeight = getFloorSpriteWidthHeight()

  for key, value in pairs(floorChunkPattern) do
    SpriteInitializer.initializeByData({
      name = "floor",
      x = (floorPieceWidth*verticalOffset) - (floorPieceWidth/2),
      y = display.viewableContentHeight - (floorPieceHeight*key) + (floorPieceHeight/2),
      sequence = value
    })
  end
end

function getFloorSpriteWidthHeight()
  local floorSpriteOptions = ImageSheetsData["floor"].options
  return floorSpriteOptions.width, floorSpriteOptions.height
end

return FloorChunkBuilder