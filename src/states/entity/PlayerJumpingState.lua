PlayerJumpingState = Class{__includes = BaseState}

local WALK_SPEED = 60
local FALL_SPEED = 100


function PlayerJumpingState:init(player)
    self.player = player
    self.jumpSpeed = -70
end

function PlayerJumpingState:enter()
    self.player.dy = self.jumpSpeed
end

function PlayerJumpingState:update(dt)
    if self.player.dy < 0 then
        self.player.dy = self.player.dy + FALL_SPEED * dt
    else
        self.player.stateMachine:change('falling')
    end

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
    ---------------------- check head collisions
    local topLeftX2 = self.player.x
    local topLeftY2 = self.player.y - 1
    local topRightX2 = self.player.x + self.player.width - 1

    local topLeftCol2 = math.floor(topLeftX2 / TILE_SIZE) + 1
    local topRightCol2 = math.floor(topRightX2 / TILE_SIZE) + 1
    local topRow2 = math.floor(topLeftY2 / TILE_SIZE) + 1

    local topLeftTile2 = self.player.tileMap[topRow2] and self.player.tileMap[topRow2][topLeftCol2]
    local topRightTile2 = self.player.tileMap[topRow2] and self.player.tileMap[topRow2][topRightCol2]

    if (topLeftTile2 ~= 0 and topLeftTile2 and topLeftTile2.solid) or
    (topRightTile2 ~= 0 and topRightTile2 and topRightTile2.solid) then
        self.player.dy = 0        
        self.player.y = topRow2 * TILE_SIZE 
    end

    
    if love.keyboard.isDown('left') then
        self.player.dx = -WALK_SPEED
        local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topLeftCol]
        local bottomLeftTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomLeftCol]

        if (topLeftTile ~= 0 and topLeftTile and topLeftTile.solid) or
        (bottomLeftTile ~= 0 and bottomLeftTile and bottomLeftTile.solid) then
            self.player.dx = 0
            self.player.x = (topLeftCol) * TILE_SIZE
        end
    elseif love.keyboard.isDown('right') then
        self.player.dx = WALK_SPEED
        local topRightTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topRightCol]
        local bottomRightTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomRightCol]

        if (topRightTile ~= 0 and topRightTile and topRightTile.solid) or
        (bottomRightTile ~= 0 and bottomRightTile and bottomRightTile.solid) then
            self.player.dx = 0
            self.player.x = (topRightCol - 1) * TILE_SIZE - self.player.width 
        end
    else
        self.player.dx = 0
    end
end

function PlayerJumpingState:render()
end