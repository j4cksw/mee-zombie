EnemyRepository = {
  enemyGroup = nil,

  setEnemyGroup = function(enemyGroup)
    EnemyRepository.enemyGroup=enemyGroup
  end,

  getEnemyGroup = function()
    return EnemyRepository.enemyGroup
  end
}
return EnemyRepository