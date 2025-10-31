VideoState = Class{__includes = BaseState}

function VideoState:init()
    self.sequence = {
        {
            intro = gVideos['vid1'],
            loop = gVideos['loop1'],
            portraitStart = gTextures['profesorBig'],
            portraitEnd = gTextures['profesorBigEnd'],
            dialogue = {
                "Ah, there you are. I’ve been waiting.",
                "You must understand, this experiment is crucial.",
                "Now, pay close attention to what happens next..."
            }
        },
        { intro = gVideos['vid2'], loop = gVideos['loop2'] },
        { intro = gVideos['vid3'], loop = gVideos['loop3'] },
        { intro = gVideos['vid4'], loop = gVideos['loop4'] },
        { intro = gVideos['vid5'], loop = gVideos['loop5'] },
        { intro = gVideos['vid6'], loop = gVideos['loop6'] }, 
    }
    self.dialogueIndex = 1
    self.showDialogue = false
    self.currentPortrait = nil
    self.currentIndex = 1
    self.state = "intro" 
    self.sequence[self.currentIndex].intro:play()

    self.flag = false
end

function VideoState:update(dt)
     local current = self.sequence[self.currentIndex]
     local loop = current.loop

    if self.state == "intro" then
        if not current.intro:isPlaying() then
            self.state = "loop"
            current.loop:play()
        end
    elseif self.state == "loop" then
        if not current.loop:isPlaying() then
            current.loop:rewind()
            current.loop:play()
        end

        if current.dialogue then
            self.showDialogue = true
            if not self.flag then
                self.flag = true
                self.currentPortrait = current.portraitStart
            end

            if love.keyboard.wasPressed("return") then
                self.dialogueIndex = self.dialogueIndex + 1

                if self.dialogueIndex == #current.dialogue then
                    self.currentPortrait = current.portraitEnd
                end

                if self.dialogueIndex > #current.dialogue then
                    self.showDialogue = false
                    self.dialogueIndex = 1
                    loop:pause()
                    --loop:rewind()
                    self.currentIndex = self.currentIndex + 1

                    if self.currentIndex <= #self.sequence then
                        self.state = "intro"
                        self.sequence[self.currentIndex].intro:play()
                    else
                        self.state = "done"
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
        local texW, texH = tex:getWidth(), tex:getHeight()
        local portraitScale = scale  
        love.graphics.draw(tex, offsetX, offsetY, 0, portraitScale, portraitScale)

        local current = self.sequence[self.currentIndex]
        local line = current.dialogue[self.dialogueIndex]
        if line then
            local textX = offsetX + 40 * scale
            local textY = offsetY + videoH * scale - 120 * scale
            local textWidth = videoW * scale - 80 * scale
            love.graphics.setFont(gFonts['dogicapixelBig'])
            love.graphics.setColor(0, 0, 0)
            love.graphics.printf(line, textX, textY, textWidth, "left")
            love.graphics.setColor(1, 1, 1)
        end
    end
end