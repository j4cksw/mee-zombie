describe("BackgroundRoller", function()
  local BackgroundRoller

  local fakeBackgroundGroup

  setup(function()
    BackgroundRepository = {
      getBackgroundGroup = function()
        return fakeBackgroundGroup
      end
    }
    spy.on(BackgroundRepository, "getBackgroundGroup")

    BackgroundRoller = require("scripts.BackgroundRoller")
  end)

  before_each(function()
    fakeBackgroundGroup = {
      {
        x=0
      },
      numChildren=1
    }
  end)

  it("should get background from BackgroundRepository", function()
    BackgroundRoller.roll()

    assert.stub(BackgroundRepository.getBackgroundGroup).was_called()
  end)

  it("should move background sprite with constant speed", function()
    BackgroundRoller.roll()

    assert.are.equal(fakeBackgroundGroup[1].x, -8)
  end)
end)