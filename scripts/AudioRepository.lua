local AudioRepository = {}

AudioRepository.data = {}

function AudioRepository.add(name, value)
    AudioRepository.data[name] = value
end

return AudioRepository
