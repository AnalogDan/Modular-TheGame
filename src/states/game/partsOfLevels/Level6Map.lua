Level6Map = {}

function Level6Map.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)
    self.bgArt = gTextures['bgArt6']

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
                texture = gTextures['backgroundTile2'],
                x = (x - 1) * bgTileSize,
                y = (y - 1) * bgTileSize
            }
        end
    end

    ----Create empty grayboxing canvas
    self.tileMap = {}
    self.totalMapWidth = 92
    local mapHeight = 22
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
    for y = 2, 9 do
        for x = 93, 93 do
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
    for y = 5, 6 do
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
    for y = 8, 9 do
        for x = 64, 64 do
            self.tileMap[y][x] = {
                type = 'door',
                solid = true,
                quad = nil,
                x = ((x - 1) * tileSize),
                y = (y - 1) * tileSize,
            }
        end
    end
    --trigger
    for y = 2, 9 do
        for x = 74, 74 do
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
    --pit
    for y = 20, 22 do
        for x = 1, 92 do
            self.tileMap[y][x] = {
                type = 'pit',
                solid = false,
                texture = gTextures['testGoal'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    --1
    for y = 1, 4 do
        for x = 1, 3 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 1, 1 do
        for x = 4, 7 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 1, 9 do
        for x = 8, 12 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 7, 18 do
        for x = 1, 5 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 15, 18 do
        for x = 6, 12 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 18, 18 do
        for x = 13, 17 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 15, 18 do
        for x = 18, 21 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 9, 14 do
        for x = 20, 21 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 6, 8 do
        for x = 17, 21 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 12, 12 do
        for x = 15, 17 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 1, 8 do
        for x = 25, 29 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 14, 14 do
        for x = 26, 28 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 14, 14 do
        for x = 34, 39 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 11, 12 do
        for x = 42, 43 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 11, 18 do
        for x = 44, 45 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 12, 15 do
        for x = 46, 50 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --17
    for y = 18, 18 do
        for x = 46, 60 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --18
    for y = 10, 18 do
        for x = 61, 92 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --19
    for y = 1, 15 do
        for x = 55, 56 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --20
    for y = 1, 6 do
        for x = 57, 63 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --21
    for y = 1, 7 do
        for x = 64, 64 do
            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['fillTile2'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    --spikes
    --1
    for y = 10, 10 do
        for x = 8, 12 do
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
    --2
    for y = 14, 14 do
        for x = 6, 12 do
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
    --3
    for y = 11, 14 do
        for x = 22, 22 do
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
    --4
    for y = 11, 11 do
        for x = 46, 50 do
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
    --5
    for y = 14, 15 do
        for x = 51, 51 do
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
    --6
    for y = 16, 17 do
        for x = 60, 60 do
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
    --7
    for y = 15, 15 do
        for x = 57, 57 do
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
    -- for y = 11, 11 do
    --     for x = 57, 57 do
    --         local randomQuad = (gFrames['spikeSheet1'][math.random(#gFrames['spikeSheet1'])])
    --         self.tileMap[y][x] = {
    --             type = 'spikes',
    --             solid = false,
    --             texture = gTextures['spikeSheet1'],
    --             quad = randomQuad,
    --             x = (x - 1) * tileSize,
    --             y = (y - 1) * tileSize,
    --         }
    --     end
    -- end
    --9
    for y = 7, 7 do
        for x = 61, 63 do
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
    --10
    for y = 1, 15 do
        for x = 54, 54 do
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

    --1st Zone
    --Edge outer corners           
    --1
    local y = 7
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --2
    local y = 15
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --3
    local y = 15
    local x = 18
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4
    local y = 8
    local x = 17
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --5
    local y = 6
    local x = 17
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --6
    local y = 6
    local x = 21
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --7
    local y = 4
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --8
    local y = 9
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --9
    local y = 9
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 

    -- Edge inner corners
    --1
    local y = 15
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 18
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 18
    local x = 18
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 15
    local x = 20
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 8
    local x = 20
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 1
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 1
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 7, 7 do
        for x = 1, 4 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --1.1
    for y = 8, 14 do
        for x = 5, 5 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 15, 15 do
        for x = 6, 11 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 16, 17 do
        for x = 12, 12 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 18, 18 do
        for x = 13, 17 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 16, 17 do
        for x = 18, 18 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 15, 15 do
        for x = 19, 19 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 9, 14 do
        for x = 20, 20 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 8, 8 do
        for x = 18, 19 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 7, 7 do
        for x = 17, 17 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 6, 6 do
        for x = 18, 20 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 7, 18 do
        for x = 21, 21 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 4, 4 do
        for x = 1, 2 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 2, 3 do
        for x = 3, 3 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 1, 1 do
        for x = 4, 7 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 2, 8 do
        for x = 8, 8 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 9, 9 do
        for x = 9, 11 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --17
    for y = 1, 8 do
        for x = 12, 12 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --1
    for y = 8, 8 do
        for x = 1, 4 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 9, 15 do
        for x = 4, 4 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 16, 16 do
        for x = 4, 11 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 17, 18 do
        for x = 11, 11 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 16, 18 do
        for x = 19, 20 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 7, 7 do
        for x = 18, 20 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 1, 3 do
        for x = 2, 2 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 1, 8 do
        for x = 9, 9 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 1, 8 do
        for x = 11, 11 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 8, 8 do
        for x = 10, 10 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    --2nd Zone
    --Edge outer corners            
    --1
    local y = 12
    local x = 42
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --2
    local y = 11
    local x = 42
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --3
    local y = 11
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4
    local y = 12
    local x = 50
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --5
    local y = 15
    local x = 50
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --6
    local y = 10
    local x = 61
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --7
    local y = 15
    local x = 55
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --8
    local y = 15
    local x = 56
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --9
    local y = 7
    local x = 64
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --10
    local y = 8
    local x = 25
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --11
    local y = 8
    local x = 29
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 

    -- Edge inner corners
    --1
    local y = 12
    local x = 44
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 12
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 15
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 18
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 18
    local x = 61
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 6
    local x = 56
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --0
    for y = 13, 18 do
        for x = 44, 44 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --1
    for y = 12, 12 do
        for x = 43, 43 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 11, 11 do
        for x = 43, 44 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 12, 12 do
        for x = 46, 49 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 13, 14 do
        for x = 50, 50 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 15, 15 do
        for x = 46, 49 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 16, 17 do
        for x = 45, 45 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 18, 18 do
        for x = 46, 60 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 11, 17 do
        for x = 61, 61 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 10, 10 do
        for x = 62, 92 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 1, 14 do
        for x = 55, 55 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 7, 14 do
        for x = 56, 56 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 6, 6 do
        for x = 57, 63 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 1, 6 do
        for x = 64, 64 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 1, 7 do
        for x = 25, 25 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 8, 8 do
        for x = 26, 28 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 1, 7 do
        for x = 29, 29 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --1
    for y = 13, 14 do
        for x = 45, 49 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 12, 18 do
        for x = 62, 62 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 11, 11 do
        for x = 62, 92 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 5, 5 do
        for x = 56, 63 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 1, 4 do
        for x = 56, 56 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 1, 4 do
        for x = 63, 63 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 1, 7 do
        for x = 28, 28 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 1, 7 do
        for x = 26, 26 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 7, 7 do
        for x = 27, 27 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    --Platforms
    -- -- there's only fucking 3 of em', fuck god
    for y = 12, 12 do
        for x = 16, 16 do
            local randomQuad = (gFrames['edgeTileThin2'][math.random(#gFrames['edgeTileThin2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    local y = 12
    local x =15
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --
    local y = 12
    local x = 17
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 
    for y = 14, 14 do
        for x = 27, 27 do
            local randomQuad = (gFrames['edgeTileThin2'][math.random(#gFrames['edgeTileThin2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    local y = 14
    local x =26
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --
    local y = 14
    local x = 28
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 
    for y = 14, 14 do
        for x = 35, 38 do
            local randomQuad = (gFrames['edgeTileThin2'][math.random(#gFrames['edgeTileThin2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    local y = 14
    local x =34
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --
    local y = 14
    local x = 39
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

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
    for y = 17, 17 do
        for x = 13, 15 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 11, 11 do
        for x = 15, 17 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 5, 5 do
        for x = 20, 21 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 10, 10 do
        for x = 42, 45 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 17, 17 do
        for x = 49, 50 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 17, 17 do
        for x = 54, 58 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 9, 9 do
        for x = 62, 62 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 9, 9 do
        for x = 67, 69 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps2'],
                quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    local y = 9
    for x = 82, 89 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    
end

function Level6Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level6Map.renderBeforeCamera(self)
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

function Level6Map.render(self)
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

function Level6Map.renderAfterPlayer(self)
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