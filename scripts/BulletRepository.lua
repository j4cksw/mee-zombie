BulletRepository = {}

BulletRepository.bulletGroup = nil

function BulletRepository.insert(bulletSprite)
  if not BulletRepository.bulletGroup then
    BulletRepository.bulletGroup = display.newGroup()
  end
  
  BulletRepository.bulletGroup:insert(bulletSprite)
end

function BulletRepository.removeAll()
  if BulletRepository.bulletGroup then
    display.remove(BulletRepository.bulletGroup)
  end
  BulletRepository.bulletGroup = nil
end

return BulletRepository