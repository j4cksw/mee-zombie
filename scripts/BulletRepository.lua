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
    for i=1,BulletRepository.bulletGroup.numChildren do
      BulletRepository.bulletGroup[i]:removeSelf()
    end
  end
end

return BulletRepository