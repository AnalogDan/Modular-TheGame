Level4 = Class{__includes = BaseState}
local utf8 = require("utf8")

function Level4:init()
    self.currentLevel = 'level4'
    self.nextLevel = 'level1'
    self.nextTransition = {state = 'transition', params = {transNumber = 4, nextLevel = self.nextLevel}}
    self.triggerRemoved = false

    --Is checkpoint?
    self.unlocksNext = false
    self.nextChapterNumber = 5

    Level4Map.generate(self)
    SystemDialogue.init(self, Level4Dialogue.get())
    SystemLeaves.init(self)
    SystemTransition.start('uncover', function() end)

    self.player = Player(-20, 126, self.tileMap, self.currentLevel, self.nextLevel, self.nextTransition, self.unlocksNext, self.nextChapterNumber, 'right')
    self.enemies = {
        --Enemy(24, 8, self.player, "vertical"),
    }
    self.items = {
        Item(144, 80, self.player, "tales"),
        Item(0, 120, self.player, "entrance"),
        -- Item(152, 88, self.player, "apple"),
    }
end

function Level4:textinput(text)
    SystemDialogue.textinput(self, text)
end

function Level4:handleTrigger()
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

function Level4:update(dt)
    self.player:update(dt)

    --Update enemies and items unless they're removed
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

    self:handleTrigger()

    SystemLeaves.update(self, dt)
    SystemTransition.update(dt)
    SystemDialogue.update(self, dt)
end

function Level4:render()
    Level4Map.render(self)

    self.player:render()

    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
    end

    Level4Map.renderAfterPlayer(self)
    SystemLeaves.render(self)

    SystemDialogue.render(self)
    SystemTransition.render()
end

