BackgroundRoller = {}

BackgroundRepository = BackgroundRepository or require("scripts.BackgroundRepository")

function BackgroundRoller.roll()
  local backgroundGroup = BackgroundRepository.getBackgroundGroup()

  for i = 1,backgroundGroup.numChildren do
    backgroundGroup[i].x = backgroundGroup[i].x - 8

    if backgroundGroup[i].x <= -(backgroundGroup[i].width) then
      backgroundGroup[i].x = backgroundGroup[i].width
    end
  end
end

return BackgroundRoller