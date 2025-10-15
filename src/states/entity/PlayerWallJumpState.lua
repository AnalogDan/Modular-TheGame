PlayerWallJumpState = Class{__includes = BaseState}

function PlayerWallJumpState:init(player)
    self.player = player
end

local XFORCE = 70
local YFORCE = -70

function PlayerWallJumpState:enter(direction)
    self.player.currentAnimation = self.player.wJumpAnimation
    self.player.currentAnimation:reset()
    self.direction = direction
    if self.direction == 'left' then
        self.player.direction = "right"
        self.player.dx = XFORCE
    elseif self.direction == 'right' then
        self.player.direction = "left"
        self.player.dx = -XFORCE
    end
    self.player.dy = -42
    self.player.falling = false
    self.canMove = false
    Timer.after(0.2, function()
        self.canMove = true
    end)

end

function PlayerWallJumpState:update(dt)
    Timer.update(dt)
    
    --------controling jumping and falling
    if love.keyboard.isDown('space') and self.player.dy < 0 then
        self.player.dy = self.player.dy + GRAVITY * dt
    elseif self.player.falling == false then
        self.player.dy = 0
        self.player.falling = true
    end
    if self.player.falling then
        self.player.dy = self.player.dy + GRAVITY * dt
    end
    if self.player.dy > FALL_SPEED then
        self.player.dy = FALL_SPEED
    end

    --------controling movement
    if love.keyboard.isDown('left') and self.canMove and self.direction == 'left' then 
        self.player.dx = self.player.dx - 300 * dt
        if self.player.dx < 0 then 
            self.player.currentTexture = gTextures['testWJumpRight']
            self.direction = 'right'
        end 
    elseif love.keyboard.isDown('left') and self.canMove and self.direction == 'right' then 
        self.player.dx = self.player.dx - 300 * dt
        if self.player.dx < -XFORCE then 
            self.player.dx = -XFORCE
        end
    end

    if love.keyboard.isDown('right') and self.canMove and self.direction == 'right' then 
        self.player.dx = self.player.dx - 300 * dt
        if self.player.dx < 0 then 
            self.player.currentTexture = gTextures['testWJumpLeft']
            self.direction = 'left'
        end 
    elseif love.keyboard.isDown('right') and self.canMove and self.direction == 'left' then 
        self.player.dx = self.player.dx + 300 * dt
        if self.player.dx > XFORCE then 
            self.player.dx = XFORCE
        end
    end
        
    --------sides collision 
    local topLeftX = self.player.x - 1
    local topLeftY = self.player.y
    local topRightX = self.player.x + self.player.width + 1
    local bottomLeftX = self.player.x - 1
    local bottomLeftY = self.player.y + self.player.height
    local bottomRightX = self.player.x + self.player.width + 1

    local topLeftCol = math.floor(topLeftX / TILE_SIZE) + 1
    local bottomLeftCol = math.floor(bottomLeftX / TILE_SIZE) + 1
    local topRightCol = math.floor(topRightX / TILE_SIZE) + 1
    local bottomRightCol = math.floor(bottomRightX / TILE_SIZE) + 1

    local topRow = math.floor(topLeftY / TILE_SIZE) + 1
    local bottomRow = math.floor(bottomLeftY / TILE_SIZE) + 1

    if self.direction == 'right' then
        local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topLeftCol]
        local bottomLeftTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomLeftCol]

        if (topLeftTile ~= 0 and topLeftTile and topLeftTile.solid) or
        (bottomLeftTile ~= 0 and bottomLeftTile and bottomLeftTile.solid) then
            self.player.dx = 0
            self.player.x = (topLeftCol) * TILE_SIZE
            self.player.stateMachine:change('sliding', 'left')
        end

    elseif self.direction == 'left' then
        local topRightTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topRightCol]
        local bottomRightTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomRightCol]

        if (topRightTile ~= 0 and topRightTile and topRightTile.solid) or
        (bottomRightTile ~= 0 and bottomRightTile and bottomRightTile.solid) then
            self.player.dx = 0
            self.player.x = (topRightCol - 1) * TILE_SIZE - self.player.width 
            self.player.stateMachine:change('sliding', 'right')
        end
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

    if (bottomLeftTile2  and bottomLeftTile2  ~= 0 and bottomLeftTile2.solid) or
    (bottomRightTile2 and bottomRightTile2 ~= 0 and bottomRightTile2.solid) then
        self.player.dy = 0
        self.player.y = (bottomRow2 - 1) * TILE_SIZE - self.player.height
        self.player.stateMachine:change('idle')
    end
end

function PlayerWallJumpState:render()
end