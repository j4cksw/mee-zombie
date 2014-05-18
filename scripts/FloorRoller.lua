local FloorRoller = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")

local ROLL_SPEED = 5

function FloorRoller.roll()
  for chunkIndex, floorChunk in pairs(FloorRepository.getFloorGroup()) do
    for pieceIndex, floorPiece in pairs(floorChunk) do
      floorPiece.x = floorPiece.x - ROLL_SPEED
    end
  end
end

return FloorRoller