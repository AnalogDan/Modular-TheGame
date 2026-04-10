VideoState = Class{__includes = BaseState}

function VideoState:init()
    SystemTransition.drawAt1080p = true
    SystemTransition.start('uncover', function() end)

    --example of the max width of a message. 
    --"Ah, there you are. I’ve been been been waiting waiting waiting What are we, but waiting people? What do we all do, but...",
    self.sequence = {
        {
            intro = gVideos['vid1'],
            loop = gVideos['loop1'],
            portraitStart = gTextures['profesorBig'],
            portraitEnd = gTextures['profesorBigEnd'],
            blipSet = 'teacherBlip',
            sound = 'vid1',
            dialogue = {
                "Hey Teo, ven.",
            }
        },
        {   intro = gVideos['vid2'], loop = gVideos['loop2'],
            portraitStart = gTextures['profesorBig'],
            portraitEnd = gTextures['profesorBigEnd'],
            blipSet = 'teacherBlip',
            sound = 'vid2',
            dialogue = {
                "Mañana es el examen final.",
                "¿Eres conciente de que si no lo pasas, repites la materia?",
            }
        },
        {   intro = gVideos['vid3'], loop = gVideos['loop3'], 
            portraitStart = gTextures['profesorBig'],
            portraitEnd = gTextures['profesorBigEnd'],
            blipSet = 'teacherBlip',
            sound = 'vid3',
            dialogue = {
                "Debes estudiar todo lo que vimos en el año...",
                "Mucha suerte.",
            }
        },
        {   intro = gVideos['vid4'], loop = gVideos['loop4'], 
            portraitStart = gTextures['caraBig'],
            portraitEnd = gTextures['caraBigEnd'],
            blipSet = 'faceBlip',
            sound = 'vid4',
            loopSound = 'faceMusic',
            dialogue = {
                "¡Hola!",
                "Parece que estás en aprietos.",
            }
        },
        {   intro = gVideos['vid5'], loop = gVideos['loop5'], 
            portraitStart = gTextures['caraBig'],
            portraitEnd = gTextures['caraBigEnd'],
            blipSet = 'faceBlip',
            sound = 'vid5',
            dialogue = {
                "¡Pero no te preocupes!",
                "Las matemáticas son más fáciles de lo que crees.",
            }
        },
        {   intro = gVideos['vid6'], loop = gVideos['loop6'], 
            portraitStart = gTextures['caraBig'],
            portraitEnd = gTextures['caraBigEnd'],
            blipSet = 'faceBlip',
            sound = 'vid6',
            killSound = true,
            dialogue = {
                "¡Buen viaje!",
            }
        }, 
        {   intro = gVideos['lvl0'], loop = gVideos['blackLoop'], 
            sound = "lvl0",
            isEnd = true, 
        }, 
    }
    self.dialogueIndex = 1
    self.showDialogue = false
    self.currentPortrait = nil
    self.currentIndex = 1
    self.state = "intro" 

    self.sequence[self.currentIndex].intro:play()
    Sound.playSFX('vid1')
    Sound.playTrack("children", "ambience", { fadeIn = 3, fadeOut = 5, loop = true, volume = 0.3 })

    self.cachedFontSize = nil
    self.dynamicFont = nil
    self.textTimer = 0
    self.visibleChars = 0
    self.textSpeed = 0.03 
end

