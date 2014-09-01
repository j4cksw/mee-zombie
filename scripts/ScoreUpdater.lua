ScoreUpdater = {}

LevelConfig = {
    {
        index = 1,
        raveSpriteSequence = "rave_level_1",
        scoreToNextLevel = 1
    },
    {
        index = 2,
        raveSpriteSequence = "rave_level_2",
        scoreToNextLevel = 2
    },
    {
        index = 3,
        raveSpriteSequence = "rave_level_3",
        scoreToNextLevel = 3
    },
    {
        index = 4,
        raveSpriteSequence = "rave_level_4",
        scoreToNextLevel = 4
    },
    {
        index = 5,
        raveSpriteSequence = "rave_level_5",
        scoreToNextLevel = 5000
    }
}
CurrentLevel = LevelConfig[1]

function ScoreUpdater.update()
    CurrentScore = CurrentScore+1
    ScoreText.text = tostring(CurrentScore)

    if CurrentScore >= CurrentLevel.scoreToNextLevel then
        CurrentLevel = LevelConfig[CurrentLevel.index+1]
        RaveLevelSprite:setSequence(CurrentLevel.raveSpriteSequence)
    end
end

return ScoreUpdater
