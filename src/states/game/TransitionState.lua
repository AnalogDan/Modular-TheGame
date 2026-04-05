TransitionState = Class{__includes = BaseState}

function TransitionState:init()
    SystemTransition.start('uncover', function() end)
    self.items = {
        Item(33, 44, self.player, "apple"), -- Y apple
        Item(73, 47, self.player, "apple"),-- 1/apple
    }

    self.blinkCount = 0
    self.blinkTimer = 0
    self.blinkInterval = 0.2  -- speed of blinking
    self.totalBlinks = 3
    self.showDot = false

    self.afterBlinkDelay = 2.7 -- Time after blinking 'totalBlinks' times
    self.afterBlinkTimer = 0
    self.finishedBlinking = false
end

function TransitionState:enter(params)
    self.transNumber = params.transNumber
    self.nextLevel = params.nextLevel    
end

function TransitionState:afterBlinkFinished()
    if self.done then return end
    self.done = true

    SystemTransition.start('cover', function() gStateMachine:change(self.nextLevel) end)
end

function TransitionState:update(dt)
    for _, item in ipairs(self.items) do
        item:update(dt)
    end
    SystemTransition.update(dt)

    if SystemTransition.active then
        return
    end

    -- BLINK LOGIC
    if not self.finishedBlinking then
        self.blinkTimer = self.blinkTimer + dt

        if self.blinkTimer >= self.blinkInterval then
            self.blinkTimer = 0
            self.showDot = not self.showDot
            if self.showDot then
                self.blinkCount = self.blinkCount + 1
                gSounds['grab']:stop()
                gSounds['grab']:play()
                if self.blinkCount >= self.totalBlinks then
                    self.finishedBlinking = true
                    self.showDot = true
                end
            end
        end
    end
    if self.finishedBlinking then
        self.afterBlinkTimer = self.afterBlinkTimer + dt

        if self.afterBlinkTimer >= self.afterBlinkDelay then
            self:afterBlinkFinished()
        end
    end
end

function TransitionState:render()
    love.graphics.draw(gTextures['trans' .. self.transNumber], 0, 0)

    if self.showDot then
        love.graphics.draw(gTextures['dot' .. self.transNumber], 0, 0)
    end

    for _, items in ipairs(self.items) do
        items:render()
    end
    SystemTransition.render()
end

