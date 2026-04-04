SystemLeaves = {}

function SystemLeaves.init(self)
    self.leaves = {}
    self.completeMapWidth = self.totalMapWidth * 8
    self.maxLeaves = 40 * (self.completeMapWidth / VIRTUAL_WIDTH)
    for i = 1, self.maxLeaves do
        SystemLeaves.spawnLeaf(self)
    end
end

function SystemLeaves.spawnLeaf(self)
    local frameSet = gFrames['leaves']
    local randomQuad = frameSet[math.random(#frameSet)]

    local leaf = {
        texture = gTextures['leaves'],
        quad = randomQuad,

        x = math.random(0, self.completeMapWidth),
        y = math.random(-50, VIRTUAL_HEIGHT),

        speedY = math.random(20, 40),   -- falling speed
        speedX = math.random(-10, 10),  -- wind drift

        rotation = math.random() * math.pi,
        rotationSpeed = (math.random() - 0.5) * 2,
        scale = math.random(4, 5) / 10
    }
    leaf.speedY = leaf.speedY * leaf.scale
    table.insert(self.leaves, leaf)
end

function SystemLeaves.update(self, dt)
    for _, leaf in ipairs(self.leaves) do
        leaf.y = leaf.y + leaf.speedY * dt
        leaf.x = leaf.x + math.sin(love.timer.getTime() + leaf.y * 0.1) * 10 * dt

        leaf.rotation = leaf.rotation + leaf.rotationSpeed * dt

        -- reset when off screen
        if leaf.y > VIRTUAL_HEIGHT + 5 then
            leaf.y = math.random(-50, -10)
            leaf.x = math.random(0, self.completeMapWidth)
        end
    end
end

function SystemLeaves.render(self)
    for _, leaf in ipairs(self.leaves) do
        love.graphics.draw(
            leaf.texture, 
            leaf.quad,
            leaf.x,
            leaf.y,
            leaf.rotation,
            leaf.scale,
            leaf.scale,
            3.5, 3.5  
        )
    end
end