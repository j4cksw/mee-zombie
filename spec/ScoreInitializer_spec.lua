describe("ScoreInitializer", function()

    setup(function()
        display = {
            newText = function () end
        }
        stub(display, "newText")

        ScoreInitializer = require("scripts.ScoreInitializer")
    end)

    before_each(function()
        CurrentScore = nil
    end)

    it("should set CurrentScore to 0", function()
        ScoreInitializer.initialize()

        assert.are.equal(CurrentScore, 0)
    end)

    it("should create score text", function()
        ScoreInitializer.initialize()

        assert.stub(display.newText).was_called_with(CurrentScore, -300, 128, "Bookshelf", 72)
    end)
end)