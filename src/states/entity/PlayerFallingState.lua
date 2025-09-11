PlayerFallingState = Class{__includes = BaseState}

local FALL_SPEED = 40 
local WALK_SPEED = 60

function PlayerFallingState:init(player)
    self.player = player
    self.gravity = 20 
end

function PlayerFallingState:enter()
    -- Stop horizontal movement unless keys are pressed
    self.player.dx = 0
end

local function getTileAt(pixelX, pixelY, tileMap)
    local col = math.floor(pixelX / TILE_SIZE) + 1
    local row = math.floor(pixelY / TILE_SIZE) + 1
    return tileMap[row] and tileMap[row][col]
end

function PlayerFallingState:update(dt)
    self.player.dy = FALL_SPEED

    local topLeftX = self.player.x
    local topLeftY = self.player.y
    local topRightX = self.player.x + self.player.width
    local topRightY = self.player.y 
    local bottomLeftX = self.player.x
    local bottomLeftY = self.player.y + self.player.height
    local bottomRightX = self.player.x + self.player.width
    local bottomRightY = self.player.y + self.player.height

    local topLeftCol = math.floor(topLeftX / TILE_SIZE) + 1
    local bottomLeftCol = math.floor(bottomLeftX / TILE_SIZE) + 1
    local topRightCol = math.floor(topRightX / TILE_SIZE) + 1
    local bottomRightCol = math.floor(bottomRightX / TILE_SIZE) + 1

    local topRow = math.floor(topLeftY / TILE_SIZE) + 1
    local bottomRow = math.floor(bottomLeftY / TILE_SIZE) + 1

    -- if love.keyboard.isDown('left') then
    --     self.player.dx = -WALK_SPEED
    --     local topLeftTile = getTileAt(topLeftX -1, topLeftY, self.player.tileMap)
    --     local bottomLeftTile = getTileAt(bottomLeftX -1, bottomLeftY, self.player.tileMap)

    --     if (topLeftTile ~= 0 and topLeftTile and topLeftTile.solid) or
    --        (bottomLeftTile ~= 0 and bottomLeftTile and bottomLeftTile.solid) then
    --         self.player.dx = 0
    --     end
    -- elseif love.keyboard.isDown('right') then
    --     self.player.dx = WALK_SPEED
    --     local topRightTile = getTileAt(topRightX + 1, topRightY, self.player.tileMap)
    --     local bottomRightTile = getTileAt(bottomRightX + 1, bottomRightY, self.player.tileMap)

    --     if (topRightTile ~= 0 and topRightTile and topRightTile.solid) or
    --     (bottomRightTile ~= 0 and bottomRightTile and bottomRightTile.solid) then
    --         self.player.dx = 0
    --     end
    -- else
    --     self.player.dx = 0
    -- end
    if love.keyboard.isDown('left') then
        self.player.dx = -WALK_SPEED
        local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topLeftCol - 1]
        local bottomLeftTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomLeftCol - 1]

        if (topLeftTile ~= 0 and topLeftTile and topLeftTile.solid) or
        (bottomLeftTile ~= 0 and bottomLeftTile and bottomLeftTile.solid) then
            self.player.dx = 0
            self.player.x = topLeftCol * TILE_SIZE  -- snap flush
        end

    -- Right movement
    elseif love.keyboard.isDown('right') then
        self.player.dx = WALK_SPEED
        local topRightTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topRightCol + 1]
        local bottomRightTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomRightCol + 1]

        if (topRightTile ~= 0 and topRightTile and topRightTile.solid) or
        (bottomRightTile ~= 0 and bottomRightTile and bottomRightTile.solid) then
            self.player.dx = 0
            self.player.x = (topRightCol - 1) * TILE_SIZE - self.player.width  -- snap flush
        end

    else
        self.player.dx = 0
    end

    local feetX = math.floor((self.player.x + self.player.width / 2) / TILE_SIZE) + 1
    local feetY = math.floor((self.player.y + self.player.height) / TILE_SIZE) + 1

    local tileFeet = self.player.tileMap[feetY] and self.player.tileMap[feetY][feetX]

    if tileFeet ~= 0 and tileFeet and tileFeet.solid then
        self.player.dy = 0
        self.player.y = (feetY - 1) * TILE_SIZE - self.player.height
        self.player.stateMachine:change('idle')
    end
end

function PlayerFallingState:render()
end