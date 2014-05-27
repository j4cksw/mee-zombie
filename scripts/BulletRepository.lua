BulletRepository = {}

BulletRepository.bulletGroup = nil

function BulletRepository.insert(bulletSprite)
  if not BulletRepository.bulletGroup then
    BulletRepository.bulletGroup = display.newGroup()
    BulletRepository.bulletGroup:insert(bulletSprite)
  end
end

return BulletRepository