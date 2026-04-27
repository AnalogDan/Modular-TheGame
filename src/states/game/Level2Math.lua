Level2Math = Class{__includes = BaseState}

function Level2Math:init()
    self.currentLevel = 'level2' -- Used for spawning after death
    self.nextLevel = 'level2Math'
    self.nextTransition = {state = 'transition', params = {transNumber = 6, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 6

    Level2MathMap.generate(self)
    SystemDialogue.init(self, Level2MathDialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 70, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    self.enemies = {
    }
    self.items = {
        Item(128, 80, self.player, "arquimedes"),
        Item(0, 64, self.player, "entrance"),
    }
end

function Level2Math:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level2Math:handleTrigger()
    -- if love.keyboard.wasPressed('o') then
    --     SystemDialogue.startSequence(self, "sequence")
    -- end
    if self.player.touchedTrigger and not self.triggerRemoved then
        self.triggerRemoved = true

        for y, row in pairs(self.tileMap) do
            for x, tile in pairs(row) do
                if tile.type == "trigger" then
                    tile.type = "empty"
                    tile.texture = nil
                end
            end
        end

        SystemDialogue.startSequence(self, "sequence")
    end
end

function Level2Math:canPause()
    return true
end

function Level2Math:update(dt)
    self.player:update(dt)
    for _, enemy in ipairs(self.enemies) do
        enemy:update(dt)
    end
    for _, item in ipairs(self.items) do
        item:update(dt)
        
    end
    for i = #self.items, 1, -1 do
        if self.items[i].removed then
            table.remove(self.items, i)
        end
    end
    Level2MathMap.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level2Math:render()
    Level2MathMap.renderBeforeCamera(self)
    self.camera:apply()
    Level2MathMap.render(self)

    self.player:render()

    Level2MathMap.renderAfterPlayer(self)

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    SystemLeaves.render(self)
    self.camera:clear()

    SystemDialogue.render(self)
    SystemTransition.render()
end

