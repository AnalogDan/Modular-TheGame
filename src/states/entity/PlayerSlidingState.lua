PlayerSlidingState = Class{__includes = BaseState}

local SLIDE_SPEED = 20

function PlayerSlidingState:init(player)
    self.player = player
end

function PlayerSlidingState:enter(direction)
    self.direction = direction
    if self.direction == 'left' then
        self.player.currentTexture = gTextures['testSlidingLeft']
    else
        self.player.currentTexture = gTextures['testSliding']
    end
    self.player.dy = SLIDE_SPEED
end

function PlayerSlidingState:update(dt)

    -------------Collision wiith floor
    local bottomLeftX2  = self.player.x
    local bottomRightX2 = self.player.x + self.player.width - 1

    local bottomY2 = self.player.y + self.player.height + 1

    local bottomLeftCol2  = math.floor(bottomLeftX2 / TILE_SIZE) + 1
    local bottomRightCol2 = math.floor(bottomRightX2 / TILE_SIZE) + 1
    local bottomRow2      = math.floor(bottomY2 / TILE_SIZE) + 1

    local bottomLeftTile2  = self.player.tileMap[bottomRow2] and self.player.tileMap[bottomRow2][bottomLeftCol2]
    local bottomRightTile2 = self.player.tileMap[bottomRow2] and self.player.tileMap[bottomRow2][bottomRightCol2]

    if (bottomLeftTile2  and bottomLeftTile2  ~= 0 and bottomLeftTile2.solid) or
    (bottomRightTile2 and bottomRightTile2 ~= 0 and bottomRightTile2.solid) then
        self.player.dy = 0
        self.player.y = (bottomRow2 - 1) * TILE_SIZE - self.player.height
        self.player.currentTexture = gTextures['testPlayer']
        self.player.stateMachine:change('idle')
    end

    ----------------When a wall ends 
    local leftX = math.floor((self.player.x - 1) / TILE_SIZE) + 1
    local rightX = math.floor((self.player.x + PLAYER_SIZE) / TILE_SIZE) + 1
    local middleY = math.floor((self.player.y + 5) / TILE_SIZE) + 1
    local middleRightTile = self.player.tileMap[middleY] and self.player.tileMap[middleY][rightX]
    local middleLeftTile = self.player.tileMap[middleY] and self.player.tileMap[middleY][leftX]
    if self.direction == 'left' and (middleLeftTile == 0) then 
        self.player.stateMachine:change('falling')
    elseif self.direction == 'right' and (middleRightTile == 0) then 
        self.player.stateMachine:change('falling')
    end

    ----------------Separating from wall
    if self.direction == 'left' and love.keyboard.isDown('right') then 
        self.player.stateMachine:change('falling')
    elseif self.direction == 'right' and love.keyboard.isDown('left') then
        self.player.stateMachine:change('falling')
    end

    ----------------Jumping
    if self.direction == 'left' and love.keyboard.wasPressed('space') then
        self.player.stateMachine:change('wallJump', 'left')
    elseif self.direction == 'right' and love.keyboard.wasPressed('space') then
        self.player.stateMachine:change('wallJump', 'right')
    end

end

function PlayerSlidingState:render()
end