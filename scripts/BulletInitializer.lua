BulletInitializer = {}

PhysicsData = PhysicsData or require("config.PhysicsData")
BulletHitPlayerListener = BulletHitPlayerListener or require("scripts.BulletHitPlayerListener")

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
end

return BulletInitializer