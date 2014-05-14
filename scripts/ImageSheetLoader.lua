local ImageSheetLoader = {}

ImageSheetFactory = ImageSheetFactory or require("scripts.ImageSheetFactory")
ImageSheetsData = ImageSheetsData or require("scripts.ImageSheetsData")

function ImageSheetLoader.loadByNames(names)
  ImageSheetsTable = {}
  
  for key, value in pairs(names) do
    ImageSheetsTable[value] = ImageSheetFactory.createFromImageSheetData(ImageSheetsData[value])
  end
end

return ImageSheetLoader