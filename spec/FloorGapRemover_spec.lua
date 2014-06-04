describe("FloorGapRemoveCommand", function()

    local FloorGapRemoveCommand

    local floorGroup = {}

    setup(function()
      FloorRepository = {
        getFloorGroup = function()
          return floorGroup
        end
      }
      spy.on(FloorRepository, "getFloorGroup")

      FloorGapRemoveCommand = require("scripts.FloorGapRemoveCommand")
    end)

    before_each(function()
      floorGroup = {
        { { x = 10, width=20}, numChildren = 1 },
        { { x = 35, width=20}, numChildren = 1 },
        numChildren = 2
      }
    end)

    it("should get floor group from repository", function()
      FloorGapRemoveCommand.execute()

      assert.stub(FloorRepository.getFloorGroup).was_called()
    end)

    it("should move lacked floor piece to close to previous piece when gap detected", function()
      FloorGapRemoveCommand.execute()

      assert.are.same(floorGroup, {
        { { x = 10, width=20}, numChildren = 1 },
        { { x = 30, width=20}, numChildren = 1 },
        numChildren = 2
      })
    end)
end)