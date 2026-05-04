Level8 = Class{__includes = BaseState}

function Level8:init()
    self.currentLevel = 'level8' --Used for spawning after death
    self.nextLevel = 'level9'
    self.nextTransition = {state = 'transition', params = {transNumber = 9, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = true
    self.nextChapterNumber = 9

    Level8Map.generate(self)
    SystemDialogue.init(self, Level8Dialogue.get())
    self.fog = SystemFog(self.totalMapWidth * 8)
    SystemTransition.start('uncover', function() end)

    local playerY = 3
    self.player = Player(-25, ((playerY-1)*8)-2, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    
    --Enemies
    local yS1 = 4
    local xS1= 46
    local yS2 = 4
    local xS2 = 47
    local yS3 = 5
    local xS3 = 48
    local yS4 = 6
    local xS4 = 49
    local yS5 = 8
    local xS5 = 48
    local yS6 = 9
    local xS6 = 48
    local yS7 = 10
    local xS7 = 47
    local yS8 = 11
    local xS8 = 47
    local yS9 = 12
    local xS9 = 47
    local yS10 = 12
    local xS10 = 47
    local yS11 = 14
    local xS11 = 48
    local yS12 = 16
    local xS12 = 49
    local yS13 = 17
    local xS13 = 51
    local yS14 = 1
    local xS14 = 51
    local yS15 = 1
    local xS15 = 52
    local yS16 = 2
    local xS16 = 53
    local yS17 = 5
    local xS17 = 53
    local yS18 = 6
    local xS18 = 53
    local yS19 = 8
    local xS19 = 53
    local yS20 = 9
    local xS20 = 53
    local yS21 = 10
    local xS21 = 52
    local yS22 = 11
    local xS22 = 52
    local yS23 = 12
    local xS23 = 52
    local yS24 = 13
    local xS24 = 53

    local yH25 = 4
    local xH25= 58
    local yH26 = 8
    local xH26= 61
    local yV27 = 8
    local xV27= 59
    

    self.enemies = {
        --Enemy( ((xH1-4)*8)-4 , ((yH1-1)*8)-4, self.player, "horizontal"),
        --Enemy(((xV1-1)*8)-4, ((yV1-4)*8)-4, self.player, "vertical"),
        
        Enemy(((xS1-1)*8)-4, ((yS1-1)*8)-4, self.player, "still"),
        Enemy(((xS2-1)*8)-4, ((yS2-1)*8)-4, self.player, "still"),
        Enemy(((xS3-1)*8)-4, ((yS3-1)*8)-4, self.player, "still"),
        Enemy(((xS4-1)*8)-4, ((yS4-1)*8)-4, self.player, "still"),
        Enemy(((xS5-1)*8)-4, ((yS5-1)*8)-4, self.player, "still"),
        Enemy(((xS6-1)*8)-4, ((yS6-1)*8)-4, self.player, "still"),
        Enemy(((xS7-1)*8)-4, ((yS7-1)*8)-4, self.player, "still"),
        Enemy(((xS8-1)*8)-4, ((yS8-1)*8)-4, self.player, "still"),
        Enemy(((xS9-1)*8)-4, ((yS9-1)*8)-4, self.player, "still"),
        Enemy(((xS10-1)*8)-4, ((yS10-1)*8)-4, self.player, "still"),
        Enemy(((xS11-1)*8)-4, ((yS11-1)*8)-4, self.player, "still"),
        Enemy(((xS12-1)*8)-4, ((yS12-1)*8)-4, self.player, "still"),
        Enemy(((xS13-1)*8)-4, ((yS13-1)*8)-4, self.player, "still"),
        Enemy(((xS14-1)*8)-4, ((yS14-1)*8)-4, self.player, "still"),
        Enemy(((xS15-1)*8)-4, ((yS15-1)*8)-4, self.player, "still"),
        Enemy(((xS16-1)*8)-4, ((yS16-1)*8)-4, self.player, "still"),
        Enemy(((xS17-1)*8)-4, ((yS17-1)*8)-4, self.player, "still"),
        Enemy(((xS18-1)*8)-4, ((yS18-1)*8)-4, self.player, "still"),
        Enemy(((xS19-1)*8)-4, ((yS19-1)*8)-4, self.player, "still"),
        Enemy(((xS20-1)*8)-4, ((yS20-1)*8)-4, self.player, "still"),
        Enemy(((xS21-1)*8)-4, ((yS21-1)*8)-4, self.player, "still"),
        Enemy(((xS22-1)*8)-4, ((yS22-1)*8)-4, self.player, "still"),
        Enemy(((xS23-1)*8)-4, ((yS23-1)*8)-4, self.player, "still"),
        Enemy(((xS24-1)*8)-4, ((yS24-1)*8)-4, self.player, "still"),

        Enemy(((xH25-4)*8)-4, ((yH25-1)*8)-4, self.player, "horizontal"),
        Enemy(((xH26-4)*8)-4, ((yH26-1)*8)-4, self.player, "horizontal"),
        Enemy( ((xV27-1)*8)-4 , ((yV27-4)*8)-4, self.player, "vertical"),
    }

    --Items 
    local npcY = 16
    local npcX = 72
    local entranceY = 2
    local entranceX = 1
    local doorY = 15
    local doorX = 63
    local appleY = 3
    local appleX = 56
    self.items = {
        Item( (npcX-1)*8 , (npcY-1)*8, self.player, "einstein"),
        Item( (entranceX-1)*8, (entranceY-1)*8, self.player, "entrance"),
        Item( (doorX-1)*8, (doorY-1)*8, self.player, "door"),
        Item( ((appleX-1)*8)+1 , ((appleY-1)*8)+1, self.player, "apple"),
    }

    local npcX2 = 47
    local npcY2 = 6
    self.items2 = {
        Item( ((npcX2-1)*8) + 0 , ((npcY2-1)*8) + 6, self.player, "juarismi"),
    }
end

function Level8:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level8:handleTrigger()
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

function Level8:canPause()
    return true
end

function Level8:update(dt)
    self.player:update(dt)
    for _, enemy in ipairs(self.enemies) do
        enemy:update(dt)
    end
    for _, item in ipairs(self.items) do
        item:update(dt)
    end

    for _, item in ipairs(self.items2) do
        item:update(dt)
    end

    for i = #self.items, 1, -1 do
        if self.items[i].removed then
            table.remove(self.items, i)
        end
    end
    Level8Map.update(self, dt)
    self:handleTrigger()
    self.fog:update(dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level8:render()
    Level8Map.renderBeforeCamera(self)
    self.camera:apply()
    for _, items in ipairs(self.items2) do
        items:render()
    end
    love.graphics.setColor(1, 1, 1, 1)

    Level8Map.render(self)

    self.player:render()

    Level8Map.renderAfterPlayer(self)

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

