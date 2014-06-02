FloorGapRemoveCommand = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")

function getLeftEdgePosition(sprite)
  return sprite.x - (sprite.width/2)
end

function getRightEdgePosition(sprite)
  return sprite.x + (sprite.width/2)
end

function FloorGapRemoveCommand.execute()
  local floorGroup = FloorRepository.getFloorGroup()

  for chunkIndex = 2, floorGroup.numChildren do
    for pieceIndex = 1, floorGroup[chunkIndex].numChildren do
      local targetPiece = floorGroup[chunkIndex][pieceIndex]
      local sourcePiece = floorGroup[chunkIndex-1][pieceIndex]
      if getLeftEdgePosition(targetPiece)> getRightEdgePosition(sourcePiece) then
        targetPiece.x = getRightEdgePosition(sourcePiece) + (targetPiece.width/2)
      end
    end
  end
end

return FloorGapRemoveCommand