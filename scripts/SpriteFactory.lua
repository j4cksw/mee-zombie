local SpriteFactory = {}

SpriteSequenceData = SpriteSequenceData or require("config.SpriteSequenceData")

function SpriteFactory.createFromImageSheetName(imageSheetName)
  return display.newSprite(ImageSheetsTable[imageSheetName], SpriteSequenceData[imageSheetName])
end

return SpriteFactory