Player = Class{__includes = BaseState}
Player = Class{__includes = Entity}

function Player:init(x, y, tileMap)
    self.tileMap = tileMap
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

function Player:update(dt)
    self.stateMachine:update(dt)
    -- update position based on velocity
    Entity.update(self, dt)
end

function Player:render()
    local tex = self.currentTexture or gTextures['testPlayer']
    Entity.render(self, tex)
end