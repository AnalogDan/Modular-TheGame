Config = {}

function Config.load()
    if love.filesystem.getInfo("config.lua") then
        local data = love.filesystem.load("config.lua")()
        return {
            sfx = data.sfx or 1,
            music = data.music or 1,
            fullscreen = data.fullscreen ~= false 
        }
    else
        return {
            sfx = 1,
            music = 1,
            fullscreen = true
        }
    end
end

function Config.save(sfx, music, fullscreen)
    local data = "return {\n" ..
        "sfx = " .. sfx .. ",\n" ..
        "music = " .. music .. ",\n" ..
        "fullscreen = " .. tostring(fullscreen) .. "\n" ..
    "}"

    love.filesystem.write("config.lua", data)
end

function Config.update(sfx, music, fullscreen)
    gConfig.sfx = sfx
    gConfig.music = music
    gConfig.fullscreen = fullscreen

    Config.save(sfx, music, fullscreen)
end