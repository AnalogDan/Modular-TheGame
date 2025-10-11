Animation = Class{}

function Animation:init(frames, interval)
    self.frames = frames       
    self.interval = interval   
    self.timer = 0
    self.currentFrame = 1
end

function Animation:update(dt)
    self.timer = self.timer + dt
    if self.timer >= self.interval then
        self.timer = self.timer - self.interval
        self.currentFrame = self.currentFrame % #self.frames + 1
    end
end

function Animation:getFrame()
    return self.frames[self.currentFrame]
end