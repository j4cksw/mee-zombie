describe("ScoreUpdater", function()

    ScoreUpdater = {}

    function ScoreUpdater.update()
        CurrentScore = CurrentScore+1
    end

    it("should increase current score", function()
        CurrentScore = 0

        ScoreUpdater.update()

        assert.are.equal(CurrentScore, 1)
    end)
end)
