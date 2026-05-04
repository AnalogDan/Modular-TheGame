Level10Map = {}

function Level10Map.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)
    self.bgArt = gTextures['bgArt10']

    ----Create background 
    self.backgroundTileMap = {}
    local bgWidth = 2
    local bgHeight = 1
    local bgTileSize = 256
    for y = 1, bgHeight do
        self.backgroundTileMap[y] = {}
        for x = 1, bgWidth do
            self.backgroundTileMap[y][x] = {
                type = 'background',
                solid = false,
                texture = gTextures['backgroundTile3'],
                x = (x - 1) * bgTileSize,
                y = (y - 1) * bgTileSize
            }
        end
    end

    ----Create empty grayboxing canvas
    self.tileMap = {}
    self.totalMapWidth = 32
    local mapHeight = 19
    local tileSize = 8
    for y = 1, mapHeight do
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

    --trigger
    for y = 7, 15 do
        for x = 17, 17 do
            self.tileMap[y][x] = {
                type = 'trigger',
                solid = false,
                --texture = gTextures['triggerTile'],
                quad = nil,
                x = ((x - 1) * tileSize),
                y = (y - 1) * tileSize,
            }
        end
    end
    --entrance
    for y = 12, 13 do
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

    --1
    for y = 1, 2 do
        for x = 1, 32 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile3'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 3, 11 do
        for x = 1, 2 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile3'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 14, 18 do
        for x = 1, 3 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile3'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 16, 18 do
        for x = 4, 32 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile3'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 3, 15 do
        for x = 31, 32 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile3'],
                quad = nil,
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

    --Edge outer corners           
    --1
    local y = 14
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --2
    local y = 11
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 

    -- Edge inner corners
    --1
    local y = 16
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 16
    local x = 31
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 2
    local x = 31
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y =2
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 14, 14 do
        for x = 1, 2 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 15, 15 do
        for x = 3, 3 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 16, 16 do
        for x = 4, 30 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 3, 15 do
        for x = 31, 31 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 2, 2 do
        for x = 3, 30 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 3, 10 do
        for x = 2, 2 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 11, 11 do
        for x = 1, 1 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --1
    for y = 1, 10 do
        for x = 1, 1 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 1, 1 do
        for x = 2, 32 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 2, 17 do
        for x = 32, 32 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 17, 17 do
        for x = 2, 31 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 16, 16 do
        for x = 2, 2 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 15, 15 do
        for x = 1, 2 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
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

function Level10Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level10Map.renderBeforeCamera(self)
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

function Level10Map.render(self)
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

function Level10Map.renderAfterPlayer(self)
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