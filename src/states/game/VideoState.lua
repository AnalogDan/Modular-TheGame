VideoState = Class{__includes = BaseState}

function VideoState:init()
    --example of the max width of a message. 
    --"Ah, there you are. I’ve been been been waiting waiting waiting What are we, but waiting people? What do we all do, but...",
    self.sequence = {
        {
            intro = gVideos['vid1'],
            loop = gVideos['loop1'],
            portraitStart = gTextures['profesorBig'],
            portraitEnd = gTextures['profesorBigEnd'],
            blipSet = 'teacherBlip',
            sound = gSounds['vid1'],
            dialogue = {
                "Hey Teo, ven.",
            }
        },
        {   intro = gVideos['vid2'], loop = gVideos['loop2'],
            portraitStart = gTextures['profesorBig'],
            portraitEnd = gTextures['profesorBigEnd'],
            blipSet = 'teacherBlip',
            sound = gSounds['vid2'],
            dialogue = {
                "Mañana es el examen final.",
                "¿Eres conciente de que si no lo pasas, repites la materia?",
            }
        },
        {   intro = gVideos['vid3'], loop = gVideos['loop3'], 
            portraitStart = gTextures['profesorBig'],
            portraitEnd = gTextures['profesorBigEnd'],
            blipSet = 'teacherBlip',
            sound = gSounds['vid3'],
            dialogue = {
                "Debes estudiar todo lo que vimos en el año...",
                "Mucha suerte.",
            }
        },
        {   intro = gVideos['vid4'], loop = gVideos['loop4'], 
            portraitStart = gTextures['caraBig'],
            portraitEnd = gTextures['caraBigEnd'],
            blipSet = 'faceBlip',
            sound = gSounds['vid4'],
            loopSound = gSounds['faceMusic'],
            dialogue = {
                "¡Hola!",
                "Yo te puedo aydar a aprobar el examen.",
            }
        },
        {   intro = gVideos['vid5'], loop = gVideos['loop5'], 
            portraitStart = gTextures['caraBig'],
            portraitEnd = gTextures['caraBigEnd'],
            blipSet = 'faceBlip',
            sound = gSounds['vid5'],
            dialogue = {
                "¿Ves la gráfica sobre mi?",
                "Sólo tienes que tocarla. Te mostraré algo.",
            }
        },
        {   intro = gVideos['vid6'], loop = gVideos['loop6'], 
            portraitStart = gTextures['caraBig'],
            portraitEnd = gTextures['caraBigEnd'],
            blipSet = 'faceBlip',
            sound = gSounds['vid6'],
            killSound = true,
            dialogue = {
                "¡Buen viaje!",
            }
        }, 
        {   intro = gVideos['lvl0'], loop = gVideos['blackLoop'], 
        }, 
    }
    self.dialogueIndex = 1
    self.showDialogue = false
    self.currentPortrait = nil
    self.currentIndex = 1
    self.state = "intro" 
    self.sequence[self.currentIndex].intro:play()
    gSounds['vid1']:play()
    gSounds['faceMusic']:setVolume(1) 
    gSounds['children']:setVolume(0.3)
    gSounds['children']:setLooping(true)
    gSounds['children']:play()

    self.cachedFontSize = nil
    self.dynamicFont = nil
    self.textTimer = 0
    self.visibleChars = 0
    self.textSpeed = 0.03 
end

local function playBlip(blipSetName)
    local blipSet = gSounds[blipSetName]
    if not blipSet or #blipSet == 0 then return end

    local blip = blipSet[math.random(#blipSet)] 
    blip:setPitch(0.9 + math.random() * 0.2)     
    blip:stop()                                  
    blip:play()
end

function VideoState:update(dt)
     local current = self.sequence[self.currentIndex]
     local loop = current.loop

    if self.state == "intro" then
        if not current.intro:isPlaying() then
            self.state = "loop"
            current.loop:play()
            if current.killSound then
                gSounds['children']:stop() 
                gSounds['faceMusic']:stop() 
            end
             if current.loopSound then
                current.loopSound:play()
            end
            
        end
    elseif self.state == "loop" then
        if not current.loop:isPlaying() then
            current.loop:rewind()
            current.loop:play()
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
                self.textTimer = 0
                self.visibleChars = 0
                self.dialogueIndex = self.dialogueIndex + 1

                if self.dialogueIndex == #current.dialogue then
                    self.currentPortrait = current.portraitEnd
                end

                if self.dialogueIndex > #current.dialogue then
                    self.showDialogue = false
                    self.dialogueIndex = 1
                    loop:pause()

                    if current.sound then
                        current.sound:stop()
                    end

                    self.currentIndex = self.currentIndex + 1

                    if self.currentIndex <= #self.sequence then
                        self.state = "intro"
                        self.sequence[self.currentIndex].intro:play()
                        self.dialogueIndex = 1   
                        self.showDialogue = false
                        local nextSeq = self.sequence[self.currentIndex]
                        nextSeq.intro:play()

                        if nextSeq.sound then
                            nextSeq.sound:play()
                        end
                    else
                        self.state = "done"
                        gStateMachine:change('level1')
                        gSounds['children']:stop()
                        gSounds['faceMusic']:stop()
                    end
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
                    self.state = "done"
                    gStateMachine:change('level1')
                    gSounds['children']:stop()
                    gSounds['faceMusic']:stop()
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
end