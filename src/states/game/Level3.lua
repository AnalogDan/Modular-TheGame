Level3 = Class{__includes = BaseState}

function Level3:init()
    self.currentLevel = 'level3'
    self.nextLevel = 'level4'
    self.nextTransition = {state = 'transition', params = {transNumber = 3, nextLevel = self.nextLevel}}
    self.triggerRemoved = false

    Level3Map.generate(self)
    SystemDialogue.init(self, Level3Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(20, -40, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, 'down')
    self.enemies = {
        --Enemy(24, 8, self.player, "vertical"),
    }
    self.items = {
        Item(16, -1, self.player, "entrance"),
        Item(24, -5, self.player, "entrance"),
        Item(32, 0, self.player, "entrance"),
        Item(40, -7, self.player, "entrance"),
        Item(240, 104, self.player, "door"),
        Item(152, 88, self.player, "apple"),
    }
end

function Level3:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level3:handleTrigger()
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

        SystemDialogue.startSequence(self, "intro")
    end
end

function Level3:update(dt)
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
    Level3Map.update(self, dt)
    self:handleTrigger()
    SystemLeaves.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level3:render()
    self.camera:apply()
    Level3Map.render(self)

    self.player:render()

    Level3Map.renderAfterPlayer(self)

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    SystemLeaves.render(self)
    self.camera:clear()

    SystemTransition.render()
    SystemDialogue.render(self)
end

