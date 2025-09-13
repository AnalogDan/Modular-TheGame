PlayerSlidingState = Class{__includes = BaseState}

function PlayerSlidingState:init(player)
    self.player = player
end

function PlayerSlidingState:enter()
    self.player.dy = self.jumpSpeed
end

function PlayerSlidingState:update(dt)

end

function PlayerSlidingState:render()
end