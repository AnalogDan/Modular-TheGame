GameState = Class{__includes = BaseState}

function GameState:init()
    self.currentLevel = 'level3'
    self.nextLevel = 'level1'
    self.triggerRemoved = false

    Level0Map.generate(self)

    self.player = Player(-20, 78, self.tileMap)
    self.enemies = {
        -- Enemy(100, 80, self.player, "horizontal"),
        -- Enemy(120, 80, self.player, "vertical"),
        Enemy(190, 80, self.player, "still")
    }
    self.items = {
        -- Item(144, 80, self.player, "tales"),
    }
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
    self.camera:clear()
end

