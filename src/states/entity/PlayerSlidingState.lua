PlayerSlidingState = Class{__includes = BaseState}

local SLIDE_SPEED = 20

function PlayerSlidingState:init(player)
    self.player = player
end

function PlayerSlidingState:enter(direction)
    self.player.currentAnimation = self.player.slideAnimation
    self.direction = direction
    if self.direction == 'left' then
        self.player.currentTexture = gTextures['testSlidingLeft']
    else
        self.player.currentTexture = gTextures['testSliding']
    end
    self.player.dy = SLIDE_SPEED
end

function PlayerSlidingState:update(dt)
    ---------Check bottom collision
    local bottomLeftX2  = self.player.x
    local bottomCenterX2 = self.player.x + (self.player.width/2)
    local bottomRightX2 = self.player.x + self.player.width - 1

    local bottomY2 = self.player.y + self.player.height + math.ceil(self.player.dy * dt)

    local bottomLeftCol2  = math.floor(bottomLeftX2 / TILE_SIZE) + 1
    local bottomCenterCol2 = math.floor(bottomCenterX2 / TILE_SIZE) + 1
    local bottomRightCol2 = math.floor(bottomRightX2 / TILE_SIZE) + 1
    local bottomYRow2      = math.floor(bottomY2 / TILE_SIZE) + 1

    local bottomLeftTile2  = self.player.tileMap[bottomYRow2] and self.player.tileMap[bottomYRow2][bottomLeftCol2]
    local bottomCenterTile2 = self.player.tileMap[bottomYRow2] and self.player.tileMap[bottomYRow2][bottomCenterCol2]
    local bottomRightTile2 = self.player.tileMap[bottomYRow2] and self.player.tileMap[bottomYRow2][bottomRightCol2]

    if (bottomLeftTile2  and bottomLeftTile2  ~= 0 and bottomLeftTile2.solid) or
       (bottomCenterTile2 and bottomCenterTile2 ~= 0 and bottomCenterTile2.solid) or
       (bottomRightTile2 and bottomRightTile2 ~= 0 and bottomRightTile2.solid) then
        self.player.dy = 0
        self.player.y = (bottomYRow2 - 1) * TILE_SIZE - self.player.height
        self.player.currentTexture = gTextures['testPlayer']
        self.player.stateMachine:change('idle')
    end

    -- ----------------When a wall ends 
    -- local leftX = math.floor((self.player.x - 1) / TILE_SIZE) + 1
    -- local rightX = math.floor((self.player.x + PLAYER_SIZE) / TILE_SIZE) + 1
    -- local middleY = math.floor((self.player.y + 5) / TILE_SIZE) + 1
    -- local middleRightTile = self.player.tileMap[middleY] and self.player.tileMap[middleY][rightX]
    -- local middleLeftTile = self.player.tileMap[middleY] and self.player.tileMap[middleY][leftX]
    -- if self.direction == 'left' and (not middleLeftTile.solid) then 
    --     self.player.stateMachine:change('falling')
    -- elseif self.direction == 'right' and (not middleRightTile.solid) then 
    --     self.player.stateMachine:change('falling')
    -- end
    --------------When a wall ends reworked
    local leftX = math.floor((self.player.x - 1) / TILE_SIZE) + 1
    local rightX = math.floor((self.player.x + PLAYER_SIZE) / TILE_SIZE) + 1
    local topY = math.floor((self.player.y) / TILE_SIZE) + 1
    local bottomY = math.floor((self.player.y + self.player.height - 1) / TILE_SIZE) + 1
    local topRightTile = self.player.tileMap[topY] and self.player.tileMap[topY][rightX]
    local topLeftTile = self.player.tileMap[topY] and self.player.tileMap[topY][leftX]
    local bottomRightTile = self.player.tileMap[bottomY] and self.player.tileMap[bottomY][rightX]
    local bottomLeftTile = self.player.tileMap[bottomY] and self.player.tileMap[bottomY][leftX]
    if self.direction == 'left' and (not topLeftTile.solid) and (not bottomLeftTile.solid) then 
        self.player.stateMachine:change('falling')
    elseif self.direction == 'right' and (not topRightTile.solid) and (not bottomRightTile.solid) then 
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