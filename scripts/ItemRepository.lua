ItemRepository = {}

ItemRepository.itemGroup = nil

function ItemRepository.insert(bulletSprite)
  if not ItemRepository.itemGroup then
    ItemRepository.itemGroup = display.newGroup()
  end
  
  ItemRepository.itemGroup:insert(bulletSprite)
end

function ItemRepository.removeAll()
  if ItemRepository.itemGroup then
    display.remove(ItemRepository.itemGroup)
  end
  ItemRepository.itemGroup = nil
end

return ItemRepository