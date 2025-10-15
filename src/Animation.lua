Animation = Class{}

function Animation:init(frames, interval, looping)
    self.looping = looping ~= false
    self.frames = frames       
    self.interval = interval   
    self.timer = 0
    self.currentFrame = 1
end

function Animation:reset()
    self.timer = 0
    self.currentFrame = 1
end

function Animation:update(dt)
    self.timer = self.timer + dt

    if self.timer > self.interval then
        self.timer = self.timer % self.interval

        if self.currentFrame == #self.frames then
            if self.looping then
                self.currentFrame = 1
            else
                -- stay on the last frame
                self.currentFrame = #self.frames
            end
        else
            self.currentFrame = self.currentFrame + 1
        end
    end
end

function Animation:getFrame()
    return self.frames[self.currentFrame]
end