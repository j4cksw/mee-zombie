local ImageSheetFactory = {

    createFromImageSheetData = function(imageSheetData)
      local result = graphics.newImageSheet(imageSheetData.path, imageSheetData.options)
      return result
    end
}

return ImageSheetFactory
