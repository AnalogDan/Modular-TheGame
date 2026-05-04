Level7Map = {}

function Level7Map.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)
    self.bgArt = gTextures['bgArt7']

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
    self.totalMapWidth = 65
    local mapHeight = 22
    local tileSize = 8
    for y = -1, mapHeight do
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

    --pit
    for y = 20, 22 do
        for x = 1, 65 do
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
    --goal
    for y = 4, 13 do
        for x = 66, 66 do
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
    for y = 2, 3 do
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
    for y = 3, 4 do
        for x = 40, 40 do
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
    for y = 4, 13 do
        for x = 56, 56 do
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
    --2
    for y = 1, 2 do
        for x = 6, 50 do
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
    for y = 3, 14 do
        for x = 6, 6 do
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
    for y = 3, 15 do
        for x = 16, 16 do
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
    for y = 4, 18 do
        for x = 1, 2 do
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
    for y = 6, 18 do
        for x = 10, 12 do
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
    for y = 7, 18 do
        for x = 20, 22 do
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
    for y = 17, 18 do
        for x = 9, 9 do
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
    for y = 18, 18 do
        for x = 19, 19 do
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
    for y = 7, 10 do
        for x = 23, 36 do
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
    for y = 11, 14 do
        for x = 30, 31 do
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
        for x = 24, 26 do
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
    for y = 17, 17 do
        for x = 29, 32 do
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
    for y = 13, 13 do
        for x = 35, 36 do
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
    local y =5
    for x = 40, 42 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --16
    local y =6
    for x = 40, 43 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --17
    local y =7
    for x = 40, 44 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --18
    local y =8
    for x = 40, 45 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --19
    local y =9
    for x = 40, 46 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --20
    local y =10
    for x = 40, 47 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --21
    local y =11
    for x = 40, 48 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --22
    local y =12
    for x = 40, 49 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --23
    local y =13
    for x = 40, 50 do
        self.tileMap[y][x] = {
            type = 'stone',
            solid = true,
            texture = gTextures['fillTile2'],
            quad = nil,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    
    --24
    for y = 14, 18 do
        for x = 40, 65 do
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
    for y = 2, 4 do
        for x = 5, 5 do
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
    --2
    for y = 7, 8 do
        for x = 3, 3 do
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
    for y = 11, 12 do
        for x = 5, 5 do
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
    for y = 18, 18 do
        for x = 3, 8 do
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
    for y = 3, 3 do
        for x = 7, 15 do
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
    --6
    for y = 14, 15 do
        for x = 15, 15 do
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
    for y = 11, 13 do
        for x = 23, 23 do
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
    for y = 11, 11 do
        for x = 24, 26 do
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
    --9
    for y = 18, 18 do
        for x = 36, 39 do
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

    --1st Zone
    --Edge outer corners           
    --1
    local y = 4
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --2
    local y = 17
    local x = 9
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --3
    local y = 6
    local x = 10
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4
    local y = 6
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --5
    local y = 18
    local x = 19
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --6
    local y = 7
    local x = 20
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --7
    local y = 2
    local x = 50
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 

    -- Edge inner corners
    --1
    local y = 17
    local x = 10
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 18
    local x = 20
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 10
    local x = 22
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 1
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 4, 4 do
        for x = 1, 1 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 5, 18 do
        for x = 2, 2 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 18, 18 do
        for x = 9, 9 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 7, 16 do
        for x = 10, 10 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 6, 6 do
        for x = 11, 11 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 7, 18 do
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
    --7
    for y = 8, 17 do
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
    for y = 7, 7 do
        for x = 21, 35 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 11, 18 do
        for x = 22, 22 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 10, 10 do
        for x = 23, 29 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 1, 1 do
        for x = 1, 5 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 2, 2 do
        for x = 7, 16 do
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
    for y = 2, 2 do
        for x = 17, 49 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 1, 1 do
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

    ------Infill tiles
    --1
    for y = 5, 18 do
        for x = 1, 1 do
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
    for y = 7, 18 do
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
    --3
    for y = 8, 18 do
        for x = 21, 21 do
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
    for y = 8, 9 do
        for x = 22, 35 do
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
    for y = 1, 1 do
        for x = 7, 49 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    --Zone 2
    --Edge outer corners           
    --1
    local y = 14
    local x = 30
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --2
    local y = 14
    local x = 31
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --3
    local y = 10
    local x = 36
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4
    local y = 7
    local x = 36
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4.1
    local y = 5
    local x = 40
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --5
    local y = 5
    local x = 42
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --6
    local y = 6
    local x = 43
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --7
    local y = 7
    local x = 44
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --8
    local y = 8
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --9
    local y = 9
    local x = 46
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --10
    local y = 10
    local x = 47
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --11
    local y = 11
    local x = 48
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --12
    local y = 12
    local x = 49
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --13
    local y = 13
    local x = 50
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner2'],
        quad = (gFrames['edgeOuterCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 

    -- Edge inner corners
    --1
    local y = 10
    local x = 30
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 10
    local x = 31
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 6
    local x = 42
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 7
    local x = 43
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 8
    local x = 44
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 9
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 10
    local x = 46
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 11
    local x = 47
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 12
    local x = 48
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 13
    local x = 49
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 14
    local x = 50
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner2'],
        quad = (gFrames['edgeInnerCorner2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 11, 13 do
        for x = 30, 30 do
            local randomQuad = (gFrames['edgeTileSheet2Left'][math.random(#gFrames['edgeTileSheet2Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 11, 13 do
        for x = 31, 31 do
            local randomQuad = (gFrames['edgeTileSheet2Right'][math.random(#gFrames['edgeTileSheet2Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 10, 10 do
        for x = 32, 35 do
            local randomQuad = (gFrames['edgeTileSheet2Down'][math.random(#gFrames['edgeTileSheet2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 8, 9 do
        for x = 36, 36 do
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
    for y = 6, 18 do
        for x = 40, 40 do
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
    for y = 5, 5 do
        for x = 41, 41 do
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
    for y = 14, 14 do
        for x = 51, 65 do
            local randomQuad = (gFrames['edgeTileSheet2'][math.random(#gFrames['edgeTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --0
    for y = 8, 18 do
        for x = 41, 41 do
            local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --1
    local y = 6
    for x = 41, 41 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --2
    local y = 7
    for x = 41, 42 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --3
    local y = 8
    for x = 42, 43 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --4
    local y =9
    for x = 43, 44 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --5
    local y = 10
    for x = 44, 45 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --6
    local y = 11
    for x = 45, 46 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --7
    local y = 12
    for x = 46, 47 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --8
    local y = 13
    for x = 47, 48 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --9
    local y = 14
    for x = 48, 49 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --10
    local y = 15
    for x = 49, 65 do
        local randomQuad = (gFrames['infillTileSheet2'][math.random(#gFrames['infillTileSheet2'])])
        self.decorativeTiles[y][x] = {
            texture = gTextures['infillTileSheet2'],
            quad = randomQuad,
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    

    --Platforms
    -- 1 --First two are paradas
    for y = 2, 13 do
        for x = 6, 6 do
            local randomQuad = (gFrames['edgeTileThin2Down'][math.random(#gFrames['edgeTileThin2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    local y = 14
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2Down'],
        quad = (gFrames['edgeCornerThin2Down'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 2
    for y = 3, 14 do
        for x = 16, 16 do
            local randomQuad = (gFrames['edgeTileThin2Down'][math.random(#gFrames['edgeTileThin2Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    local y = 15
    local x = 16
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2Down'],
        quad = (gFrames['edgeCornerThin2Down'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 3
    for y = 14, 14 do
        for x = 25, 25 do
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
    local x = 24
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --
    local y = 14
    local x = 26
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 4
    local y = 17
    for y = y, y do
        for x = 30, 31 do
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
    local x = 29
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --
    local x = 32
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 5
    local y = 13
    --
    local x = 35
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin2'],
        quad = (gFrames['edgeCornerThin2'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --
    local x = 36
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
    local y = 5
    for x = 10, 12 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --2
    local y = 6
    for x = 22, 25 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --3
    local y = 6
    for x = 31, 36 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --4
    local y = 16
    for x = 29, 31 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --5
    local y = 12
    for x = 35, 36 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --6
    local y = 9
    for x = 47, 47 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
    --7
    local y = 13
    for x = 60, 65 do
        self.foreDecorativeTiles[y][x] = {
            texture = gTextures['foreProps2'],
            quad = (gFrames['foreProps2'][math.random(#gFrames['foreProps2'])]),
            x = (x - 1) * tileSize,
            y = (y - 1) * tileSize,
        }
    end
end

function Level7Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level7Map.renderBeforeCamera(self)
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

function Level7Map.render(self)
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

function Level7Map.renderAfterPlayer(self)
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