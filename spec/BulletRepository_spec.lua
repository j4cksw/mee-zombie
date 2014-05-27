describe("BulletRepository", function()
    
    local fakeGroup = {}
    local fakeBullet = {}
    
    setup(function()
      display = {
        newGroup = function()
          return fakeGroup
        end
      }
      spy.on(display, "newGroup")
      
      stub(fakeGroup, "insert")
      stub(fakeGroup, "removeSelf")
      
      BulletRepository = require("scripts.BulletRepository")
    end)

    it("should create group if not available when insert", function()
      BulletRepository.insert(fakeBullet)

      assert.stub(display.newGroup).was_called()
    end)

    it("should insert given bullet sprite to group when insert", function()
      BulletRepository.insert(fakeBullet)
      
      assert.stub(fakeGroup.insert).was_called_with(fakeGroup, fakeBullet)
    end)

    it("should remove group when removeAll", function()
      BulletRepository.removeAll()
      
      assert.stub(fakeGroup.removeSelf).was_called_with(fakeGroup)
    end)
end)