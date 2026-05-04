SystemFog = Class{}

-- For the love of god.SystemFog
-- I wish I never again in my entire life...
-- Have to touch this fucking disgusting fog code
-- ChatGPT should stick 500 clouds of fog up his fucking ass
-- Goddammit

function SystemFog:init(mapWidth)
    self.fogs = {}
    self.completeMapWidth = mapWidth + 600
    self.speed = -10 -- global wind (left)
    self.fogSpacing = 20  -- distance between fog chunks
    self.count = math.ceil(self.completeMapWidth / self.fogSpacing)

    self.seed = os.time()

    for i = 1, self.count do
        self:spawnFog(i)
    end
end

function SystemFog:rand(min, max)
    self.seed = (1103515245 * self.seed + 12345) % 2^31
    return min + (self.seed % (max - min + 1))
end

function SystemFog:spawnFog(index)
    local frameSet = gFrames['fog']
    local quad = frameSet[self:rand(1, #frameSet)]

    local baseX = (index - 1) * self.fogSpacing
    local jitter = self:rand(-30, 30)

    local fog = {
        texture = gTextures['fog'],
        quad = quad,

        x = baseX + jitter,
        y = self:rand(90, VIRTUAL_HEIGHT + 20),

        speedX = self.speed,

        scale = self:rand(10, 10) / 10, -- big fog
        alpha = self:rand(3, 5) / 100
    }

    table.insert(self.fogs, fog)
end

function SystemFog:update(dt)
    for _, fog in ipairs(self.fogs) do
        fog.x = fog.x + fog.speedX * dt

        

        -- LOOP instead of respawn
        if fog.x < -300 then
            local maxX = -math.huge

            for _, other in ipairs(self.fogs) do
                if other.x > maxX then
                    maxX = other.x
                end
            end

            fog.x = maxX + self.fogSpacing
            fog.y = self:rand(90, VIRTUAL_HEIGHT + 20)
        end
    end
end

function SystemFog:render()
    for _, fog in ipairs(self.fogs) do
        love.graphics.setColor(1, 1, 1, fog.alpha)

        local originX = (fog.width or 200) / 2
        local originY = (fog.height or 300) / 2
        love.graphics.draw(
            fog.texture,
            fog.quad,
            fog.x,
            fog.y,
            0,
            fog.scale,
            fog.scale,
            originX,
            originY
        )
    end

    love.graphics.setColor(1, 1, 1, 1)
end