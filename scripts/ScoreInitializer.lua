ScoreInitializer = {}

function ScoreInitializer.initialize()
    CurrentScore = 0
    ScoreText = display.newText(CurrentScore, -300, 128, "Bookshelf", 72)
end
return ScoreInitializer