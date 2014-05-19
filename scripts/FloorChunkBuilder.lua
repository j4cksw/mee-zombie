local FloorChunkBuilder = {}

ImageSheetsData = ImageSheetsData or require("config.ImageSheetsData")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function FloorChunkBuilder.buildFromPatternAndVerticalOffset(floorChunkPattern, verticalOffset)

  local floorChunkGroup = display.newGroup()

  local floorPieceWidth, floorPieceHeight = getFloorSpriteWidthHeight()

  for key, value in pairs(floorChunkPattern) do
    floorChunkGroup:insert(SpriteInitializer.initializeByData({
      name = "floor",
      x = (floorPieceWidth*verticalOffset) - (floorPieceWidth/2),
      y = display.viewableContentHeight - (floorPieceHeight*key) + (floorPieceHeight/2),
      sequence = value
    }))
  end
  
  return floorChunkGroup
end

function getFloorSpriteWidthHeight()
  local floorSpriteOptions = ImageSheetsData["floor"].options
  return floorSpriteOptions.width, floorSpriteOptions.height
end

return FloorChunkBuilder