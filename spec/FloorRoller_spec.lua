describe("FloorRoller", function()
  local FloorRoller

  local Floor

  setup(function()
    FloorRepository = {
      getFloorGroup = function()
        return Floor
      end
    }
    spy.on(FloorRepository, "getFloorGroup")

    FloorRoller = require("scripts.FloorRoller")
  end)

  function setupFloorData()
    Floor = {
      {
        {x=10},{x=10}
      },
      {
        {x=10},{x=10}
      },
      {
        {x=10},{x=10}
      },
      {
        {x=10},{x=10}
      },
      {
        {x=10},{x=10}
      }
    }
  end

  it("should acquire every floor piece from Repository ", function()
    setupFloorData()

    FloorRoller.roll()

    assert.stub(FloorRepository.getFloorGroup).was_called(1)
  end)

  it("should move every floor piece -5 pixels", function()
    setupFloorData()

    FloorRoller.roll()

    for chunkIndex, floorChunk in pairs(Floor) do
      for pieceIndex, floorPiece in pairs(floorChunk) do
        assert.are.equal(floorPiece.x, 5)
      end
    end
  end)

  it("should remove floor piece when roll out of screen")

  it("should add new floor piece")
end)
