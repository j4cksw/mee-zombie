describe("GameScene", function()

  local gameScene

  local scene = {
    addEventListener = function ( ... )
      -- body
    end,
    view = {}
  }

  before_each(function()
    _G.storyboard = {
      newScene = function ( ... )
        return scene
      end
    }

    GameInitializer = {}
    stub(GameInitializer, "initialize")

    gameScene = require("scripts.scene.GameScene")
  end)

  it("should call GameInitializer when create scene", function()
    gameScene:createScene()

    assert.stub(GameInitializer.initialize).was_called()
  end)
end)
