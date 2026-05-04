Level9 = Class{__includes = BaseState}

function Level9:init()
    self.currentLevel = 'level9' --Used for spawning after death
    self.nextLevel = 'level10'
    self.nextTransition = {state = 'transition', params = {transNumber = 10, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 10

    Level9Map.generate(self)
    SystemDialogue.init(self, Level9Dialogue.get())
    self.fog = SystemFog(self.totalMapWidth * 8)
    SystemTransition.start('uncover', function() end)

    local playerY = 11
    self.player = Player(-20, ((playerY-1)*8)-2, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    
    --Enemies
    local yH1 = 1
    local xH1= 1

    --Enemies
    local yS1 = 8
    local xS1= 15
    local yS2 = 8
    local xS2 = 16
    local yS3 = 8
    local xS3 = 17
    local yS4 = 8
    local xS4 = 18
    local yS5 = 12
    local xS5 = 13
    local yS6 = 12
    local xS6 = 14
    local yS7 = 12
    local xS7 = 15
    local yS8 = 12
    local xS8 = 16
    local yS9 = 15
    local xS9 = 20
    local yS10 = 15
    local xS10 = 30
    local yS11 = 15
    local xS11 = 31
    local yS12 = 15
    local xS12 = 32
    local yS13 = 15
    local xS13 = 33
    local yS14 = 15
    local xS14 = 34

    local yV15 = 13 
    local xV15 = 48
    local yV16 = 9
    local xV16 = 52
    local yV17 = 8
    local xV17 = 68

    local yS18 = 7
    local xS18 = 56
    local yS19 = 7
    local xS19 = 57
    local yS20 = 7
    local xS20 = 58
    local yS21 = 7
    local xS21 = 59
    local yS22 = 7
    local xS22 = 60
    local yS23 = 7
    local xS23 = 61
    local yS24 = 2
    local xS24 = 67
    local yS25 = 2
    local xS25 = 68
    local yS26 = 2
    local xS26 = 69
    local yS27 = 2
    local xS27 = 70
    local yS28 = 2
    local xS28 = 71

    local yS29 = 11
    local xS29 = 56
    local yS30 = 11
    local xS30 = 57
    local yS31 = 11
    local xS31 = 58
    local yS32 = 11
    local xS32 = 59
    local yS33 = 11
    local xS33 = 60
    local yS34 = 11
    local xS34 = 61

    self.enemies = {
        --Enemy( ((xH1-4)*8)-4 , ((yH1-1)*8)-4, self.player, "horizontal"),
        Enemy(((xS1-1)*8)-4, ((yS1-1)*8)-2, self.player, "still"),
        Enemy(((xS2-1)*8)-4, ((yS2-1)*8)-2, self.player, "still"),
        Enemy(((xS3-1)*8)-4, ((yS3-1)*8)-2, self.player, "still"),
        Enemy(((xS4-1)*8)-4, ((yS4-1)*8)-2, self.player, "still"),
        Enemy(((xS5-1)*8)-4, ((yS5-1)*8)-1, self.player, "still"),
        Enemy(((xS6-1)*8)-4, ((yS6-1)*8)-4, self.player, "still"),
        Enemy(((xS7-1)*8)-4, ((yS7-1)*8)-4, self.player, "still"),
        Enemy(((xS8-1)*8)-4, ((yS8-1)*8)-4, self.player, "still"),
        Enemy(((xS9-1)*8)-4, ((yS9-1)*8)-6, self.player, "still"),
        Enemy(((xS10-1)*8)-4, ((yS10-1)*8)-4, self.player, "still"),
        Enemy(((xS11-1)*8)-4, ((yS11-1)*8)-4, self.player, "still"),
        Enemy(((xS12-1)*8)-4, ((yS12-1)*8)-4, self.player, "still"),
        Enemy(((xS13-1)*8)-4, ((yS13-1)*8)-4, self.player, "still"),
        Enemy(((xS14-1)*8)-4, ((yS14-1)*8)-4, self.player, "still"),

        Enemy(((xV15-1)*8)-4, ((yV15-4)*8)-4, self.player, "vertical"),
        Enemy(((xV16-1)*8)-4, ((yV16-4)*8)-4, self.player, "vertical"),
        Enemy(((xV17-1)*8)-4, ((yV17-4)*8)-4, self.player, "vertical"),

        --Enemy(((xS18-1)*8)-4, ((yS18-1)*8)-4, self.player, "still"),
        Enemy(((xS19-1)*8)-4, ((yS19-1)*8)-4, self.player, "still"),
        Enemy(((xS20-1)*8)-4, ((yS20-1)*8)-4, self.player, "still"),
        Enemy(((xS21-1)*8)-4, ((yS21-1)*8)-4, self.player, "still"),
        Enemy(((xS22-1)*8)-4, ((yS22-1)*8)-4, self.player, "still"),
        Enemy(((xS23-1)*8)-4, ((yS23-1)*8)-4, self.player, "still"),
        Enemy(((xS24-1)*8)-4, ((yS24-1)*8)-4, self.player, "still"),
        Enemy(((xS25-1)*8)-4, ((yS25-1)*8)-4, self.player, "still"),
        Enemy(((xS26-1)*8)-4, ((yS26-1)*8)-4, self.player, "still"),
        Enemy(((xS27-1)*8)-4, ((yS27-1)*8)-4, self.player, "still"),
        --Enemy(((xS28-1)*8)-4, ((yS28-1)*8)-4, self.player, "still"),

        Enemy(((xS29-1)*8)-0, ((yS29-1)*8)-0, self.player, "still"),
        Enemy(((xS30-1)*8)-0, ((yS30-1)*8)-0, self.player, "still"),
        Enemy(((xS31-1)*8)-0, ((yS31-1)*8)-0, self.player, "still"),
        Enemy(((xS32-1)*8)-0, ((yS32-1)*8)-0, self.player, "still"),
        Enemy(((xS33-1)*8)-0, ((yS33-1)*8)-0, self.player, "still"),
        Enemy(((xS34-1)*8)-0, ((yS34-1)*8)-0, self.player, "still"),
    }

    --Items 
    local npcY = 14
    local npcX = 100
    local entranceY = 10
    local entranceX = 1
    local doorY = 13
    local doorX = 92
    local appleY = 2
    local appleX = 63
    self.items = {
        Item( (npcX-1)*8 , (npcY-1)*8, self.player, "turing"),
        Item( (entranceX-1)*8, (entranceY-1)*8, self.player, "entrance"),
        Item( (doorX-1)*8, (doorY-1)*8, self.player, "door"),
        Item( ((appleX-1)*8)+1 , ((appleY-1)*8)+1, self.player, "apple"),
    }
end

function Level9:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level9:handleTrigger()
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

function Level9:canPause()
    return true
end

function Level9:update(dt)
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
    Level9Map.update(self, dt)
    self:handleTrigger()
    self.fog:update(dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level9:render()
    Level9Map.renderBeforeCamera(self)
    self.camera:apply()
    Level9Map.render(self)

    self.player:render()

    Level9Map.renderAfterPlayer(self)

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    self.fog:render()
    self.camera:clear()

    SystemDialogue.render(self)
    SystemTransition.render()
end

