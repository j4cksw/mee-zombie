describe("ScoreUpdater", function()

    before_each(function()
        ScoreUpdater = require("scripts.ScoreUpdater")
    end)

    it("should increase current score", function()
        CurrentScore = 0

        ScoreUpdater.update()

        assert.are.equal(CurrentScore, 1)
    end)

    it("should update score text", function()
        CurrentScore = 0
        ScoreText = {
            text = nil
        }

        ScoreUpdater.update()

        assert.are.equal(ScoreText.text, "1")
    end)

    it("should increase level", function()
        ScoreUpdater.update()


    end)

end)
