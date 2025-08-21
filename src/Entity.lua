Entity = Class{}

function Entity:init(x, y, width, height)
    self.x = x or 0
    self.y = y or 0
    self.width = width or 16
    self.height = height or 16

    self.dx = 0
    self.dy = 0
end

function Entity:update(dt)
    -- Apply velocity to position
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Entity:render(texture)
    -- Draw with optional texture
    if texture then
        love.graphics.draw(texture, self.x, self.y)
    else
        -- fallback: simple rectangle
        love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    end
end