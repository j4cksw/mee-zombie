ItemRoller = {}

ItemRepository = ItemRepository or require("scripts.ItemRepository")

function ItemRoller.roll()
  local itemGroup = ItemRepository.getAll()

  for i=1, itemGroup.numChildren do
    if itemGroup[i].isMovable then
      itemGroup[i].x = itemGroup[i].x - GameRule.speed
    end
  end
end

return ItemRoller