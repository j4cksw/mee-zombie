describe("EnemyRepository", function()
  local EnemyRepository
  local fakeEnemyGroup = {}

  setup(function()
    EnemyRepository = require("scripts.EnemyRepository")
  end)

  it("should assign a given enemyGroup to EnemyRepository.enemyGroup", function()
    EnemyRepository.setEnemyGroup(fakeEnemyGroup)

    assert.are.equal(EnemyRepository.enemyGroup, fakeEnemyGroup)
  end)

  it("should return an enemyGroup when call getEnemyGroup", function()
    EnemyRepository.setEnemyGroup(fakeEnemyGroup)

    local result = EnemyRepository.getEnemyGroup()

    assert.are.equal(result, fakeEnemyGroup)
  end)
end)