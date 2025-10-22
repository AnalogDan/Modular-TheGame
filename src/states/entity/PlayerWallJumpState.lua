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
    
    self.soundFlag = false
    local pitch = 1.2 + math.random() * 0.5
    gSounds['jump']:stop()
    gSounds['jump']:setPitch(pitch)
    gSounds['jump']:setVolume(0.9)
    gSounds['jump']:play()
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
    local leftX = self.player.x - 1
    local rightX = self.player.x + self.player.width + 1
    local topY = self.player.y
    local middleY = self.player.y + 5
    local bottomY = self.player.y + self.player.height - 1

    local leftCol = math.floor(leftX / TILE_SIZE) + 1
    local rightCol = math.floor(rightX / TILE_SIZE) + 1

    local topYRow2 = math.floor(topY / TILE_SIZE) + 1
    local middleYRow = math.floor(middleY / TILE_SIZE) + 1
    local bottomYRow = math.floor(bottomY / TILE_SIZE) + 1

    if self.direction == 'right' then
        local topLeftTile = self.player.tileMap[topYRow2] and self.player.tileMap[topYRow2][leftCol]
        local middleLeftTile = self.player.tileMap[middleYRow] and self.player.tileMap[middleYRow][leftCol]
        local bottomLeftTile = self.player.tileMap[bottomYRow] and self.player.tileMap[bottomYRow][leftCol]

        if (topLeftTile and topLeftTile ~= 0 and topLeftTile.solid) or
        (middleLeftTile and middleLeftTile ~= 0 and middleLeftTile.solid) or
        (bottomLeftTile and bottomLeftTile ~= 0 and bottomLeftTile.solid) then
        
            self.player.dx = 0
            self.player.x = (leftCol) * TILE_SIZE
            self.player.stateMachine:change('sliding', 'left')
        end

    elseif self.direction == 'left' then
        local topRightTile = self.player.tileMap[topYRow2] and self.player.tileMap[topYRow2][rightCol]
        local middleRightTile = self.player.tileMap[middleYRow] and self.player.tileMap[middleYRow][rightCol]
        local bottomRightTile = self.player.tileMap[bottomYRow] and self.player.tileMap[bottomYRow][rightCol]

        if (topRightTile and topRightTile ~= 0 and topRightTile.solid) or
        (middleRightTile and middleRightTile ~= 0 and middleRightTile.solid) or
        (bottomRightTile and bottomRightTile ~= 0 and bottomRightTile.solid) then

            self.player.dx = 0
            self.player.x = (rightCol - 1) * TILE_SIZE - self.player.width
            self.player.stateMachine:change('sliding', 'right')
        end
    end

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
        if not self.soundFlag then 
            local pitch = 0.9 + math.random() * 0.5
            gSounds['fall']:stop()
            gSounds['fall']:setPitch(pitch)
            gSounds['fall']:setVolume(0.3)
            gSounds['fall']:play()
        end
        self.player.stateMachine:change('idle')
    end
end

function PlayerWallJumpState:render()
end