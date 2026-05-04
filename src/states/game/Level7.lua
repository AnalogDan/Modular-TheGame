Level7 = Class{__includes = BaseState}

function Level7:init()
    self.currentLevel = 'level7' --Used for spawning after death
    self.nextLevel = 'level8'
    self.nextTransition = {state = 'transition', params = {transNumber = 8, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 8

    Level7Map.generate(self)
    SystemDialogue.init(self, Level7Dialogue.get())
    SystemSand.init(self)
    SystemTransition.start('uncover', function() end)

    local playerY = 3
    self.player = Player(-25, ((playerY-1)*8)-2, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    
    --Enemies
    local yH1 = 1
    local xH1= 1

    local yV1 = 12
    local xV1 = 7
    local yV2 = 6
    local xV2 = 15
    local yV3 = 11
    local xV3 = 13
    local yV4 = 14
    local xV4 = 19
    local yV5 = 4
    local xV5 = 24
    local yV6 = 4
    local xV6 = 34

    local yH7 = 6
    local xH7 = 27
    local yH8 = 6
    local xH8 = 31
    local yH9 = 16
    local xH9 = 33

    local yS1 = 1
    local xS1= 1
    self.enemies = {
        Enemy(((xV1-1)*8)-4, ((yV1-4)*8)-4, self.player, "vertical"),
        Enemy(((xV2-1)*8)-4, ((yV2-4)*8)-4, self.player, "vertical"),
        Enemy(((xV3-1)*8)-4, ((yV3-4)*8)-4, self.player, "vertical"),
        Enemy(((xV4-1)*8)-4, ((yV4-4)*8)-4, self.player, "vertical"),
        Enemy(((xV5-1)*8)-4, ((yV5-4)*8)-4, self.player, "vertical"),
        Enemy(((xV6-1)*8)-4, ((yV6-4)*8)-4, self.player, "vertical"),

        Enemy( ((xH7-4)*8)-4 , ((yH7-1)*8)-4, self.player, "horizontal"),
        Enemy( ((xH8-4)*8)-4 , ((yH8-1)*8)-4, self.player, "horizontal"),
        Enemy( ((xH9-4)*8)-4 , ((yH9-1)*8)-4, self.player, "horizontal"),
    }

    --Items 
    local npcY = 13
    local npcX = 57
    local entranceY = 2
    local entranceX = 1
    local doorY = 3
    local doorX = 40
    local appleY = 13
    local appleX = 25
    self.items = {
        Item( (npcX-1)*8 , (npcY-1)*8, self.player, "fibonacci"),
        Item( (entranceX-1)*8, (entranceY-1)*8, self.player, "entrance"),
        Item( (doorX-1)*8, (doorY-1)*8, self.player, "door"),
        Item( ((appleX-1)*8)+1 , ((appleY-1)*8)+1, self.player, "apple"),
    }
end

function Level7:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level7:handleTrigger()
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

function Level7:canPause()
    return true
end

function Level7:update(dt)
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
    Level7Map.update(self, dt)
    self:handleTrigger()
    SystemSand.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level7:render()
    Level7Map.renderBeforeCamera(self)
    self.camera:apply()
    Level7Map.render(self)

    self.player:render()

    Level7Map.renderAfterPlayer(self)

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    SystemSand.render(self)
    self.camera:clear()

    SystemDialogue.render(self)
    SystemTransition.render()
end

