Level4_0 = Class{__includes = BaseState}

function Level4_0:init()
    self.currentLevel = 'level4_0'
    self.nextLevel = 'level4'
    self.nextTransition = nil -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = false
    self.nextChapterNumber = nil

    Level4_0Map.generate(self)
    SystemDialogue.init(self, Level1Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 30, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    self.enemies = {
        -- Enemy(100, 80, self.player, "horizontal"),
        -- Enemy(120, 80, self.player, "vertical"),
        -- Enemy(190, 80, self.player, "still")
    }
    self.items = {
        Item(0, 24, self.player, "entrance"),
        Item(504, 56, self.player, "door"),
        Item(337, 113, self.player, "apple"),
    }
end

function Level4_0:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level4_0:handleTrigger()
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

function Level4_0:canPause()
    return true
end

function Level4_0:update(dt)
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
    Level4_0Map.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level4_0:render()
    Level4_0Map.renderBeforeCamera(self)
    self.camera:apply()
    Level4_0Map.render(self)

    self.player:render()

    Level4_0Map.renderAfterPlayer(self)

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

