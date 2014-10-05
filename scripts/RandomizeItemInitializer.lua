local RandomizeItemInitializer = {}
package.loaded[...] = RandomizeItemInitializer

ItemInitializer = ItemInitializer or require("scripts.ItemInitializer")
ItemConfig = ItemConfig or require("config.ItemConfig")

function RandomizeItemInitializer.initialize(sourceSprite)
    local result = math.random(0, 100)
    if result <= ItemConfig.dropRate then
        ItemInitializer.initialize(sourceSprite)
    end
end

return RandomizeItemInitializer
