FaceState = Class{__includes = BaseState}

function FaceState:init(tales)
    self.tales = tales
end

function FaceState:enter()
end

local function AABB(aX, aY, aW, aH, bX, bY, bW, bH)
    return aX < bX + bW and
           bX < aX + aW and
           aY < bY + bH and
           bY < aY + aH
end

function FaceState:update(dt)
    local player = self.tales.player
end

function FaceState:render()
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
    love.graphics.draw(
        texture,
        frame,
        item.x, 
        item.y,         
        0,
        scaleX,               
        1
    )
end