local AudioRepository = {}

AudioRepository.data = {}

function AudioRepository.add(name, value)
    AudioRepository.data[name] = value
end

function AudioRepository.get(name)
    return AudioRepository.data[name]
end

return AudioRepository
