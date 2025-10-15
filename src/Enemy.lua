Enemy = Class{__includes = BaseState}
Enemy = Class{__includes = Entity}

function Enemy:init(x, y, player, direction)
    self.enemyAnimation = Animation(gFrames['enemySheet'], 0.1)
    self.animTextures = {
        [self.enemyAnimation] = gTextures['enemySheet'],
    }
    self.currentAnimation = self.enemyAnimation

    self.player = player
    self.x = x
    self.y = y
    self.width = 16
    self.height = 16
    self.hitWidth = 13
    self.hitHeight = 13
    self.hitX = x + 1.5
    self.hitY = y + 1.5
    Entity.init(self, x, y, self.width, self.height)
    self.stateMachine = StateMachine {
        ['moving'] = function() return EnemyMovingState(self) end
    }

    self.stateMachine:change('moving', direction)
end

function Enemy:update(dt)
    self.stateMachine:update(dt)
    Entity.update(self, dt)
    self.hitX = self.x + 1.5
    self.hitY = self.y + 1.5
    self.currentAnimation:update(dt)
end

function Enemy:render()
    local texture = self.animTextures[self.currentAnimation]
    local frame = self.currentAnimation:getFrame()

    local scaleX = 1
    local offsetX = 0
    love.graphics.draw(
        texture,
        frame,
        self.x + offsetX,
        self.y,
        0,        
        scaleX,    
        1          
    )
    self.stateMachine.current:render()
    
    -- ----Draw hitbox 
    -- love.graphics.setColor(1, 0, 0)
    -- love.graphics.setLineWidth(1)
    -- love.graphics.rectangle("line", self.hitX, self.hitY, self.hitWidth, self.hitHeight)
    -- love.graphics.setColor(1, 1, 1)
end