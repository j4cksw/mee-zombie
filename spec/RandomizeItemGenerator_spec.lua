describe("RandomizedItemInitializer", function()

    local generator = {}

    function generator.initialize()end 

    it("should random number from 0-100", function()

        generator.initialize()

        assert.stub(math.random).was_called_with(0, 100)
    end)
end)
