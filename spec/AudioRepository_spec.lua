describe("AudioRepository", function()

    it("add() should insert given data nad key to its table", function()

        AudioRepository = require("scripts/AudioRepository")

        local fakeAudioInstance = {}

        AudioRepository.add("game_bgm", fakeAudioInstance)

        assert.are.equal(AudioRepository.data["game_bgm"], fakeAudioInstance)
    end)
end)
