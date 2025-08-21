PlayerFallingState = Class{__includes = BaseState}

local FALL_SPEED = 30 
local WALK_SPEED = 60

function PlayerFallingState:init(player)
    self.player = player
    self.gravity = 20 
end

function PlayerFallingState:enter()
    -- Stop horizontal movement unless keys are pressed
    self.player.dx = 0
end

function PlayerFallingState:update(dt)
    self.player.dy = FALL_SPEED

    if love.keyboard.isDown('left') then
        self.player.dx = -WALK_SPEED
    elseif love.keyboard.isDown('right') then
        self.player.dx = WALK_SPEED
    else
        self.player.dx = 0
    end

    -- Calculate the tile the player’s feet would touch
    local feetX = math.floor((self.player.x + self.player.width / 2) / TILE_SIZE) + 1
    local feetY = math.floor((self.player.y + self.player.height) / TILE_SIZE) + 1

    -- Check if that tile exists and is solid
    if self.player.tileMap[feetY] and self.player.tileMap[feetY][feetX] == 1 then
        -- Land on tile: stop falling and align to tile
        self.player.dy = 0
        self.player.y = (feetY - 1) * TILE_SIZE - self.player.height

        -- Switch to idle or walking state
        self.player.stateMachine:change('idle')
    end
end

function PlayerFallingState:render()
end