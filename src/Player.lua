Player = Class{__includes = BaseState}
Player = Class{__includes = Entity}

function Player:init(x, y, tileMap)
    self.idleAnimation = Animation(gFrames['idleSheet'], 0.2)
    self.currentAnimation = self.idleAnimation
    self.animTextures = {
        [self.idleAnimation] = gTextures['idleSheet']
    }
    
    self.tileMap = tileMap
    self.hitWidth = 7
    self.hitHeight = 7
    self.x = x
    self.y = y
    self.hitX = x + 1.5
    self.hitY = y + 1.5
    Entity.init(self, x, y, 10, 10)
    self.stateMachine = StateMachine {
        ['idle'] = function() return PlayerIdleState(self) end,
        ['walking'] = function() return PlayerWalkingState(self) end,
        ['falling'] = function() return PlayerFallingState(self) end,
        ['jumping'] = function() return PlayerJumpingState(self) end,
        ['sliding'] = function() return PlayerSlidingState(self) end,
        ['wallJump'] = function() return PlayerWallJumpState(self) end
    }

    self.stateMachine:change('falling')
end

function Player:reachGoal()
    gStateMachine:change('game')
end

function Player:gotHit()
    self.x = 0
    self.y = 0
end

function Player:update(dt)
    self.stateMachine:update(dt)
    -- update position based on velocity
    Entity.update(self, dt)

    self.hitX = self.x + 1.5
    self.hitY = self.y + 1.5
    self.currentAnimation:update(dt)
end

function Player:render()
    
    local texture = self.animTextures[self.currentAnimation]
    local frame = self.currentAnimation:getFrame()
    love.graphics.draw(texture, frame, self.x, self.y)
    self.stateMachine.current:render()

    -- ----Draw hitbox 
    -- love.graphics.setColor(1, 0, 0)
    -- love.graphics.setLineWidth(1)
    -- love.graphics.rectangle("line", self.hitX, self.hitY, self.hitWidth, self.hitHeight)
    -- love.graphics.setColor(1, 1, 1)
end