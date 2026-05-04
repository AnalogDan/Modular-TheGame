Level10 = Class{__includes = BaseState}

function Level10:init()
    self.currentLevel = 'level10' --Used for spawning after death
    self.nextLevel = 'video'
    self.nextTransition = nil -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = false
    self.nextChapterNumber = nil

    Level10Map.generate(self)
    SystemDialogue.init(self, Level10Dialogue.get())
    self.fog = SystemFog(self.totalMapWidth * 8)
    SystemTransition.start('uncover', function() end)

    local playerY = 13
    self.player = Player(-20, ((playerY-1)*8)-2, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    
    --Enemies
    local yH1 = 1
    local xH1= 1

    local yV1 = 1
    local xV1= 1

    local yS1 = 1
    local xS1= 1
    self.enemies = {
        --Enemy( ((xH1-4)*8)-4 , ((yH1-1)*8)-4, self.player, "horizontal"),
        --Enemy(((xV1-1)*8)-4, ((yV1-4)*8)-4, self.player, "vertical"),
        --Enemy(((xS1-1)*8)-4, ((yS1-1)*8)-4, self.player, "still"),
    }

    --Items 
    local npcY = 15
    local npcX1 = 10
    local npcX2 = 12
    local npcX3 = 14
    local npcX4 = 18
    local npcX5 = 20
    local npcX6 = 22
    local npcX7 = 24
    local entranceY = 12
    local entranceX = 1
    local doorY = 1
    local doorX = 1
    local appleY = 1
    local appleX = 1
    self.items = {
        Item( (npcX1-1)*8 , (npcY-1)*8, self.player, "juarismi"),
        Item( (npcX2-1)*8 , (npcY-1)*8, self.player, "tales"),
        Item( (npcX3-1)*8 , (npcY-1)*8, self.player, "turing"),
        Item( (npcX4-1)*8 , (npcY-1)*8, self.player, "einstein"),
        Item( (npcX5-1)*8 , (npcY-1)*8, self.player, "arquimedes"),
        Item( (npcX6-1)*8 , (npcY-1)*8, self.player, "fibonacci"),
        Item( (npcX7-1)*8 , (npcY-1)*8, self.player, "pitagoras"),
    }

    self.items2 = {
        Item( (entranceX-1)*8, (entranceY-1)*8, self.player, "entrance"),
    }

    self.itemsFace = {
        Item( 1, 1, self.player, "face"),
    }


    self.itemsFadeAlpha = 0
    self.itemsFadingIn = false
    self.itemsFadeSpeed = 0.5
end

function Level10:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level10:handleTrigger()
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

function Level10:canPause()
    return true
end

function Level10:update(dt)

    if self.itemsFadingIn then
        self.itemsFadeAlpha = math.min(1, self.itemsFadeAlpha + self.itemsFadeSpeed * dt)
    end

    for _, enemy in ipairs(self.enemies) do
        enemy:update(dt)
    end
    
    for _, item in ipairs(self.items2) do
        item:update(dt)
        
    end

    for _, item in ipairs(self.itemsFace) do
        item:update(dt)
        
    end

    for _, item in ipairs(self.items) do
        item:update(dt)
        
    end
    self.player:update(dt)

    for i = #self.items, 1, -1 do
        if self.items[i].removed then
            table.remove(self.items, i)
        end
    end

    for i = #self.items2, 1, -1 do
        if self.items[i].removed then
            table.remove(self.items2, i)
        end
    end

    for i = #self.itemsFace, 1, -1 do
        if self.items[i].removed then
            table.remove(self.itemsFace, i)
        end
    end
    Level10Map.update(self, dt)
    self:handleTrigger()
    self.fog:update(dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level10:render()
    Level10Map.renderBeforeCamera(self)
    self.camera:apply()
    Level10Map.render(self)

    

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end

    for _, item in ipairs(self.items2) do
        love.graphics.setColor(1, 1, 1, 1)
        item:render()
    end

    for _, item in ipairs(self.itemsFace) do
        love.graphics.setColor(1, 1, 1, 1)
        item:render()
    end

    self.player:render()

    Level10Map.renderAfterPlayer(self)

    -- Faded items
    love.graphics.setColor(1, 1, 1, self.itemsFadeAlpha)
    for _, item in ipairs(self.items) do
        item:render()
    end
    love.graphics.setColor(1, 1, 1, 1)

    self.fog:render()
    self.camera:clear()

    SystemDialogue.render(self)
    SystemTransition.render()

    --Debug text
    -- local debugText = "Debug1: "
    -- love.graphics.print(tostring(self.itemsFadingIn), 10, 20)
end

