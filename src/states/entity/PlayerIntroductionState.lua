PlayerIntroductionState = Class{__includes = BaseState}

function PlayerIntroductionState:init(player)
    self.player = player
    self.currentLevel = player.currentLevel
    self.introDirection = player.introDirection
end

function PlayerIntroductionState:enter()
    self.playerXStart = self.player.x
    self.playerYStart = self.player.y
    self.playerXEnd = self.playerXStart + (TILE_SIZE * 4)
    self.player.currentAnimation = self.player.walkAnimation
end

function PlayerIntroductionState:update(dt)
    if self.introDirection == 'right' then 
        self.player.dx = 70
        self.player.direction = 'right'
        if self.player.x >= self.playerXEnd then
            self.player.stateMachine:change('idle')
        end
    end
end

function PlayerIntroductionState:render()
end