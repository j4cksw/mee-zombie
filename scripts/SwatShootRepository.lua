SwatShootTimerRepository = {}

function SwatShootTimerRepository.insert(timer)
  if SwatShootTimerRepository.entryTable == nil then
    SwatShootTimerRepository.entryTable = {}
  end
  table.insert(SwatShootTimerRepository.entryTable, timer)
end

function SwatShootTimerRepository.getAll(timer)
  return SwatShootTimerRepository.entryTable
end

return SwatShootTimerRepository