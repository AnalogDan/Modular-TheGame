Animation = Class{}

function Animation:init(frames, interval, looping)
    self.looping = looping ~= false
    self.frames = frames       
    self.interval = interval   
    self.timer = 0
    self.currentFrame = 1
    self.direction = 1 -- 1 = forward, -1 = backward
end

function Animation:update(dt)
    self.timer = self.timer + dt

    if self.timer > self.interval then
        self.timer = self.timer % self.interval

        self.currentFrame = self.currentFrame + self.direction

        -- if direction is forward
        if self.direction == 1 then
            if self.currentFrame > #self.frames then
                if self.looping then
                    self.currentFrame = 1
                else
                    self.currentFrame = #self.frames
                end
            end

        -- if direction is backward
        elseif self.direction == -1 then
            if self.currentFrame < 1 then
                if self.looping then
                    self.currentFrame = #self.frames
                else
                    self.currentFrame = 1
                end
            end
        end
    end
end

--Functions to play forward or backward
function Animation:reset()
    self.timer = 0
    self.currentFrame = 1
end
function Animation:playForward()
    self.direction = 1
end

function Animation:setToLastFrame()
    self.currentFrame = #self.frames
    self.timer = 0
end
function Animation:playBackward()
    self.direction = -1
    self.currentFrame = #self.frames
end

function Animation:getFrame()
    return self.frames[self.currentFrame]
end