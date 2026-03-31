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
    if not gSounds['step']:isPlaying() and not self.soundFlag and self.introDirection ~= "down" then
        self.soundFlag = true
    elseif not gSounds['step']:isPlaying() and self.soundFlag then
        self.soundFlag = false
    end
    if not self.soundFlag then 
        local pitch = 0.9 + math.random() * 0.5
        gSounds['step']:setPitch(pitch)
        gSounds['step']:setVolume(0.6)
        gSounds['step']:play()
    end
    if self.soundFlag then
        local pitch = 1 + math.random() * 0.3
        gSounds['step']:setPitch(pitch)
        gSounds['step']:setVolume(0.6)
        gSounds['step']:play()
    end
end

function PlayerIntroductionState:render()
end