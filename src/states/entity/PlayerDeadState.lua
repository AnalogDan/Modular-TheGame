PlayerDeadState = Class{__includes = BaseState}

function PlayerDeadState:init(player)
    self.player = player
    self.currentLevel = player.currentLevel
end

function PlayerDeadState:enter()
    self.player.directionLocked = true
    self.player.dx = 0 
    self.player.dy = FALL_SPEED - 30
    self.player.currentAnimation = self.player.rootDeathAnimation
    self.player.currentAnimation:reset()
    self.player.stateString = "dead"
    self.timer = 0
    self.transitionStarted = false

    gSounds['electric']:setVolume(1)
    gSounds['electric']:play()
end

function PlayerDeadState:update(dt)
    self.timer = self.timer + dt
    if self.timer > 2.5 and not self.transitionStarted then
        self.transitionStarted = true 
        self.player.directionLocked = false

        SystemTransition.start('cover', function()
            gStateMachine:change(self.currentLevel)
        end)
        return
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
    end
    
end

function PlayerDeadState:render()
end