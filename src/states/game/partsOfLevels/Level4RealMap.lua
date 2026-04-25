Level4RealMap = {}

function Level4RealMap.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)
    self.bgArt = gTextures['bgArt1']

    ----Create background 
    self.backgroundTileMap = {}
    local bgWidth = 26
    local bgHeight = 15
    local bgTileSize = 10
    for y = 1, bgHeight do
        self.backgroundTileMap[y] = {}
        for x = 1, bgWidth do
            self.backgroundTileMap[y][x] = {
                type = 'background',
                solid = false,
                texture = gTextures['backgroundTile1'],
                x = (x - 1) * bgTileSize,
                y = (y - 1) * bgTileSize
            }
        end
    end

    ----Create empty grayboxing canvas
    self.tileMap = {}
    self.totalMapWidth = 63
    local mapHeight = 19
    local tileSize = 8
    for y = -2, mapHeight do
        self.tileMap[y] = {}
        for x = 1, self.totalMapWidth do
            self.tileMap[y][x] = {
                type = 'empty',
                solid = false,
                texture = nil,
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize, 
            }
        end
    end

     --goal
    for y = 4, 11 do
        for x = 64, 64 do
            self.tileMap[y][x] = {
                type = 'goal',
                solid = false,
                texture = gTextures['testGoal'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --entrance
    for y = 1, 2 do
        for x = 1, 1 do
            self.tileMap[y][x] = {
                type = 'entrance',
                solid = true,
                --texture = gTextures['fillTile1'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --door
    for y = 7, 8 do
        for x = 42, 42 do
            self.tileMap[y][x] = {
                type = 'door',
                solid = true,
                quad = nil,
                x = ((x - 1) * tileSize),
                y = (y - 1) * tileSize,
            }
        end
    end
    --triggers
    for y = 1, 3 do
        for x = 5, 5 do
            self.tileMap[y][x] = {
                type = 'trigger',
                solid = false,
                texture = gTextures['triggerTile'],
                quad = nil,
                x = ((x - 1) * tileSize),
                y = (y - 1) * tileSize,
            }
        end
    end
    for y = 4, 11 do
        for x = 54, 54 do
            self.tileMap[y][x] = {
                type = 'trigger2',
                solid = false,
                texture = gTextures['triggerTile'],
                quad = nil,
                x = ((x - 1) * tileSize),
                y = (y - 1) * tileSize,
            }
        end
    end


    --Grayboxing
    --0
    for y = -2, 0 do
        for x = 4, 4 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --1
    for y = 1, 1 do
        for x = 1, 4 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 4, 18 do
        for x = 1, 7 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 7, 18 do
        for x = 8, 9 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 17, 18 do
        for x = 10, 13 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 6, 18 do
        for x = 14, 16 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 3, 18 do
        for x = 17, 19 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 8, 18 do
        for x = 20, 23 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 17, 18 do
        for x = 24, 32 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 1, 2 do
        for x = 23, 28 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 1, 3 do
        for x = 29, 29 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 1, 14 do
        for x = 30, 30 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 1, 2 do
        for x = 31, 46 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 1, 1 do
        for x = 47, 47 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 3, 11 do
        for x = 31, 33 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 12, 12 do
        for x = 31, 32 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15.1
    for y = 3, 6 do
        for x = 39, 42 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 13, 13 do
        for x = 31, 31 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --17
    for y = 9, 9 do
        for x = 38, 42 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --18
    for y = 10, 10 do
        for x = 38, 43 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --19
    for y = 11, 11 do
        for x = 38, 44 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --20
    for y = 12, 15 do
        for x = 38, 63 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --21
    for y = 16, 16 do
        for x = 36, 63 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --22
    for y = 17, 18 do
        for x = 33, 63 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile1'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    --spikes
    --1
    for y = 7, 7 do
        for x = 20, 23 do
            local randomQuad = (gFrames['spikeSheet1'][math.random(#gFrames['spikeSheet1'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 8, 16 do
        for x = 24, 24 do
            local randomQuad = (gFrames['spikeSheet1Right'][math.random(#gFrames['spikeSheet1Right'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = -2, 2 do
        for x = 22, 22 do
            local randomQuad = (gFrames['spikeSheet1Left'][math.random(#gFrames['spikeSheet1Left'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 3, 3 do
        for x = 23, 28 do
            local randomQuad = (gFrames['spikeSheet1Down'][math.random(#gFrames['spikeSheet1Down'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 4, 14 do
        for x = 29, 29 do
            local randomQuad = (gFrames['spikeSheet1Left'][math.random(#gFrames['spikeSheet1Left'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 3, 3 do
        for x = 37, 38 do
            local randomQuad = (gFrames['spikeSheet1Down'][math.random(#gFrames['spikeSheet1Down'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 6, 7 do
        for x = 34, 34 do
            local randomQuad = (gFrames['spikeSheet1Right'][math.random(#gFrames['spikeSheet1Right'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 17, 17 do
        for x = 33, 35 do
            local randomQuad = (gFrames['spikeSheet1'][math.random(#gFrames['spikeSheet1'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end


    -----Decorate level
    -------Create empty decorative canvas
    self.decorativeTiles = {}
    local mapWidth = self.totalMapWidth
    local mapHeight = 19
    local tileSize = 8
    for y = 1, mapHeight do
        self.decorativeTiles[y] = {}
        for x = 1, mapWidth do
            self.decorativeTiles[y][x] = {
                texture = nil,
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize, 
            }
        end
    end

    --Foreground decoration
    ------Create empty fore-decorative canvas
    self.foreDecorativeTiles = {}
    local mapWidth = self.totalMapWidth
    local mapHeight = 22
    local tileSize = 8
    for y = 1, mapHeight do
        self.foreDecorativeTiles[y] = {}
        for x = 1, mapWidth do
            self.foreDecorativeTiles[y][x] = {
                texture = nil,
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize, 
            }
        end
    end
end

function Level4RealMap:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level4RealMap.renderBeforeCamera(self)
    --draw bg tileMap
    for y = 1, #self.backgroundTileMap do
        for x = 1, #self.backgroundTileMap[y] do
            local tile = self.backgroundTileMap[y][x]
            if tile ~= 0 then
                love.graphics.draw(
                    tile.texture,
                    tile.x,
                    tile.y
                )
            end
        end
    end
end

function Level4RealMap.render(self)
    --draw bg Art
    love.graphics.draw(self.bgArt, 0, 0)
     
    --draw graybox tileMap
    for y, row in pairs(self.tileMap) do
        for x, tile in pairs(row) do
            if tile and tile.texture then
                if tile.quad then
                    love.graphics.draw(tile.texture, tile.quad, tile.x, tile.y)
                else
                    love.graphics.draw(tile.texture, tile.x, tile.y)
                end
            end
        end
    end

    ----draw decorative tiles
    for y, row in ipairs(self.decorativeTiles) do
        for x, tile in ipairs(row) do
            if tile and tile.texture then
                if tile.quad then
                    love.graphics.draw(tile.texture, tile.quad, tile.x, tile.y)
                else
                    love.graphics.draw(tile.texture, tile.x, tile.y)
                end
            end
        end
    end
end

function Level4RealMap.renderAfterPlayer(self)
    --draw fore-decorative tiles
    for y, row in ipairs(self.foreDecorativeTiles) do
        for x, tile in ipairs(row) do
            if tile and tile.texture then
                if tile.quad then
                    love.graphics.draw(tile.texture, tile.quad, tile.x, tile.y)
                else
                    love.graphics.draw(tile.texture, tile.x, tile.y)
                end
            end
        end
    end
end