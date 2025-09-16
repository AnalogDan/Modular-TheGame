PlayerWallJumpState = Class{__includes = BaseState}

function PlayerWallJumpState:init(player)
    self.player = player
end

function PlayerWallJumpState:enter()
    self.player.dy = self.jumpSpeed
end

function PlayerWallJumpState:update(dt)

end

function PlayerWallJumpState:render()
end