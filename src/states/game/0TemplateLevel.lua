LevelTemplate = Class{__includes = BaseState}

function LevelTemplate:init()
    self.currentLevel = 'level1' --Used for spawning after death
    self.nextLevel = 'level1'
    self.nextTransition = {state = 'transition', params = {transNumber = 1, nextLevel = self.nextLevel}} -- can be nil if needed
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = false
    self.nextChapterNumber = 1

    Level0Map.generate(self)
    SystemDialogue.init(self, Level1Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    local playerY = 1
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
    local npcY = 1
    local npcX = 1
    local entranceY = 1
    local entranceX = 1
    local doorY = 1
    local doorX = 1
    local appleY = 1
    local appleX = 1
    self.items = {
        --Item( (npcX-1)*8 , (npcY-1)*8, self.player, "juarismi"),
        --Item( (entranceX-1)*8, (entranceY-1)*8, self.player, "entrance"),
        --Item( (doorX-1)*8, (doorY-1)*8, self.player, "door"),
        --Item( ((appleX-1)*8)+1 , ((appleY-1)*8)+1, self.player, "apple"),
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

function LevelTemplate:canPause()
    return true
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
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function LevelTemplate:render()
    Level0Map.renderBeforeCamera(self)
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
    SystemTransition.render()
end

