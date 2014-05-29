ItemRoller = {}

ItemRepository = ItemRepository or require("scripts.ItemRepository")

function ItemRoller.roll()
  local itemGroup = ItemRepository.getAll()

  for i=1, itemGroup.numChildren do
    if itemGroup[1].isMovable then
      itemGroup[1].x = itemGroup[1].x - 8
    end
  end
end

return ItemRoller