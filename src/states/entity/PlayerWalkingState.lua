PlayerWalkingState = Class{__includes = BaseState}

local WALKING_SPEED = 60

function PlayerWalkingState:init(player)
    self.player = player
end

function PlayerWalkingState:enter()
    self.player.currentAnimation = self.player.walkAnimation
    self.player.currentAnimation:reset()
end

local function checkGoalTile(tile)
    return tile and tile ~= 0 and tile.type == 'goal'
end

function PlayerWalkingState:update(dt)
    local topLeftX = self.player.x - 1
    local topLeftY = self.player.y
    local bottomLeftY = self.player.y + self.player.height - 1
    local topRightX = self.player.x + self.player.width + 1

    local topLeftCol = math.floor(topLeftX / TILE_SIZE) + 1
    local topRightCol = math.floor(topRightX / TILE_SIZE) + 1

    local topRow = math.floor(topLeftY / TILE_SIZE) + 1
    local bottomRow = math.floor(bottomLeftY / TILE_SIZE) + 1

    if love.keyboard.isDown('left') then
        self.player.dx = -WALKING_SPEED

        local topLeftTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topLeftCol]
        local bottomLeftTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][topLeftCol]

        if (topLeftTile ~= 0 and topLeftTile and topLeftTile.solid) or
        (bottomLeftTile ~= 0 and bottomLeftTile and bottomLeftTile.solid) then
            self.player.dx = 0
            self.player.x = (topLeftCol) * TILE_SIZE
        end
    elseif love.keyboard.isDown('right') then
        self.player.dx = WALKING_SPEED
        local topRightTile = self.player.tileMap[topRow] and self.player.tileMap[topRow][topRightCol]
        local bottomRightTile = self.player.tileMap[bottomRow] and self.player.tileMap[bottomRow][topRightCol]

        if (topRightTile ~= 0 and topRightTile and topRightTile.solid) or
        (bottomRightTile ~= 0 and bottomRightTile and bottomRightTile.solid) then
            self.player.dx = 0
            self.player.x = (topRightCol - 1) * TILE_SIZE - self.player.width
        end
    else
        self.player.stateMachine:change('idle')
        self.player.dx = 0
    end

    -- -----------Check bottom collisions
    -- local bottomLeftX2 = self.player.x
    -- local bottomLeftY2 = self.player.y + self.player.height + 1
    -- local bottomRightX2 = self.player.x + self.player.width

    -- local bottomLeftCol2 = math.floor(bottomLeftX2 / TILE_SIZE) + 1
    -- local bottomRightCol2 = math.floor(bottomRightX2 / TILE_SIZE) + 1
    -- local bottomRow2 = math.floor(bottomLeftY2 / TILE_SIZE) + 1  

    -- local bottomLeftTile2 = self.player.tileMap[bottomRow2] and self.player.tileMap[bottomRow2][bottomLeftCol2]
    -- local bottomRightTile2 = self.player.tileMap[bottomRow2] and self.player.tileMap[bottomRow2][bottomRightCol2]

    -- local leftSolid2 = bottomLeftTile2 and bottomLeftTile2 ~= 0 and bottomLeftTile2.solid
    -- local rightSolid2 = bottomRightTile2 and bottomRightTile2 ~= 0 and bottomRightTile2.solid

    -- if not leftSolid2 and not rightSolid2 then
    --     self.player.stateMachine:change('falling')
    -- end

    ---------Check bottom collision
    local bottomLeftX2  = self.player.x
    local bottomCenterX2 = self.player.x + (self.player.width/2)
    local bottomRightX2 = self.player.x + self.player.width - 1

    local bottomY2 = self.player.y + self.player.height + 1

    local bottomLeftCol2  = math.floor(bottomLeftX2 / TILE_SIZE) + 1
    local bottomCenterCol2 = math.floor(bottomCenterX2 / TILE_SIZE) + 1
    local bottomRightCol2 = math.floor(bottomRightX2 / TILE_SIZE) + 1
    local bottomYRow2      = math.floor(bottomY2 / TILE_SIZE) + 1

    local bottomLeftTile2  = self.player.tileMap[bottomYRow2] and self.player.tileMap[bottomYRow2][bottomLeftCol2]
    local bottomCenterTile2 = self.player.tileMap[bottomYRow2] and self.player.tileMap[bottomYRow2][bottomCenterCol2]
    local bottomRightTile2 = self.player.tileMap[bottomYRow2] and self.player.tileMap[bottomYRow2][bottomRightCol2]

    local isOnGround = false

    for _, tile in ipairs({bottomLeftTile2, bottomCenterTile2, bottomRightTile2}) do
        if tile and tile ~= 0 and tile.solid then
            isOnGround = true
            break
        end
    end

    if not isOnGround then
        self.player.stateMachine:change('falling')
    end

    if love.keyboard.wasPressed('space') then
        self.player.stateMachine:change('jumping')
    end

    if checkGoalTile(bottomLeftTile2) or checkGoalTile(bottomRightTile2) then
        self.player:reachGoal()
    end
end

function PlayerWalkingState:render()
    -- optional for now, can reuse idle render
end