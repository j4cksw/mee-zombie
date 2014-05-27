describe("BulletRepository", function()

    setup(function()
      display = {
        newGroup = function()
          return fakeGroup
        end
      }
    end)

    it("should create group if not available when insert", function()
      BulletRepository = require("scripts.BulletRepository")

      BulletRepository.insert()

      assert.stub(display.newGroup).was_called()
    end)

    it("should insert given bullet sprite to group when insert")

    it("should remove group when removeAll")
end)