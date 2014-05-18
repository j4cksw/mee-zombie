local FloorRoller = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")

function FloorRoller.roll()
  local floorChunk = FloorRepository.getChunkByIndex(1)
  floorChunk[1].x = floorChunk[1].x - 5
end

return FloorRoller