PlayerIdleState = Class{__includes = BaseState}

function PlayerIdleState:init(player)
    self.player = player
end

function PlayerIdleState:enter()
    self.player.dx = 0 
    self.player.currentAnimation = self.player.idleAnimation
    self.player.currentAnimation:reset()
end

function PlayerIdleState:update(dt)
    local keyLeft = love.keyboard.isDown('left')
    local keyRight = love.keyboard.isDown('right')
    local keySpace = love.keyboard.wasPressed('space')

    -- Movement
    if self.player.jumpBufferTime > 0 then
        self.player.jumpBufferTime = 0
        self.player.stateMachine:change('jumping')
    elseif keyLeft and keyRight then
        
    elseif keyLeft or keyRight then
        self.player.stateMachine:change('walking')
    end
end

function PlayerIdleState:render()
   
end