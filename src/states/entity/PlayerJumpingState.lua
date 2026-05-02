PlayerJumpingState = Class{__includes = BaseState}

function PlayerJumpingState:init(player)
    self.player = player
    self.jumpSpeed = -80
    self.player.currentTexture = gTextures['testPlayer']
end

function PlayerJumpingState:enter()
    self.player.currentAnimation = self.player.jumpAnimation
    self.player.currentAnimation:reset()
    self.player.dy = self.jumpSpeed
    self.player.jumpBufferTime = 0

    Sound.playSFX("jump", { volume = 0.7, pitch = 0.9 + math.random() * 0.3 })
end

local function checkGoalTile(tile)
    return tile and tile ~= 0 and tile.type == 'goal'
end

function PlayerJumpingState:update(dt)
    local keyLeft = love.keyboard.isDown('left')
    local keyRight = love.keyboard.isDown('right')
    local keySpace = love.keyboard.isDown('space')

    if keySpace and self.player.dy < 10 then
        self.player.dy = self.player.dy + GRAVITY * dt
    else
        self.player.dy = 0
        self.player.stateMachine:change('falling')
    end

    ---------------------- head collision and corner correction
    local leftX = self.player.x
    local middleX = self.player.x + (self.player.width / 2)
    local rightX = self.player.x + self.player.width - 1
    local topY = self.player.y + math.ceil(self.player.dy * dt)

    local leftCol = math.floor(leftX / TILE_SIZE) + 1
    local middleCol = math.floor(middleX / TILE_SIZE) + 1
    local rightCol = math.floor(rightX / TILE_SIZE) + 1
    local topRow2 = math.floor(topY / TILE_SIZE) + 1

    local leftTile = self.player.tileMap[topRow2] and self.player.tileMap[topRow2][leftCol]
    local middleTile = self.player.tileMap[topRow2] and self.player.tileMap[topRow2][middleCol]
    local rightTile = self.player.tileMap[topRow2] and self.player.tileMap[topRow2][rightCol]

    local CORNER_PIXELS = 4
    local leftInsetX = self.player.x + CORNER_PIXELS
    local rightInsetX = self.player.x + self.player.width - CORNER_PIXELS
    local leftInsetCol = math.floor(leftInsetX / TILE_SIZE) + 1
    local rightInsetCol = math.floor(rightInsetX / TILE_SIZE) + 1
    local leftInsetTile = self.player.tileMap[topRow2] and self.player.tileMap[topRow2][leftInsetCol] --Tile 2 pixels away from the left edge
    local rightInsetTile = self.player.tileMap[topRow2] and self.player.tileMap[topRow2][rightInsetCol] --Tile 2 pixels away from the right edge

    if (leftTile ~= 0 and leftTile and leftTile.solid) or
    (middleTile ~= 0 and middleTile and middleTile.solid) or
    (rightTile ~= 0 and rightTile and rightTile.solid) then
        if leftTile and leftTile.solid and (not leftInsetTile or not leftInsetTile.solid) then
            self.player.x = leftCol * TILE_SIZE
        elseif rightTile and rightTile.solid and (not rightInsetTile or not rightInsetTile.solid) then
            self.player.x = (rightCol - 1) * TILE_SIZE - self.player.width
        else
            self.player.dy = 0        
            self.player.y = (topRow2 * TILE_SIZE) 
            self.player.stateMachine:change('falling')
        end
    end


    ---------------------- sides collision
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

    if keyLeft and keyRight then 
        self.player.dx = 0
    elseif keyLeft then
        self.player.dx = -WALK_SPEED
        local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topLeftCol]
        local bottomLeftTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomLeftCol]

        if (topLeftTile ~= 0 and topLeftTile and topLeftTile.solid) or
        (bottomLeftTile ~= 0 and bottomLeftTile and bottomLeftTile.solid) then
            self.player.dx = 0
            self.player.x = (topLeftCol) * TILE_SIZE
            self.player.stateMachine:change('sliding', 'left')
        end

    elseif keyRight then
        self.player.dx = WALK_SPEED
        local topRightTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topRightCol]
        local bottomRightTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomRightCol]

        if (topRightTile ~= 0 and topRightTile and topRightTile.solid) or
        (bottomRightTile ~= 0 and bottomRightTile and bottomRightTile.solid) then
            self.player.dx = 0
            self.player.x = (topRightCol - 1) * TILE_SIZE - self.player.width 
            self.player.stateMachine:change('sliding', 'right')
        end
    else
        self.player.dx = 0
    end

    -- Check Goal
    local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topLeftCol]
    local bottomLeftTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomLeftCol]
    local topRightTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topRightCol]
    local bottomRightTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomRightCol]
    if checkGoalTile(topLeftTile) or checkGoalTile(topRightTile) or
       checkGoalTile(bottomLeftTile) or checkGoalTile(bottomRightTile)  then
        self.player:reachGoal()
    end
end

function PlayerJumpingState:render()
end