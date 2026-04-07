Save = {}

function Save.load()
    if love.filesystem.getInfo("save.lua") then
        local data = love.filesystem.load("save.lua")()
        return data.maxChapter or 1
    else
        return 1
    end
end

function Save.save(maxChapter)
    local data = "return { maxChapter = " .. tostring(maxChapter) .. " }"
    love.filesystem.write("save.lua", data)
end