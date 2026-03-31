EntranceState = Class{__includes = BaseState}

function EntranceState:init(entrance)
    self.entrance = entrance
    self.closed = false
    self.orientation = 'vertical'
end

function EntranceState:enter()
end

local function AABB(aX, aY, aW, aH, bX, bY, bW, bH)
    return aX < bX + bW and
           bX < aX + aW and
           aY < bY + bH and
           bY < aY + aH
end

function EntranceState:update(dt)
    local player = self.entrance.player
    if player.enteredRoom and not self.closed then
        -- play animation
        self.entrance.currentAnimation:setToLastFrame()
        self.closed = true
        self.entrance.currentAnimation:playBackward()
        self.entrance.useAnimation = true
    end
end

function EntranceState:render()
    if self.orientation == 'horizontal' then
        local anim = self.entrance.currentAnimation
        local texture = self.entrance.animTextures[anim]
        local frame = anim:getFrame()
        local x = self.entrance.x
        local y = self.entrance.y
        local _, _, w, h = frame:getViewport()
        love.graphics.draw(
            texture,
            frame,
            x, y + w,          -- 👈 compensate here
            -math.pi / 2,
            1, 1,
            0, 0
        )
    else 
        local texture = self.entrance.animTextures[self.entrance.currentAnimation]
        local frame
        frame = self.entrance.currentAnimation:getFrame()
        local scaleX = 1
        local offsetX = 0
        love.graphics.draw(
            texture,
            frame,
            self.entrance.x + offsetX,
            self.entrance.y,
            0,        
            scaleX,    
            1          
        )
    end
end