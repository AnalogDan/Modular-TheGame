PlayerJumpingState = Class{__includes = BaseState}

local WALK_SPEED = 60
local FALL_SPEED = 100


function PlayerJumpingState:init(player)
    self.player = player
    self.jumpSpeed = -80
end

function PlayerJumpingState:enter()
    self.player.dy = self.jumpSpeed
end

function PlayerJumpingState:update(dt)
    if self.player.dy < 0 then
        -- still moving up, reduce dy toward zero (optional for smoother jump)
        self.player.dy = self.player.dy + FALL_SPEED * dt
    else
        -- reached apex, start falling
        self.player.stateMachine:change('falling')
    end

    
    if love.keyboard.isDown('left') then
        self.player.dx = -WALK_SPEED
    elseif love.keyboard.isDown('right') then
        self.player.dx = WALK_SPEED
    else
        self.player.dx = 0
    end
end

function PlayerJumpingState:render()
end