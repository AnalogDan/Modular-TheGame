LevelTemplate = Class{__includes = BaseState}

function LevelTemplate:init()
    self.currentLevel = 'level1'
    self.nextLevel = 'level1'
    self.triggerRemoved = false

    Level0Map.generate(self)
    SystemDialogue.init(self, Level1Dialogue.get())
    SystemLeaves.init(self)

    self.player = Player(-20, 78, self.tileMap)
    self.enemies = {
        -- Enemy(100, 80, self.player, "horizontal"),
        -- Enemy(120, 80, self.player, "vertical"),
        -- Enemy(190, 80, self.player, "still")
    }
    self.items = {
        -- Item(144, 80, self.player, "tales"),
    }
end

function LevelTemplate:textinput(text)
    SystemDialogue.textinput(self, text)
end

function LevelTemplate:handleTrigger()
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

function LevelTemplate:update(dt)
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
    Level0Map.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemDialogue.update(self, dt)
end

function LevelTemplate:render()
    self.camera:apply()
    Level0Map.render(self)

    self.player:render()

    Level0Map.renderAfterPlayer(self)

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    SystemLeaves.render(self)
    self.camera:clear()

    SystemDialogue.render(self)
end

