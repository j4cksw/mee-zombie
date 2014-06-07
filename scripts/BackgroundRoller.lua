BackgroundRoller = {}

BackgroundRepository = BackgroundRepository or require("scripts.BackgroundRepository")

local layerSpeed = { 8, 8, 6, 6}

function BackgroundRoller.roll()
  local backgroundGroup = BackgroundRepository.getBackgroundGroup()

  for i = 1,backgroundGroup.numChildren do
    backgroundGroup[i].x = backgroundGroup[i].x - layerSpeed[i]

    if (backgroundGroup[i].x + (backgroundGroup[i].width/2)) <= 0 then
      backgroundGroup[i].x = (backgroundGroup[i].width + (backgroundGroup[i].width/2))
    end
  end
end

return BackgroundRoller