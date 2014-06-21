describe("ScoreInitializer", function()
    it("should create score text", function()
        ScoreInitializer = require("scripts.ScoreInitializer")

        ScoreInitializer.initialize()

        assert.stub(display.newText).was_called_with(CurrentScore, -300, 128, "Bookshelf", 72)
    end)
end)