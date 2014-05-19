local FloorDataGenerator = {}
  local function addSamples(numberOfSamples)
    for i = 1, numberOfSamples do
      table.insert(Floor, {
        {x=10, width=20},
        {x=10, width=20},
        numChildren=2
      })
    end
  end

  function FloorDataGenerator.setupFloorData(numberOfSamples)
    Floor = {
      numChildren=numberOfSamples
    }
    addSamples(numberOfSamples)
  end

return FloorDataGenerator