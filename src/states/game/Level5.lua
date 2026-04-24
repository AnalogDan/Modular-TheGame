Level5 = Class{__includes = BaseState}

function Level5:init()
    self.currentLevel = 'level5'
    self.nextLevel = 'level4_0'
    self.nextTransition = {state = 'transition', params = {transNumber = 2, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 2

    Level5Map.generate(self)
    SystemDialogue.init(self, Level5Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 70, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    self.enemies = {
        -- Enemy(100, 80, self.player, "horizontal"),
        -- Enemy(120, 80, self.player, "vertical"),
        -- Enemy(190, 80, self.player, "still")
    }
    self.items = {
        Item(0, 64, self.player, "entrance"),
        Item(728, 96, self.player, "door"),
        Item(593, 17, self.player, "apple"),
    }
end

function Level5:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level5:handleTrigger()
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

function Level5:canPause()
    return true
end

function Level5:update(dt)
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
    Level5Map.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level5:render()
    Level5Map.renderBeforeCamera(self)
    self.camera:apply()
    Level5Map.render(self)

    self.player:render()

    Level5Map.renderAfterPlayer(self)

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

