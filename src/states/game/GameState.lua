GameState = Class{__includes = BaseState}

function GameState:init()
    self.currentLevel = 'game'
    self.nextLevel = 'game'
    self.nextTransition = nil
    self.triggerRemoved = false

    Level0Map.generate(self)
    SystemDialogue.init(self, Level4Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 78, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, 'right')
    self.enemies = {
        -- Enemy(100, 80, self.player, "horizontal"),
        -- Enemy(120, 80, self.player, "vertical"),
        Enemy(190, 80, self.player, "still")
    }
    self.items = {
        -- Item(144, 80, self.player, "tales"),
    }
end

function GameState:textinput(text)
    SystemDialogue.textinput(self, text)
end

function GameState:handleTrigger()
    if love.keyboard.wasPressed('o') then

        SystemDialogue.startSequence(self, "sequence")
    end
end

function GameState:canPause()
    return true
end

function GameState:update(dt)
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
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function GameState:render()
    self.camera:apply()
    Level0Map.render(self)

    self.player:render()

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    Level0Map.renderAfterPlayer(self)

    SystemLeaves.render(self)
    self.camera:clear()

    SystemDialogue.render(self)
    SystemTransition.render()
end

