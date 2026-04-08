Sound = {}
Sound.active = {}

function Sound.playSFX(name, config)
    local sound = gSounds[name]
    if not sound then return end

    if type(sound) == "table" then 
        sound = sound[math.random(#sound)]
    end

    config = config or {}

    local pitch = config.pitch or 1
    local baseVolume = config.volume or 1

    local instance = sound:clone()
    instance:setPitch(pitch)
    instance:setVolume(baseVolume * gConfig.sfx)
    instance:play()

    table.insert(Sound.active, {
        source = instance,
        baseVolume = baseVolume
    })
end 

-- Play music or ambience with separate fade-in/out
function Sound.playTrack(name, category, config)
    local sound = gSounds[name]
    if not sound then return end
    if type(sound) == "table" then sound = sound[math.random(#sound)] end

    config = config or {}
    local loop = (config.loop ~= nil) and config.loop or true
    local fadeInTime = config.fadeIn or 0
    local fadeOutTime = config.fadeOut or 0
    local targetVolume = config.volume or 1

    local volumeScale = (category == "music") and gConfig.music or gConfig.sfx

    -- New track container
    local newTrack = {
        source = sound:clone(),
        targetVolume = targetVolume * volumeScale,
        fadeTime = fadeInTime,
        fadeProgress = 0,
        fadingOut = false
    }

    newTrack.source:setLooping(loop)
    newTrack.source:setVolume(0)  -- start silent for fade-in
    newTrack.source:play()

    -- Handle old track fading out
    local oldTrack = (category == "music") and Sound.music or Sound.ambience
    if oldTrack then
        oldTrack.fadingOut = true
        oldTrack.fadeProgress = 0
        oldTrack.fadeTime = fadeOutTime
    end

    if category == "music" then
        Sound.music = newTrack
    else
        Sound.ambience = newTrack
    end
end

function Sound.update(dt)
    -- SFX 
    for i = #Sound.active, 1, -1 do 
        local usb 
        local s = Sound.active[i]
        if not s.source:isPlaying() then
            table.remove(Sound.active, i)
        else
            s.source:setVolume(s.baseVolume * gConfig.sfx)
        end
    end

    -- Music & Ambience crossfade logic
    for _, track in pairs({Sound.music, Sound.ambience}) do
        if track then
            if track.fadingOut then
                track.fadeProgress = track.fadeProgress + dt
                local t = math.min(track.fadeProgress / track.fadeTime, 1)
                track.source:setVolume(track.targetVolume * (1 - t))
                if t >= 1 then track.source:stop() end
            else
                -- fade-in
                if track.fadeProgress < track.fadeTime then
                    track.fadeProgress = track.fadeProgress + dt
                    local t = math.min(track.fadeProgress / track.fadeTime, 1)
                    track.source:setVolume(track.targetVolume * t)
                else
                    -- sync with config volume
                    local scale = (track == Sound.music) and gConfig.music or gConfig.sfx
                    track.source:setVolume(track.targetVolume * scale)
                end
            end
        end
    end
end

return Sound