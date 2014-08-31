ScoreUpdater = {}

function ScoreUpdater.update()
    CurrentScore = CurrentScore+1
    ScoreText.text = tostring(CurrentScore)
end

return ScoreUpdater
