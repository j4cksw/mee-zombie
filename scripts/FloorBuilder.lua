local FloorBuilder = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")
FloorAppender = FloorAppender or require("scripts.FloorAppender")

function FloorBuilder.build()
  local floorGroup = display.newGroup()
  FloorRepository.setFloorGroup(floorGroup)
  
  for horizontalOffset = 1, GameInitializeData["floor"].initializeChunks do
    FloorAppender.append()
  end
end

return FloorBuilder