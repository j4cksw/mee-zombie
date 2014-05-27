BulletInitializer = {}

PhysicsData = PhysicsData or require("config.PhysicsData")
BulletHitPlayerListener = BulletHitPlayerListener or require("scripts.BulletHitPlayerListener")
BulletRepository = BulletRepository or require("scripts.BulletRepository")

function BulletInitializer.initialize(swatSprite)
  local bulletSprite = SpriteInitializer.initializeByData({
    name="bullet",
    x=swatSprite.x-60,
    y=swatSprite.y+40,
    sequence="bullet"
  })

  local bulletPhysicsData = PhysicsData["bullet"]
  physics.addBody(bulletSprite,
    bulletPhysicsData.type,
    bulletPhysicsData.options)
    
  bulletSprite:addEventListener("collision", BulletHitPlayerListener.actionPerformed)

  bulletSprite:setLinearVelocity(-500, 0)
  
  BulletRepository.insert(bulletSprite)
end

return BulletInitializer