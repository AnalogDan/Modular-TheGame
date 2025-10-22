PlayerFallingState = Class{__includes = BaseState}

function PlayerFallingState:init(player)
    self.player = player
    self.gravity = 20 
    self.player.currentTexture = gTextures['testPlayer']
end

function PlayerFallingState:enter()
    self.player.currentAnimation = self.player.fallAnimation
    self.player.currentAnimation:reset()
    -- Stop horizontal movement unless keys are pressed
    self.player.dx = 0
    self.player.dy = 20
end

local function checkGoalTile(tile)
    return tile and tile ~= 0 and tile.type == 'goal'
end

function PlayerFallingState:update(dt)
    if self.player.dy < FALL_SPEED then 
        self.player.dy = self.player.dy + GRAVITY * dt
    else
        self.player.dy = FALL_SPEED
    end

    ----------Move to sides and initiate sliding  
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

    if love.keyboard.isDown('left') then
        self.player.dx = -WALK_SPEED
        local topLeftTile = self.player.tileMap[topYRow2] and self.player.tileMap[topYRow2][leftCol]
        local middleLeftTile = self.player.tileMap[middleYRow] and self.player.tileMap[middleYRow][leftCol]
        local bottomLeftTile = self.player.tileMap[bottomYRow] and self.player.tileMap[bottomYRow][leftCol]

        if middleLeftTile and middleLeftTile ~= 0 and middleLeftTile.solid then
            self.player.dx = 0
            self.player.x = (leftCol) * TILE_SIZE
            self.player.stateMachine:change('sliding', 'left')
        elseif (topLeftTile and topLeftTile ~= 0 and topLeftTile.solid) or
               (bottomLeftTile and bottomLeftTile ~= 0 and bottomLeftTile.solid)  then
            self.player.dx = 0
            self.player.x = (leftCol) * TILE_SIZE
        end
    elseif love.keyboard.isDown('right') then
        self.player.dx = WALK_SPEED
        local topRightTile = self.player.tileMap[topYRow2] and self.player.tileMap[topYRow2][rightCol]
        local middleRightTile = self.player.tileMap[middleYRow] and self.player.tileMap[middleYRow][rightCol]
        local bottomRightTile = self.player.tileMap[bottomYRow] and self.player.tileMap[bottomYRow][rightCol]

        if middleRightTile and middleRightTile ~= 0 and middleRightTile.solid then
            self.player.dx = 0
            self.player.x = (rightCol - 1) * TILE_SIZE - self.player.width
            self.player.stateMachine:change('sliding', 'right')
        elseif topRightTile and topRightTile ~= 0 and topRightTile.solid or 
               (bottomRightTile and bottomRightTile ~= 0 and bottomRightTile.solid)then
            self.player.dx = 0
            self.player.x = (rightCol - 1) * TILE_SIZE - self.player.width
        end
    else
        self.player.dx = 0
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
        self.player.stateMachine:change('idle')
    end

    

    if checkGoalTile(bottomLeftTile2) or checkGoalTile(bottomRightTile2) or checkGoalTile(bottomCenterTile2) then
        self.player:reachGoal()
    end
end

function PlayerFallingState:render()
    -- love.graphics.print("rightCol: " .. tostring(self.debug), 10, 20)
end