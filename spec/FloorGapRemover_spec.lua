describe("FloorGapRemoveCommand", function()

    local FloorGapRemoveCommand

    local floorGroup = {}

    before_each(function()
        FloorGapRemoveCommand = require("scripts.FloorGapRemoveCommand")

        floorGroup = {
            { { x = 10, width=20}, numChildren = 1 },
            { { x = 35, width=20}, numChildren = 1 },
            numChildren = 2
        }

        _G.FloorRepository = {
            getFloorGroup = function()
                return floorGroup
            end
        }
        spy.on(FloorRepository, "getFloorGroup")
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
