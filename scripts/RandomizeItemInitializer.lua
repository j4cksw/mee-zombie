ItemInitializer = ItemInitializer or require("scripts.ItemInitializer")

RandomizeItemInitializer = {}

function RandomizeItemInitializer.initialize(sourceSprite)
    local result = math.random(0, 100)
    if result <= 30 then
        ItemInitializer.initialize(sourceSprite)
    end
end

return RandomizeItemInitializer
