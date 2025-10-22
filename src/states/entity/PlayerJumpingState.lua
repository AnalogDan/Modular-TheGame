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

    local pitch = 0.9 + math.random() * 0.3
    gSounds['jump']:stop()
    gSounds['jump']:setPitch(pitch)
    gSounds['jump']:setVolume(0.4)
    gSounds['jump']:play()
end

function PlayerJumpingState:update(dt)
    if love.keyboard.isDown('space') and self.player.dy < 10 then
        self.player.dy = self.player.dy + GRAVITY * dt
    else
        self.player.dy = 0
        self.player.stateMachine:change('falling')
    end

    ---------------------- head collision
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

    if (leftTile ~= 0 and leftTile and leftTile.solid) or
    (middleTile ~= 0 and middleTile and middleTile.solid) or
    (rightTile ~= 0 and rightTile and rightTile.solid) then
        self.player.dy = 0        
        self.player.y = (topRow2 * TILE_SIZE) 
        self.player.stateMachine:change('falling')
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

    if love.keyboard.isDown('left') then
        self.player.dx = -WALK_SPEED
        local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topLeftCol]
        local bottomLeftTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][bottomLeftCol]

        if (topLeftTile ~= 0 and topLeftTile and topLeftTile.solid) or
        (bottomLeftTile ~= 0 and bottomLeftTile and bottomLeftTile.solid) then
            self.player.dx = 0
            self.player.x = (topLeftCol) * TILE_SIZE
            self.player.stateMachine:change('sliding', 'left')
        end

    elseif love.keyboard.isDown('right') then
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
end

function PlayerJumpingState:render()
end