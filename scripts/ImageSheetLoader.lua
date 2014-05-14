local ImageSheetLoader = {}

ImageSheetFactory = ImageSheetFactory or require("scripts.ImageSheetFactory")
ImageSheetsData = ImageSheetsData or require("scripts.ImageSheetsData")

function ImageSheetLoader.loadByNames(names)
  ImageSheetFactory.createFromImageSheetData(ImageSheetsData[names[1]])
end

return ImageSheetLoader