describe("ScoreUpdater", function()

    local ScoreUpdater

    before_each(function()
        ScoreUpdater = require("scripts.ScoreUpdater")

        _G.RaveLevelSprite = {
            setSequence = function()end
        }
    end)

    it("should increase current score", function()
        _G.CurrentScore = 0

        ScoreUpdater.update()

        assert.are.equal(CurrentScore, 1)
    end)

    it("should update score text", function()
        _G.CurrentScore = 0
        _G.ScoreText = {
            text = nil
        }

        ScoreUpdater.update()

        assert.are.equal(ScoreText.text, "1")
    end)

end)
