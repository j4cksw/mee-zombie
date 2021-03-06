describe("EnemiesRoller", function()
  local EnemiesRoller

  setup(function()
    _G.GameRule = {
      speed = 7
    }

    _G.EnemiesGroup = {
      {x=10},
      numChildren=1
    }

    _G.EnemyRepository = {
      getEnemyGroup = function()
        return EnemiesGroup
      end
    }
    spy.on(EnemyRepository, "getEnemyGroup")

    EnemiesRoller = require("scripts.EnemiesRoller")
  end)

  it("should acquire enemies group from EnemyRepository", function()
    EnemiesRoller.roll()

    assert.stub(EnemyRepository.getEnemyGroup).was_called()
  end)
  it("should move enemy to the left by 1 pixel", function()
    EnemiesGroup = {
      {x=10},
      numChildren=1
    }

    EnemiesRoller.roll()

    assert.are.equal(EnemiesGroup[1].x, 3)
  end)
end)
