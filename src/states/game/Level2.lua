Level2 = Class{__includes = BaseState}

function Level2:init()
    self.currentLevel = 'level2'
    self.nextLevel = 'level2Math'
    self.nextTransition = nil
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = false
    self.nextChapterNumber = nil

    Level2Map.generate(self)
    SystemDialogue.init(self, Level2Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 126, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber)
    self.enemies = {
        Enemy(24, 8, self.player, "vertical"),
        --2
        Enemy(84, 36, self.player, "horizontal"),
        --3
        Enemy(118, 54, self.player, "still"),
        Enemy(118, 66, self.player, "still"),
        Enemy(118, 78, self.player, "still"),
        --4
        Enemy(154, 84, self.player, "still"),
        Enemy(166, 84, self.player, "still"),
        --5
        Enemy(118, 120, self.player, "still"),
        Enemy(130, 120, self.player, "still"),
        --6
        Enemy(214, 56, self.player, "vertical"),
        --7
        Enemy(150, 46, self.player, "still"),  
        --8
        Enemy(190, 7, self.player, "horizontal"),
    }
    self.items = {
        Item(0, 120, self.player, "entrance"),
        Item(121, 105, self.player, "apple"),
        -- Item(40, 105, self.player, "apple"),
        Item(248, 24, self.player, "door"),
    }
end

function Level2:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level2:handleTrigger()
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

function Level2:canPause()
    return true
end

function Level2:update(dt)
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
    Level2Map.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level2:render()
    self.camera:apply()
    Level2Map.render(self)

    self.player:render()

    Level2Map.renderAfterPlayer(self)

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

