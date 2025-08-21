PlayerWalkingState = Class{__includes = BaseState}

local WALKING_SPEED = 60

function PlayerWalkingState:init(player)
    self.player = player
end

function PlayerWalkingState:update(dt)
    if love.keyboard.isDown('left') then
        self.player.dx = -WALKING_SPEED
    elseif love.keyboard.isDown('right') then
        self.player.dx = WALKING_SPEED
    else
        self.player.stateMachine:change('idle')
        self.player.dx = 0
    end

    if love.keyboard.wasPressed('space') then
        self.player.stateMachine:change('jumping')
    end
end

function PlayerWalkingState:render()
    -- optional for now, can reuse idle render
end