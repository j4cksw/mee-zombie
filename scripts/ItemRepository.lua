ItemRepository = {}

ItemRepository.bulletGroup = nil

function ItemRepository.insert(bulletSprite)
  if not ItemRepository.bulletGroup then
    ItemRepository.bulletGroup = display.newGroup()
  end
  
  ItemRepository.bulletGroup:insert(bulletSprite)
end

function ItemRepository.removeAll()
  if ItemRepository.bulletGroup then
    display.remove(ItemRepository.bulletGroup)
  end
end

return ItemRepository