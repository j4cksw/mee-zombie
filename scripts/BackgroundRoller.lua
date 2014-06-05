BackgroundRoller = {}

BackgroundRepository = BackgroundRepository or require("scripts.BackgroundRepository")

function BackgroundRoller.roll()
  BackgroundRepository.getBackgroundGroup()
  
end

return BackgroundRoller