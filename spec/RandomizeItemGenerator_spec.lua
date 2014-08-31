describe("RandomizedItemInitializer", function()
    local randomResult = 0
    local generator

    setup(function()
        ItemInitializer ={}
        ItemInitializer.initialize = function()end

        math = {
            random = function()
                return randomResult
            end
        }

        generator = require("scripts.RandomizeItemInitializer")
    end)

    it("should call ItemInitializer.initialize when random result is lower than 30", function()
        randomResult = 0
        spy.on(ItemInitializer, "initialize")
        sourceSprite = {}
        generator.initialize(sourceSprite)

        assert.stub(ItemInitializer.initialize).was_called_with(sourceSprite)
    end)

    it("should call ItemInitializer.initialize when random result is greater than 30", function()
        randomResult = 31
        spy.on(ItemInitializer, "initialize")
        sourceSprite = {}
        generator.initialize(sourceSprite)

        assert.stub(ItemInitializer.initialize).was_not_called()
    end)
end)
