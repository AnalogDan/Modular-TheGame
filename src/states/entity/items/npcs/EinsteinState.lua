EinsteinState = Class{__includes = BaseState}

function EinsteinState:init(tales)
    self.tales = tales
    self.direction = "left"
end

function EinsteinState:enter()
end

local function AABB(aX, aY, aW, aH, bX, bY, bW, bH)
    return aX < bX + bW and
           bX < aX + aW and
           aY < bY + bH and
           bY < aY + aH
end

function EinsteinState:update(dt)
    local player = self.tales.player

    --Face player
    if player.x > self.tales.x then
        self.direction = 'right'
    else
        self.direction = 'left'
    end
end

function EinsteinState:render()
    local item = self.tales
    local texture = item.animTextures[item.currentAnimation]
    local frame
    if self.tales.useAnimation then
        frame = self.tales.currentAnimation:getFrame()
    else
        frame = self.tales.currentAnimation.frames[1] -- first quad
    end

    local scaleX = 1
    local offsetX = 0
    if self.direction == 'left' then
        scaleX = -1
        offsetX = 10 
    end
    love.graphics.draw(
        texture,
        frame,
        item.x + offsetX, 
        item.y - 5,          -- move 5 pixels up
        0,
        scaleX,               
        1
    )
end