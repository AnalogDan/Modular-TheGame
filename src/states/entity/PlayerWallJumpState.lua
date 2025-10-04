PlayerWallJumpState = Class{__includes = BaseState}

function PlayerWallJumpState:init(player)
    self.player = player
end

local XFORCE = 50
local YFORCE = -70

function PlayerWallJumpState:enter(direction)
    self.direction = direction
    if self.direction == 'left' then
        self.player.currentTexture = gTextures['testWJumpLeft']
        self.player.dx = XFORCE
    elseif self.direction == 'right' then
        self.player.currentTexture = gTextures['testWJumpRight']
        self.player.dx = -XFORCE
    end
    self.player.dy = -70
    self.player.falling = false
end

function PlayerWallJumpState:update(dt)
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
    if love.keyboard.isDown('left') then 
    end
        
end

function PlayerWallJumpState:render()
    love.graphics.print("yforce: " .. tostring(YFORCE), 10, 20)
end