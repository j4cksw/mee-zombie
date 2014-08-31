describe("RandomizedItemInitializer", function()
    math = {
        random = function()end
    }

    local generator = {}

    function generator.initialize()
        math.random(0, 100)
    end

    it("should random number from 0-100", function()
        stub(math, "random")

        generator.initialize()

        assert.stub(math.random).was_called_with(0, 100)
    end)
end)
