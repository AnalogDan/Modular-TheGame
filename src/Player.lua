Player = Class{__includes = BaseState}
Player = Class{__includes = Entity}

function Player:init(x, y, tileMap)
    self.idleAnimation = Animation(gFrames['idleSheet'], 0.2)
    self.walkAnimation = Animation(gFrames['walkSheet'], 0.1)
    self.fallAnimation = Animation(gFrames['fallSheet'], 0.05, false)
    self.jumpAnimation = Animation(gFrames['jumpSheet'], 0.05, false)
    self.slideAnimation = Animation(gFrames['slideSheet'], 0.5)
    self.wJumpAnimation = Animation(gFrames['wJumpSheet'], 0.1, false)
    self.rootDeathAnimation = Animation(gFrames['rootDeathSheet'], 0.1, false)
    self.currentAnimation = self.wJumpAnimation
    self.animTextures = {
        [self.idleAnimation] = gTextures['idleSheet'],
        [self.walkAnimation] = gTextures['walkSheet'],
        [self.fallAnimation] = gTextures['fallSheet'],
        [self.jumpAnimation] = gTextures['jumpSheet'],
        [self.slideAnimation] = gTextures['slideSheet'],
        [self.wJumpAnimation] = gTextures['wJumpSheet'],
        [self.rootDeathAnimation] = gTextures['rootDeathSheet'],
    }
    self.direction  = "left"
    
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
        ['wallJump'] = function() return PlayerWallJumpState(self) end,
        ['dead'] = function() return PlayerDeadState(self) end
    }
    self.stateString = "alive"

    self.stateMachine:change('falling')
end

function Player:reachGoal()
    gStateMachine:change('level2')
end
function Player:reachPit()
    gStateMachine:change('level1')
end

function Player:gotHit()
    self.stateMachine:change('dead')
end

function Player:update(dt)
    self.stateMachine:update(dt)
    -- update position based on velocity
    Entity.update(self, dt)

    self.hitX = self.x + 1.5
    self.hitY = self.y + 1.5
    self.currentAnimation:update(dt)

    if love.keyboard.isDown('right') then
        self.direction = 'right'
    elseif love.keyboard.isDown('left') then
        self.direction = 'left'
    end
end

function Player:render()
    
    local texture = self.animTextures[self.currentAnimation]
    local frame = self.currentAnimation:getFrame()

    local scaleX = 1
    local offsetX = 0
    if self.direction == 'left' then
        scaleX = -1
        offsetX = 10 
    end
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