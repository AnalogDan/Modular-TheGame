SystemSand = {}

function SystemSand.init(self)
    self.leaves = {}
    self.completeMapWidth = self.totalMapWidth * 8
    self.maxLeaves = 300 * (self.completeMapWidth / VIRTUAL_WIDTH)
    for i = 1, self.maxLeaves do
        SystemSand.spawnLeaf(self)
    end
end

function SystemSand.spawnLeaf(self)
    local frameSet = gFrames['sand']
    local randomQuad = frameSet[math.random(#frameSet)]
    local wind = -30

    local leaf = {
        texture = gTextures['sand'],
        quad = randomQuad,

        x = math.random(0, self.completeMapWidth),
        y = math.random(-50, VIRTUAL_HEIGHT),

        speedY = math.random(20, 40),   -- falling speed
        speedX = wind + math.random(-5, 5),  -- wind drift

        rotation = math.random() * math.pi,
        rotationSpeed = (math.random() - 0.5) * 2,
        scale = math.random(4, 5) / 10
    }
    leaf.speedY = leaf.speedY * leaf.scale
    table.insert(self.leaves, leaf)
end

function SystemSand.update(self, dt)
    for _, leaf in ipairs(self.leaves) do
        leaf.y = leaf.y + leaf.speedY * dt
        leaf.x = leaf.x + leaf.speedX * dt

        leaf.rotation = leaf.rotation + leaf.rotationSpeed * dt

        -- reset when off screen
        if leaf.y > VIRTUAL_HEIGHT + 10 or leaf.x < -20 then
            -- randomly decide spawn source
            if math.random() < 0.5 then
                -- spawn from TOP
                leaf.y = math.random(-50, -10)
                leaf.x = math.random(0, self.completeMapWidth)
            else
                -- spawn from RIGHT EDGE
                leaf.y = math.random(0, VIRTUAL_HEIGHT)
                leaf.x = self.completeMapWidth + math.random(0, 20)
            end
        end
    end
end

function SystemSand.render(self)
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