BackgroundRoller = {}

BackgroundRepository = BackgroundRepository or require("scripts.BackgroundRepository")

function BackgroundRoller.roll()
  local backgroundGroup = BackgroundRepository.getBackgroundGroup()
  
  backgroundGroup[1].x = backgroundGroup[1].x - 8
end

return BackgroundRoller