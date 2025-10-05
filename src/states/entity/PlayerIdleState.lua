PlayerIdleState = Class{__includes = BaseState}

function PlayerIdleState:init(player)
    self.player = player
end

function PlayerIdleState:enter()
    self.player.dx = 0 
    self.player.currentTexture = gTextures['testPlayer']
end

function PlayerIdleState:update(dt)
    -- switch to walking if left/right pressed
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
        self.player.stateMachine:change('walking')
    -- jump if space pressed
    elseif love.keyboard.wasPressed('space') then
        self.player.stateMachine:change('jumping')
    end
end

function PlayerIdleState:render()
end