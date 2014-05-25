describe("GameScene", function()
  
  local gameScene
  
  setup(function()
    gameScene = require("scripts.scene.GameScene")
  end) 
  
  it("should call GameInitializer when create scene", function()
    gameScene:createScene()
    
    assert.stub(GameInitializer.initialize).was_called()
  end)
end)