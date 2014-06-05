BackgroundRepository = {}

BackgroundRepository.bulletGroup = nil

function BackgroundRepository.insert(bulletSprite)
  if not BackgroundRepository.bulletGroup then
    BackgroundRepository.bulletGroup = display.newGroup()
  end
  
  BackgroundRepository.bulletGroup:insert(bulletSprite)
end

function BackgroundRepository.removeAll()
  if BackgroundRepository.bulletGroup then
    display.remove(BackgroundRepository.bulletGroup)
  end
  BackgroundRepository.bulletGroup = nil
end

return BackgroundRepository