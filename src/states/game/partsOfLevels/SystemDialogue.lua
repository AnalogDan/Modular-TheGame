SystemDialogue = {}

function SystemDialogue.init(self, sequences)

    --sequence shit
    self.sequences = sequences
    self.activeSequence = nil
    self.sequenceIndex = 1
    self.showDialogue = false
    self.currentText = nil
    self.currentPortrait = nil
    self.currentBlip = nil
    self.textTimer = 0
    self.visibleChars = 0
    self.textSpeed = 0.03
    self.blipTimer = 0
    self.pendingPlayerHit = false
    --text processor shit
    self.isAnswering = false
    self.playerInput = ""
    self.cursorTimer = 0
    self.cursorVisible = true
    self.cursorBlinkSpeed = 0.5
    self.backspaceTimer = 0
    self.backspaceDelay = 0.3
    self.backspaceRepeat = 0.05
    self.backspaceHeld = false
end

--Helper functions for dialogue
local function trim(s)
    return s:match("^%s*(.-)%s*$")
end
function SystemDialogue.startSequence(self, name)
    local sequence = self.sequences[name]
    if not sequence then return end
    self.activeSequence = sequence
    self.sequenceIndex = 1
    self.showDialogue = true
    SystemDialogue.loadCurrentLine(self)
    self.player.canControl = false
end
function SystemDialogue.loadCurrentLine(self)
    local entry = self.activeSequence[self.sequenceIndex]

    self.currentText = entry.text
    self.currentPortrait = entry.portrait
    self.currentBlip = entry.blip

    self.textTimer = 0
    self.visibleChars = 0

    self.isAnswering = false
end
function SystemDialogue.textinput(self, text)
    self.cursorVisible = true
    self.cursorTimer = 0
    if self.isAnswering then
        if utf8.len(self.playerInput) < 30 then
            self.playerInput = self.playerInput .. text
        end
    end
end

function SystemDialogue.update(self, dt)
    self.blipTimer = math.max(0, self.blipTimer - dt)

    --Handle questions input. (Make sure this section and the 'show dialogue' one are at the end of update)
    if self.isAnswering then
        self.cursorTimer = self.cursorTimer + dt
        if self.cursorTimer >= self.cursorBlinkSpeed then
            self.cursorTimer = 0
            self.cursorVisible = not self.cursorVisible
        end

        if love.keyboard.wasPressed("backspace") then --holy shit, this is a lot of code to handle backspace deleting
            self.backspaceHeld = true
            self.backspaceTimer = 0
            local byteoffset = utf8.offset(self.playerInput, -1)
            if byteoffset then
                self.playerInput = string.sub(self.playerInput, 1, byteoffset - 1)
            end
        end
        if not love.keyboard.isDown("backspace") then
            self.backspaceHeld = false
        end
        if self.backspaceHeld then
            self.backspaceTimer = self.backspaceTimer + dt

            if self.backspaceTimer >= self.backspaceDelay then
                self.backspaceTimer = self.backspaceTimer - self.backspaceRepeat

                local byteoffset = utf8.offset(self.playerInput, -1)
                if byteoffset then
                    self.playerInput = string.sub(self.playerInput, 1, byteoffset - 1)
                end
            end
        end

        if love.keyboard.wasPressed('return') and trim(self.playerInput) ~= "" then
            local entry = self.activeSequence[self.sequenceIndex]
            --If correct answer, else incorrect answer
            if trim(self.playerInput) == trim(entry.answer) then
                SystemDialogue.startSequence(self, entry.successSequence)
            else
                self.showDialogue = false
                self.activeSequence = nil
                self.player.canControl = true
                self.isAnswering = false
                self.pendingPlayerHit = true
            end
        end
        return
    end
    if self.pendingPlayerHit then
        --self.player:gotHit()
        self.player.stateMachine:change('dead', 'electricGround')
        self.pendingPlayerHit = false
    end
    --Show dialogue
    if self.showDialogue and self.currentText then
        if self.visibleChars < #self.currentText then
            self.textTimer = self.textTimer + dt
            if self.textTimer >= self.textSpeed then
                self.textTimer = self.textTimer - self.textSpeed
                self.visibleChars = self.visibleChars + 1

                if self.currentBlip and self.blipTimer <= 0 then -- play blip
                    local pitch = 0.9 + math.random() * 0.2
                    Sound.playSFX(self.currentBlip, {
                        pitch = pitch,
                        volume = 1
                    })
                    local sound = gSounds[self.currentBlip]
                    if type(sound) == "table" then
                        sound = sound[1]
                    end
                    self.blipTimer = sound:getDuration() / pitch
                end

            end
        end

        local entry = self.activeSequence[self.sequenceIndex]
        if love.keyboard.wasPressed("return") then
            if self.visibleChars < #self.currentText then
                self.visibleChars = #self.currentText
            elseif entry.type == "question" then
                self.isAnswering = true
                self.playerInput = ""
            else
                self.sequenceIndex = self.sequenceIndex + 1

                if self.sequenceIndex > #self.activeSequence then
                    self.showDialogue = false
                    self.activeSequence = nil
                    self.player.canControl = true
                else
                    SystemDialogue.loadCurrentLine(self)
                end
            end
        end
    end
end

function SystemDialogue.render(self)
    --Draw questions input
    if self.isAnswering then
        love.graphics.setColor(0, 0, 0, 0.6)
        love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

        local font = love.graphics.getFont()

        local textWidth = font:getWidth(self.playerInput)
        local centerX = VIRTUAL_WIDTH / 2
        local x = centerX - (textWidth / 2)

        love.graphics.setColor(1, 1, 1)
        love.graphics.print(self.playerInput, x, 80)

        if self.cursorVisible then
            local cursorX = x + textWidth
            love.graphics.print("_", cursorX, 80)
        end
    end

    --draw dialogue
    love.graphics.setFont(gFonts['dogicapixel'])
    gFonts['dogicapixel']:setLineHeight(1.5)
    if self.showDialogue and self.currentPortrait then
        love.graphics.draw(self.currentPortrait, 1, 1)
        local shownText = utf8_sub(self.currentText, 1, self.visibleChars)
        love.graphics.setColor(0, 0, 0)
        love.graphics.printf(
            shownText,
            75,
            19,
            153,
            "left"
        )
        love.graphics.setColor(1, 1, 1)
    end
end