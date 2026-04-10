Level1 = Class{__includes = BaseState}

function Level1:init()
    self.currentLevel = 'level1'
    self.nextLevel = 'level2'
    self.nextTransition = {state = 'transition', params = {transNumber = 1, nextLevel = self.nextLevel}}
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 2

    Level1Map.generate(self)
    SystemDialogue.init(self, Level1Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 94, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber)
    self.enemies = {
        -- Enemy(100, 80, self.player, "horizontal"),
        -- Enemy(120, 80, self.player, "vertical"),
        -- Enemy(190, 80, self.player, "still")
    }
    self.items = {
        Item(0, 88, self.player, "entrance"),
    }
end

function Level1:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level1:handleTrigger()
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

function Level1:canPause()
    return true
end

function Level1:update(dt)

    SystemTransition.update(dt)

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
    Level1Map.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemDialogue.update(self, dt)
end

function Level1:render()
    self.camera:apply()
    Level1Map.render(self)

    self.player:render()

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    Level1Map.renderAfterPlayer(self)

    SystemLeaves.render(self)
    self.camera:clear()

    SystemDialogue.render(self)
    SystemTransition.render()
end

