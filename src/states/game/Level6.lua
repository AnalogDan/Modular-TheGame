Level6 = Class{__includes = BaseState}

function Level6:init()
    self.currentLevel = 'level6' --Used for spawning after death
    self.nextLevel = 'level6'
    self.nextTransition = {state = 'transition', params = {transNumber = 7, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 7

    Level6Map.generate(self)
    SystemDialogue.init(self, Level6Dialogue.get())
    SystemSand.init(self)
    SystemTransition.start('uncover', function() end)

    local playerY = 6
    self.player = Player(-20, ((playerY-1)*8)-2 , self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')

    --Enemies
    local xH1 = 15
    local yH1= 17
    local xV2= 18
    local yV2= 2
    local xV3 = 19
    local yV3= 2
    local xV4 = 20
    local yV4= 2
    local xV5 = 24 --actual 5
    local yV5= 7
    local xV6 = 31 
    local yV6= 12
    local xV7 = 46
    local yV7= 15
    local xV8 = 48
    local yV8= 15
    local xH9 = 40
    local yH9= 13
    self.enemies = {
        Enemy( ((xH1-4)*8)-4 , ((yH1-1)*8)-4, self.player, "horizontal"),
        Enemy( ((xH9-4)*8)-4 , ((yH9-1)*8)-4, self.player, "horizontal"),

        Enemy(((xV2-1)*8)-4, ((yV2-4)*8)-4, self.player, "vertical"),
        Enemy(((xV3-1)*8)-4, ((yV3-4)*8)-4, self.player, "vertical"),
        Enemy(((xV4-1)*8)-4, ((yV4-4)*8)-4, self.player, "vertical"),
        Enemy(((xV5-1)*8)-4, ((yV5-4)*8)-4, self.player, "vertical"),
        Enemy(((xV6-1)*8)-4, ((yV6-4)*8)-4, self.player, "vertical"),
        Enemy(((xV7-1)*8)-4, ((yV7-4)*8)-4, self.player, "vertical"),
        Enemy(((xV8-1)*8)-4, ((yV8-4)*8)-4, self.player, "vertical"),
    }

    --items
    local npcY = 9
    local npcX = 75
    local entranceY = 5
    local entranceX = 1
    local doorY = 8
    local doorX = 64
    local appleY = 17
    local appleX = 46
    self.items = {
        Item( (npcX-1)*8 , (npcY-1)*8, self.player, "juarismi"),
        Item( (entranceX-1)*8, (entranceY-1)*8, self.player, "entrance"),
        Item( (doorX-1)*8, (doorY-1)*8, self.player, "door"),
        Item( ((appleX-1)*8)+1 , ((appleY-1)*8)+1, self.player, "apple"),
    }
end

function Level6:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level6:handleTrigger()
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

function Level6:canPause()
    return true
end

function Level6:update(dt)
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
    Level6Map.update(self, dt)
    self:handleTrigger()
    SystemSand.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level6:render()
    Level6Map.renderBeforeCamera(self)
    self.camera:apply()
    Level6Map.render(self)

    self.player:render()

    Level6Map.renderAfterPlayer(self)

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    if self.player.showmanshipFlag then 
        
    end

    SystemSand.render(self)
    self.camera:clear()

    SystemDialogue.render(self)
    SystemTransition.render()
end

