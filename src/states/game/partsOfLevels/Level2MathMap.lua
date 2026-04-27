Level2MathMap = {}

function Level2MathMap.generate(self)
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

    --goal
    for y = 3, 11 do
        for x = 33, 33 do
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
    for y = 9, 10 do
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
    --trigger
    for y = 3, 10 do
        for x = 15, 15 do
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

    --1
    for y = 1, 1 do
        for x = 1, 9 do
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
    for y = 2, 2 do
        for x = 1, 8 do
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
    for y = 3, 3 do
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
    --4
    for y = 4, 4 do
        for x = 1, 6 do
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
    for y = 5, 5 do
        for x = 1, 5 do
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
    for y = 6, 6 do
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
    --7
    for y = 7, 7 do
        for x = 1, 3 do
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
    for y = 8, 8 do
        for x = 1, 2 do
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
    for y = 11, 11 do
        for x = 1, 3 do
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
    for y = 12, 18 do
        for x = 1, 32 do
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
    local y = 11
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 8
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 7
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 6
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 5
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 4
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 3
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 2
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 1
    local x = 9
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- Edge inner corners
    --1
    local y = 12
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 7
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 6
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 5
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 4
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 3
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 2
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 1
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 11, 11 do
        for x = 1, 2 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 12, 12 do
        for x = 4, 32 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 8, 8 do
        for x = 1, 1 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --1
    for y = 12, 12 do
        for x = 1, 2 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 13, 13 do
        for x = 2, 32 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 7, 7 do
        for x = 1, 1 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 6, 6 do
        for x = 1, 2 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 5, 5 do
        for x = 2, 3 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 4, 4 do
        for x = 3, 4 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 3, 3 do
        for x = 4, 5 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 2, 2 do
        for x = 5, 6 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 1, 1 do
        for x = 6, 7 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
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

    --1
    local y = 11
    for x = 6, 7 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps1'],
            quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --2
    for x = 10, 12 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps1'],
            quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --3
    for x = 19, 23 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps1'],
            quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --4
    for x = 26, 32 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps1'],
            quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
end

function Level2MathMap:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level2MathMap.renderBeforeCamera(self)
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

function Level2MathMap.render(self)
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

function Level2MathMap.renderAfterPlayer(self)
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