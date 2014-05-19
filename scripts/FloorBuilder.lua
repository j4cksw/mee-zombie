local FloorBuilder = {}

FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")
FloorPatterns = FloorPatterns or require("config.FloorPatterns")
FloorRepository = FloorRepository or require("scripts.FloorRepository")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")

function FloorBuilder.build()
  local floorGroup = display.newGroup()
  
  for horizontalOffset = 1, GameInitializeData["floor"].initializeChunks do
    floorGroup:insert(FloorChunkBuilder.buildFromPatternAndVerticalOffset(FloorPatterns[1],
      horizontalOffset))
  end
  
  FloorRepository.setFloorGroup(floorGroup)
end

return FloorBuilder