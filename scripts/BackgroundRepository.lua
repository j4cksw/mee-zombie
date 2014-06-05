BackgroundRepository = {}

BackgroundRepository.backgroundGroup = nil

function BackgroundRepository.insert(bulletSprite)
  if not BackgroundRepository.backgroundGroup then
    BackgroundRepository.backgroundGroup = display.newGroup()
  end
  
  BackgroundRepository.backgroundGroup:insert(bulletSprite)
end

function BackgroundRepository.removeAll()
  if BackgroundRepository.backgroundGroup then
    display.remove(BackgroundRepository.backgroundGroup)
  end
  BackgroundRepository.backgroundGroup = nil
end

function BackgroundRepository.getBackgroundGroup()
  return BackgroundRepository.backgroundGroup
end

return BackgroundRepository