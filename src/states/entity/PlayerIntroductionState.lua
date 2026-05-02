PlayerIntroductionState = Class{__includes = BaseState}

function PlayerIntroductionState:init(player)
    self.player = player
    self.currentLevel = player.currentLevel
    self.introDirection = player.introDirection
end

function PlayerIntroductionState:enter()
    self.player.enteredRoom = true
    self.playerXStart = self.player.x
    self.playerYStart = self.player.y
    self.player.directionLocked = true

    if self.introDirection == "right" then
        self.playerXEnd = self.playerXStart + (TILE_SIZE * 4)
        self.player.direction = 'right'
        self.player.currentAnimation = self.player.walkAnimation
    elseif self.introDirection == "down" then 
        self.player.direction = 'right'
        self.player.currentAnimation = self.player.fallAnimation
        self.playerYEnd = self.playerYStart + (TILE_SIZE * 6)
    end
    self.soundFlag = false
    self.stepTimer = 0
    self.stepInterval = 0.3
end

function PlayerIntroductionState:update(dt)
    if self.introDirection == 'right' then 
        self.player.dx = 70
        
        if self.player.x >= self.playerXEnd then
            self.player.directionLocked = false
            self.player.stateMachine:change('idle')
        end
    elseif self.introDirection == 'down' then
        self.player.dy = FALL_SPEED
        if self.player.y >= self.playerYEnd then
            self.player.directionLocked = false
            self.player.stateMachine:change('falling')
            self.player.dy = FALL_SPEED
        end
    end

    --sound loop
    if self.introDirection ~= "down" then
        self.stepTimer = self.stepTimer - dt
        if self.stepTimer <= 0 then
            self.stepTimer = self.stepInterval
            Sound.playSFX("step", {
                pitch = math.random(90, 120) / 100,
                volume = 1
            })
        end
    end
    if self.introDirection == "down" then
        self.stepTimer = 0 
    end
end

function PlayerIntroductionState:render()
end