--Blip system
local blipTimers = {} 
local function playBlip(blipSetName)
    local blipSet = gSounds[blipSetName]
    if not blipSet or #blipSet == 0 then return end
    blipTimers[blipSetName] = blipTimers[blipSetName] or 0
    if blipTimers[blipSetName] > 0 then
        return 
    end
    local blip = blipSet[math.random(#blipSet)]
    local pitch = 0.9 + math.random() * 0.2
    Sound.playSFX(blipSetName, {pitch = pitch})
    blipTimers[blipSetName] = blip:getDuration()
end
local function updateBlipTimers(dt) 
    for k, v in pairs(blipTimers) do
        if v > 0 then
            blipTimers[k] = v - dt
        end
    end
end

function VideoState:update(dt)
    updateBlipTimers(dt)
    SystemTransition.update(dt)
    --freeze when on transitions
    if SystemTransition.active then
        self.dx = 0
        self.dy = 0
        return
    end

     local current = self.sequence[self.currentIndex]
     local loop = current.loop

    if self.state == "intro" then
        if not current.intro:isPlaying() then -- When finishing the sequence
            if current.isEnd then
                self.state = "done"
                SystemTransition.start('cover', function()
                    gStateMachine:change('level3')
                    SystemTransition.drawAt1080p = false
                end)
                return
            end

            self.state = "loop"
            current.loop:play()
            if current.killSound then
                Sound.stop("ambience", 4)
                Sound.stop("music", 3)
            end
             if current.loopSound then
                Sound.playTrack(current.loopSound, "music", { loop = true})
            end
            
        end
    elseif self.state == "loop" then
        if not current.isEnd then
            if not current.loop:isPlaying() then
                
                current.loop:rewind()
                current.loop:play()
            end
        end

        if current.dialogue then
            self.showDialogue = true

            if self.dialogueIndex == 1 then
                self.currentPortrait = current.portraitStart
            end

            if self.dialogueIndex == #current.dialogue then
                self.currentPortrait = current.portraitEnd
            end

            
            if love.keyboard.wasPressed("return") then

                local current = self.sequence[self.currentIndex]
                local line = current.dialogue[self.dialogueIndex]

                -- 🟡 CASE 1: text still typing → finish it instantly
                if self.visibleChars < #line then
                    self.visibleChars = #line
                    self.textTimer = 0
                    return
                end

                -- 🟢 CASE 2: move to next line
                self.dialogueIndex = self.dialogueIndex + 1
                self.textTimer = 0
                self.visibleChars = 0

                if self.dialogueIndex <= #current.dialogue then

                    if self.dialogueIndex == #current.dialogue then
                        self.currentPortrait = current.portraitEnd
                    end

                    return
                end

                -- 🔴 CASE 3: dialogue finished → next sequence
                self.showDialogue = false
                self.dialogueIndex = 1
                loop:pause()

                if current.sound then
                    Sound.stopSFX(current.sound)
                end

                self.currentIndex = self.currentIndex + 1

                if self.currentIndex <= #self.sequence then
                    self.state = "intro"

                    local nextSeq = self.sequence[self.currentIndex]
                    self.dialogueIndex = 1
                    self.showDialogue = false

                    nextSeq.intro:play()

                    if nextSeq.sound then
                        Sound.playSFX(nextSeq.sound)
                    end
                else
                    self.state = "done"
                    gStateMachine:change('level3')
                    Sound.stop("ambience", 4)
                    Sound.stop("music", 3)
                end
            end

        else
            -- Normal behavior (no dialogue)
            if love.keyboard.wasPressed("return") then
                loop:pause()
                loop:rewind()
                self.currentIndex = self.currentIndex + 1
                if self.currentIndex <= #self.sequence then
                    self.state = "intro"
                    self.sequence[self.currentIndex].intro:play()
                else
                    -- self.state = "done"
                    -- Sound.stop("ambience", 4)
                    -- Sound.stop("music", 3)
                    -- SystemTransition.start('cover', function() 
                    --     gStateMachine:change('level3') 
                    --     SystemTransition.drawAt1080p = false
                    --     end)
                end
            end
        end
    end

    if self.showDialogue then
        local current = self.sequence[self.currentIndex]
        local line = current.dialogue[self.dialogueIndex]

        if line and self.visibleChars < #line then
            self.textTimer = self.textTimer + dt
            if self.textTimer >= self.textSpeed then
                self.textTimer = self.textTimer - self.textSpeed
                self.visibleChars = self.visibleChars + 1

                if current.blipSet then
                    playBlip(current.blipSet)
                end
            end
        end
    end
end
    

function VideoState:render()
    local video
    if self.state == "intro" then
        video = self.sequence[self.currentIndex].intro
    elseif self.state == "loop" then
        video = self.sequence[self.currentIndex].loop
    else
        return 
    end

    local windowW, windowH = love.graphics.getDimensions()
    local videoW, videoH = video:getWidth(), video:getHeight()
    local scale = math.min(windowW / videoW, windowH / videoH)
    local offsetX = (windowW - videoW * scale) / 2
    local offsetY = (windowH - videoH * scale) / 2
    love.graphics.draw(video, offsetX, offsetY, 0, scale, scale)

    if self.showDialogue and self.currentPortrait then
        local tex = self.currentPortrait
        local portraitScale = scale  
        love.graphics.draw(tex, offsetX, offsetY, 0, portraitScale, portraitScale)

        local current = self.sequence[self.currentIndex]
        local line = current.dialogue[self.dialogueIndex]
        if line then
            local textX = offsetX + 560 * scale
            local textY = offsetY + videoH * scale - 920 * scale
            local textWidth = videoW * scale - 800 * scale
            local baseFontSize = 45
            local scaledFontSize = math.floor(baseFontSize * scale)

            if not self.cachedFontSize or self.cachedFontSize ~= scaledFontSize then
                self.dynamicFont = love.graphics.newFont('fonts/dogica/dogicapixel.ttf', scaledFontSize)
                self.dynamicFont:setLineHeight(1.7)
                self.cachedFontSize = scaledFontSize
            end
            love.graphics.setFont(self.dynamicFont)
            love.graphics.setColor(0, 0, 0)
            local shownText = utf8_sub(line, 1, self.visibleChars)
            love.graphics.printf(shownText, textX, textY, textWidth, "left")
            love.graphics.setColor(1, 1, 1)
        end
    end

    SystemTransition.render()
end