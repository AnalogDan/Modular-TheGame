PlayerDeadState = Class{__includes = BaseState}

function PlayerDeadState:init(player)
    self.player = player
end

function PlayerDeadState:enter()
    self.player.dx = 0 
    self.player.dy = FALL_SPEED - 30
    self.player.currentAnimation = self.player.rootDeathAnimation
    self.player.currentAnimation:reset()
    self.player.stateString = "dead"
    self.timer = 0
end

function PlayerDeadState:update(dt)
    self.timer = self.timer + dt
    if self.timer > 2.5 then
        gStateMachine:change('game')
    end

    -----------Check bottom collision
    local bottomLeftX2  = self.player.x
    local bottomRightX2 = self.player.x + self.player.width - 1

    local bottomY2 = self.player.y + self.player.height + 1

    local bottomLeftCol2  = math.floor(bottomLeftX2 / TILE_SIZE) + 1
    local bottomRightCol2 = math.floor(bottomRightX2 / TILE_SIZE) + 1
    local bottomRow2      = math.floor(bottomY2 / TILE_SIZE) + 1

    local bottomLeftTile2  = self.player.tileMap[bottomRow2] and self.player.tileMap[bottomRow2][bottomLeftCol2]
    local bottomRightTile2 = self.player.tileMap[bottomRow2] and self.player.tileMap[bottomRow2][bottomRightCol2]
    self.debug = "no"
    if (bottomLeftTile2  and bottomLeftTile2  ~= 0 and bottomLeftTile2.solid) or
    (bottomRightTile2 and bottomRightTile2 ~= 0 and bottomRightTile2.solid) then
        self.player.dy = 0
        self.player.y = (bottomRow2 - 1) * TILE_SIZE - self.player.height
        self.debug = "yes"
    end
end

function PlayerDeadState:render()
    love.graphics.print("Timer: " .. tostring(self.timer), 10, 20)
end