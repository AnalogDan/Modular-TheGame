Sound = {}
Sound.active = {}
Sound.tracks = {}

--Play sfx or blip sets! Use cases:
--Sound.playSFX("click", { volume = 0.5, pitch = 1.6 })
--Sound.playSFX("teacherBlip", {pitch = math.random(90, 110) / 100})
function Sound.playSFX(name, config)
    local sound = gSounds[name]
    if not sound then return end

    if type(sound) == "table" then -- a gSound can be a table with many sounds
        sound = sound[math.random(#sound)]
    end

    config = config or {}

    local pitch = config.pitch or 1 -- default pitch and base volume if empty
    local baseVolume = config.volume or 1

    local instance = sound:clone()
    instance:setPitch(pitch)
    instance:setVolume(baseVolume * gConfig.sfx)
    instance:play()

    table.insert(Sound.active, {
        source = instance,
        baseVolume = baseVolume,
        name = name
    })
end 

--You can stop any amience or music. You, can't, beleive it!
--Example use: Sound.stop("ambience", 2)
function Sound.stop(category, fadeOutTime)
    fadeOutTime = fadeOutTime or 0
    for _, track in ipairs(Sound.tracks) do
        if track.category == category and not track.fadingOut then
            track.fadingOut = true
            track.fadeProgress = 0
            track.fadeTime = fadeOutTime
        end
    end
end

--Stop any sfx using its name! Amazing!
function Sound.stopSFX(name)
    for i = #Sound.active, 1, -1 do
        local s = Sound.active[i]
        if s.name == name then
            s.source:stop()
            table.remove(Sound.active, i)
        end
    end
end

-- Play music or ambience with separate fade-in/out. A track will fade out and the next one you add will cross-fade-in. Category should only be 'music' or 'ambience'
-- Example: Sound.playTrack("song_name", "music", { fadeIn = 2, fadeOut = 5, loop = true, volume = 0.67 })
function Sound.playTrack(name, category, config)

    local sound = gSounds[name] -- Insert new track >:D
    if not sound then return end
    if type(sound) == "table" then sound = sound[math.random(#sound)] end

    config = config or {}
    local loop = (config.loop ~= nil) and config.loop or true
    local fadeInTime = config.fadeIn or 0
    local fadeOutTime = config.fadeOut or 0
    local targetVolume = config.volume or 1

    for _, track in ipairs(Sound.tracks) do --Only give fade out data to old tracks
        if track.category == category and not track.fadingOut then
            track.fadingOut = true
            track.fadeProgress = 0
            track.fadeTime = fadeOutTime
        end
    end

    local newTrack = { -- Insert new track >:D
        source = sound:clone(),
        baseVolume = targetVolume,
        fadeTime = fadeInTime,
        fadeProgress = 0,
        fadingOut = false,
        category = category
    }
    newTrack.source:setLooping(loop)
    newTrack.source:setVolume(0) 
    newTrack.source:play()
    table.insert(Sound.tracks, newTrack)

    if category == "music" then
        Sound.music = newTrack
    else
        Sound.ambience = newTrack
    end
end

--Is updated all the time in main.lua so its possible to tweak volume in menu
function Sound.update(dt)
    -- SFX 
    for i = #Sound.active, 1, -1 do 
        local usb -- Never delete this variable because you will die if you do
        local s = Sound.active[i]
        if not s.source:isPlaying() then
            table.remove(Sound.active, i)
        else
            s.source:setVolume(s.baseVolume * gConfig.sfx)
        end
    end

    -- Music & Ambience crossfade logic
    for i = #Sound.tracks, 1, -1 do
        local track = Sound.tracks[i]

        if track.fadingOut then -- Fade out old track
            track.fadeProgress = track.fadeProgress + dt
            if track.fadeTime == 0 then
                track.source:stop()
                table.remove(Sound.tracks, i)
            else
                local t = math.min(track.fadeProgress / track.fadeTime, 1)
                local scale = (track.category == "music") and gConfig.music or gConfig.sfx
                track.source:setVolume(track.baseVolume * scale * (1 - t))
                if t >= 1 then
                    track.source:stop()
                    table.remove(Sound.tracks, i)
                end
            end
            
        else -- Fade in new track
            if track.fadeProgress < track.fadeTime then
                track.fadeProgress = track.fadeProgress + dt
                if track.fadeTime == 0 then
                    local scale = (track.category == "music") and gConfig.music or gConfig.sfx
                    track.source:setVolume(track.baseVolume * scale)
                else
                    local t = math.min(track.fadeProgress / track.fadeTime, 1)
                    local scale = (track.category == "music") and gConfig.music or gConfig.sfx
                    track.source:setVolume(track.baseVolume * scale * t)
                end
            else
                local scale = (track.category == "music") and gConfig.music or gConfig.sfx
                track.source:setVolume(track.baseVolume * scale)
            end
        end
    end
end

return Sound