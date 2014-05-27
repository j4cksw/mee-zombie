BulletRepository = {}

BulletRepository.bulletGroup = nil

function BulletRepository.insert(bulletSprite)
  if not BulletRepository.bulletGroup then
    BulletRepository.bulletGroup = display.newGroup()
    BulletRepository.bulletGroup:insert(bulletSprite)
  end
end

function BulletRepository.removeAll()
  if BulletRepository.bulletGroup then
    for i=1,BulletRepository.bulletGroup.numChildren do
      BulletRepository.bulletGroup[i]:removeSelf()
    end
  end
end

return BulletRepository