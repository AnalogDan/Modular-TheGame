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


    --Move to sides and initiate sliding
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

    if checkGoalTile(bottomLeftTile2) or checkGoalTile(bottomRightTile2) then
        self.player:reachGoal()
    end
end

function PlayerFallingState:render()
end