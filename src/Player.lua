Player = Class{__includes = BaseState}
Player = Class{__includes = Entity}

function Player:init(x, y, tileMap, currentLevel, nextLevel, nextTransition, introDirection)
    self.introDirection = introDirection or 'right'
    self.idleAnimation = Animation(gFrames['idleSheet'], 0.2)
    self.walkAnimation = Animation(gFrames['walkSheet'], 0.1)
    self.fallAnimation = Animation(gFrames['fallSheet'], 0.05, false)
    self.jumpAnimation = Animation(gFrames['jumpSheet'], 0.05, false)
    self.slideAnimation = Animation(gFrames['slideSheet'], 0.5)
    self.wJumpAnimation = Animation(gFrames['wJumpSheet'], 0.1, false)
    self.rootDeathAnimation = Animation(gFrames['rootDeathSheet'], 0.1, false)
    self.currentAnimation = self.wJumpAnimation
    self.animTextures = {
        [self.idleAnimation] = gTextures['idleSheet'],
        [self.walkAnimation] = gTextures['walkSheet'],
        [self.fallAnimation] = gTextures['fallSheet'],
        [self.jumpAnimation] = gTextures['jumpSheet'],
        [self.slideAnimation] = gTextures['slideSheet'],
        [self.wJumpAnimation] = gTextures['wJumpSheet'],
        [self.rootDeathAnimation] = gTextures['rootDeathSheet'],
    }
    self.direction  = "right"
    self.directionLocked = false
    
    self.tileMap = tileMap
    self.hitWidth = 7
    self.hitHeight = 7
    self.x = x
    self.y = y
    self.hitX = x + 1.5
    self.hitY = y + 1.5
    Entity.init(self, x, y, 10, 10)
    self.stateMachine = StateMachine {
        ['idle'] = function() return PlayerIdleState(self) end,
        ['walking'] = function() return PlayerWalkingState(self) end,
        ['falling'] = function() return PlayerFallingState(self) end,
        ['jumping'] = function() return PlayerJumpingState(self) end,
        ['sliding'] = function() return PlayerSlidingState(self) end,
        ['wallJump'] = function() return PlayerWallJumpState(self) end,
        ['introduction'] = function() return PlayerIntroductionState(self) end,
        ['dead'] = function() return PlayerDeadState(self) end,
        ['dialogue'] = function() return PlayerDialogueState(self) end
    }
    self.stateString = "alive"
    self.currentLevel = currentLevel or "game"
    self.nextLevel = nextLevel or "game"
    self.nextTransition = nextTransition or nil

    self.slidingDirection = ""
    self.coyoteTime = 0
    self.coyoteMax = 0.15
    self.jumpBufferTime = 0
    self.jumpBufferMax = 0.15
    self.pickedApple = false
    self.touchedTrigger = false
    self.prevCanControl = true
    self.canControl = true
    self.enteredRoom = false
    self.stateMachine:change('introduction')
end

function Player:reachGoal()
    SystemTransition.start('cover', function()
        if self.nextTransition then
            gStateMachine:change(self.nextTransition.state, self.nextTransition.params)
        else
            gStateMachine:change(self.nextLevel)
        end
    end)
end
function Player:reachPit()
    SystemTransition.start('cover', function()
        gStateMachine:change(self.currentLevel)
    end)
end

function Player:gotHit()
    self.stateMachine:change('dead')
end

function Player:update(dt)
    --freeze when on transitions
    if SystemTransition.active then
        self.dx = 0
        self.dy = 0
        return
    end

    local keyLeft = love.keyboard.isDown('left')
    local keyRight = love.keyboard.isDown('right')
    
    self.stateMachine:update(dt)

    -- update position based on velocity
    Entity.update(self, dt)

    self.hitX = self.x + 1.5
    self.hitY = self.y + 1.5
    self.currentAnimation:update(dt)

    if keyRight and keyLeft then
    elseif keyRight and self.canControl and not self.directionLocked then
        self.direction = 'right'
    elseif keyLeft and self.canControl and not self.directionLocked then
        self.direction = 'left'
    end

    --Override controls when on dialogue 
    if self.canControl ~= self.prevCanControl then
        if not self.canControl then
            self.stateMachine:change('dialogue')
        else
            self.stateMachine:change('falling') 
        end

        self.prevCanControl = self.canControl
    end

    --If collided with trigger
    if self:collidesWithType('trigger') then
        self.touchedTrigger = true
    end

    --Jumping input buffer
    if love.keyboard.wasPressed('space') then
        self.jumpBufferTime = self.jumpBufferMax
    end
    if self.jumpBufferTime > 0 then
        self.jumpBufferTime = self.jumpBufferTime - dt
    end

    --Coyote time
    if self.coyoteTime > 0 then
        self.coyoteTime = self.coyoteTime - dt
    end

end

--Function to know you collided with certain tile
function Player:collidesWithType(type)
    local tileSize = 8

    local leftTile   = math.floor(self.hitX / tileSize) + 1
    local rightTile  = math.floor((self.hitX + self.hitWidth) / tileSize) + 1
    local topTile    = math.floor(self.hitY / tileSize) + 1
    local bottomTile = math.floor((self.hitY + self.hitHeight) / tileSize) + 1

    for y = topTile, bottomTile do
        if self.tileMap[y] then
            for x = leftTile, rightTile do
                local tile = self.tileMap[y][x]

                if tile and tile.type == type then
                    return true, tile
                end
            end
        end
    end

    return false
end

function Player:render()
    
    local texture = self.animTextures[self.currentAnimation]
    local frame = self.currentAnimation:getFrame()

    local scaleX = 1
    local offsetX = 0
    if self.direction == 'left' then
        scaleX = -1
        offsetX = 10 
    end
    love.graphics.draw(
        texture,
        frame,
        self.x + offsetX,
        self.y,
        0,        
        scaleX,    
        1          
    )
    self.stateMachine.current:render()

    --Debug text
    -- local debugText = "Debug1: "
    -- love.graphics.print(debugText .. tostring(self.debug1), 10, 20)


    -- ----Draw hitbox 
    -- love.graphics.setColor(1, 0, 0)
    -- love.graphics.setLineWidth(1)
    -- love.graphics.rectangle("line", self.hitX, self.hitY, self.hitWidth, self.hitHeight)
    -- love.graphics.setColor(1, 1, 1)
end