Level4Real = Class{__includes = BaseState}

function Level4Real:init()
    self.currentLevel = 'level4Real'
    self.nextLevel = 'level4Real'
    self.nextTransition = {state = 'transition', params = {transNumber = 5, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false
    self.triggerRemoved2 = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 5

    Level4RealMap.generate(self)
    SystemDialogue.init(self, Level4RealDialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 14, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    self.enemies = {

    }
    self.items = {
        Item(432, 80, self.player, "tales"),
        Item(0, 8, self.player, "entrance"),
        Item(328, 48, self.player, "door"),
        Item(265, 25, self.player, "apple"),
    }
end

function Level4Real:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level4Real:handleTrigger()
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

    if self.player.touchedTrigger2 and not self.triggerRemoved2 then
        self.triggerRemoved2 = true
        for y, row in pairs(self.tileMap) do
            for x, tile in pairs(row) do
                if tile.type == "trigger2" then
                    tile.type = "empty"
                    tile.texture = nil
                end
            end
        end
        SystemDialogue.startSequence(self, "sequence2")
    end
end

function Level4Real:canPause()
    return true
end

function Level4Real:update(dt)
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
    Level4RealMap.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level4Real:render()
    Level4RealMap.renderBeforeCamera(self)
    self.camera:apply()
    Level4RealMap.render(self)

    self.player:render()

    Level4RealMap.renderAfterPlayer(self)

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

