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
    self.directionLocked = true
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
        self.directionLocked = false
    end)
    
    self.soundFlag = false
    local pitch = 1.2 + math.random() * 0.5
    gSounds['jump']:stop()
    gSounds['jump']:setPitch(pitch)
    gSounds['jump']:setVolume(0.9)
    gSounds['jump']:play()
end

local function checkGoalTile(tile)
    return tile and tile ~= 0 and tile.type == 'goal'
end
local function checkPitTile(tile)
    return tile and tile ~= 0 and tile.type == 'pit'
end

function PlayerWallJumpState:update(dt)
    Timer.update(dt)
    local keyLeft = love.keyboard.isDown('left')
    local keyRight = love.keyboard.isDown('right')
    
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
    if keyLeft and keyRight then
        
    elseif keyLeft and self.canMove and self.direction == 'left' then 
        self.player.dx = self.player.dx - 300 * dt
        if self.player.dx < 0 then 
            self.player.currentTexture = gTextures['testWJumpRight']
            self.direction = 'right'
        end 
    elseif keyLeft and self.canMove and self.direction == 'right' then 
        self.player.dx = self.player.dx - 300 * dt
        if self.player.dx < -XFORCE then 
            self.player.dx = -XFORCE
        end
    

    elseif keyRight and self.canMove and self.direction == 'right' then 
        self.player.dx = self.player.dx + 300 * dt
        if self.player.dx < 0 then 
            self.player.currentTexture = gTextures['testWJumpLeft']
            self.direction = 'left'
        end 
    elseif keyRight and self.canMove and self.direction == 'left' then 
        self.player.dx = self.player.dx + 300 * dt
        if self.player.dx > XFORCE then 
            self.player.dx = XFORCE
        end
    end
        
    --------sides collision 
    local leftX = self.player.x - 1
    local rightX = self.player.x + self.player.width + 1

    local topY = self.player.y + 4
    local middleY = self.player.y + 5
    local bottomY = self.player.y + self.player.height - 1

    local leftCol = math.floor(leftX / TILE_SIZE) + 1
    local rightCol = math.floor(rightX / TILE_SIZE) + 1

    local topRow = math.floor(topY / TILE_SIZE) + 1
    local midRow = math.floor(middleY / TILE_SIZE) + 1
    local botRow = math.floor(bottomY / TILE_SIZE) + 1

    if self.player.dx > 0 then -- moving RIGHT → check RIGHT wall
        local topTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][rightCol]
        local midTile = self.player.tileMap[midRow] and self.player.tileMap[midRow][rightCol]
        local botTile = self.player.tileMap[botRow] and self.player.tileMap[botRow][rightCol]

        if (topTile and topTile ~= 0 and topTile.solid) or
        (midTile and midTile ~= 0 and midTile.solid) or
        (botTile and botTile ~= 0 and botTile.solid) then

            self.player.dx = 0
            self.player.x = (rightCol - 1) * TILE_SIZE - self.player.width
            if self.player.direction == 'left' then
                self.player.direction = 'right'
            end
            self.player.stateMachine:change('sliding', 'right')
            return
        end

        if checkGoalTile(topTile) or checkGoalTile(midTile) or checkGoalTile(botTile) then
            self.player:reachGoal()
        end
    end

    if self.player.dx < 0 then -- moving LEFT → check LEFT wall
        local topTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][leftCol]
        local midTile = self.player.tileMap[midRow] and self.player.tileMap[midRow][leftCol]
        local botTile = self.player.tileMap[botRow] and self.player.tileMap[botRow][leftCol]

        if (topTile and topTile ~= 0 and topTile.solid) or
        (midTile and midTile ~= 0 and midTile.solid) or
        (botTile and botTile ~= 0 and botTile.solid) then

            self.player.dx = 0
            self.player.x = (leftCol) * TILE_SIZE
            if self.player.direction == 'right' then
                self.player.direction = 'left'
            end
            self.player.stateMachine:change('sliding', 'left')
            return
        end

        if checkGoalTile(topTile) or checkGoalTile(midTile) or checkGoalTile(botTile) then
            self.player:reachGoal()
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
    if checkPitTile(bottomLeftTile2) or checkPitTile(bottomCenterTile2) or checkPitTile(bottomRightTile2) then
        self.player:reachPit()
    end


    -------- Top collision
    local leftX = self.player.x - 1
    local rightX = self.player.x + self.player.width + 1
    local topY = self.player.y + 3

    local leftCol = math.floor(leftX / TILE_SIZE) + 1
    local rightCol = math.floor(rightX / TILE_SIZE) + 1
    local topRow = math.floor(topY / TILE_SIZE) + 1

    local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][leftCol]
    local topRightTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][rightCol]

    if (topLeftTile and topLeftTile.solid) or
    (topRightTile and topRightTile.solid) then
        -- stop upward movement
        if self.player.dy < 0 then
            self.player.dy = 0
        end   
    end
end

function PlayerWallJumpState:render()
    --Debug text
    -- local debugText = "dx: "
    -- love.graphics.print(debugText .. tostring(self.player.dx), 10, 60)

end