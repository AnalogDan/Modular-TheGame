Camera = {}

function Camera:init()
    self.x = 0
    self.targetX = 0
    self.offset = 40 -- How far is the player from the center
    self.smoothing = 14 -- How fast the camera catches up to the intended position, higher number, more snappy
    self.direction = 1
    self.switchDelay = 0.6 -- How long walking the opposite direction before we invert offset
    self.timer = 0

    self.lookAhead = 0  --used to change directions smoothly      
    self.targetLookAhead = 0   
    self.lookAheadSmoothing = 3
end

function Camera:update(dt, player, levelWidth)
    -- Choose direction based on time moving
    if player.dx ~= 0 then
        local newDirection = player.dx > 0 and 1 or -1
        if newDirection ~= self.direction then
            self.timer = self.timer + dt
            if self.timer >= self.switchDelay then
                self.direction = newDirection
                self.timer = 0
            end
        else
            self.timer = 0
        end
    end

    -- Basic camera behavior 
    levelWidth = levelWidth * TILE_SIZE
    local screenCenter = VIRTUAL_WIDTH / 2
    self.targetLookAhead = self.offset * self.direction
    self.lookAhead = self.lookAhead + (self.targetLookAhead - self.lookAhead) * self.lookAheadSmoothing * dt

    self.targetX = player.x - screenCenter + self.lookAhead
    self.targetX = math.max(0, math.min(self.targetX, levelWidth - VIRTUAL_WIDTH))
    self.x = self.x + (self.targetX - self.x) * self.smoothing * dt
end

function Camera:apply()
    love.graphics.push()
    love.graphics.translate(-(self.x), 0)
end

function Camera:clear()
    love.graphics.pop()
end