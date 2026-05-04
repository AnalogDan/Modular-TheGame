Level8Map = {}

function Level8Map.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)
    self.bgArt = gTextures['bgArt8']

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
    self.totalMapWidth = 84
    local mapHeight = 22
    local tileSize = 8
    for y = -3, mapHeight do
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
    for y = 7, 16 do
        for x = 85, 85 do
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
    for y = 15, 16 do
        for x = 63, 63 do
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
    for y = 7, 16 do
        for x = 71, 71 do
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

    --1
    for y = 1, 1 do
        for x = 1, 15 do
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
    for y = 2, 3 do
        for x = 7, 15 do
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
    for y = 4, 14 do
        for x = 13, 15 do
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
    for y = 4, 8 do
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
    --5
    for y = 9, 16 do
        for x = 1, 8 do
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
    --6
    for y = 17, 18 do
        for x = 1, 19 do
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
    --7
    for y = 13, 13 do
        for x = 19, 23 do
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
    --8
    for y = 11, 11 do
        for x = 25, 28 do
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
    --9
    for y = 8, 8 do
        for x = 29, 33 do
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
    --10
    for y = 5, 5 do
        for x = 34, 39 do
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
    --11
    for y = 3, 3 do
        for x = 41, 45 do
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
    --12
    for y = 1, 2 do
        for x = 54, 57 do
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
    --13
    for y = 1, 4 do
        for x = 58, 65 do
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
    --14
    for y = 3, 6 do
        for x = 54, 55 do
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
    --15
    for y = 5, 14 do
        for x = 64, 65 do
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
    --16
    for y = 7, 9 do
        for x = 54, 60 do
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
    --17
    for y = 10, 14 do
        for x = 54, 55 do
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
    --18
    for y = 12, 14 do
        for x = 59, 63 do
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
    --19
    for y = 17, 18 do
        for x = 53, 84 do
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

    --spikes
    --1
    for y = 2, 3 do
        for x = 6, 6 do
            local randomQuad = (gFrames['spikeSheet2Left'][math.random(#gFrames['spikeSheet2Left'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 8, 8 do
        for x = 4, 8 do
            local randomQuad = (gFrames['spikeSheet2'][math.random(#gFrames['spikeSheet2'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet2'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 4, 4 do
        for x = 7, 12 do
            local randomQuad = (gFrames['spikeSheet2Down'][math.random(#gFrames['spikeSheet2Down'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet2Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 5, 14 do
        for x = 12, 12 do
            local randomQuad = (gFrames['spikeSheet2Left'][math.random(#gFrames['spikeSheet2Left'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet2Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 9, 14 do
        for x = 9, 9 do
            local randomQuad = (gFrames['spikeSheet2Right'][math.random(#gFrames['spikeSheet2Right'])])
            self.tileMap[y][x] = {
                type = 'spikes',
                solid = false,
                texture = gTextures['spikeSheet2Right'],
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

    --Edge outer corners           
    --1
    local y = 4
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --2
    local y = 9
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --3
    local y = 17
    local x = 19
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4
    local y = 3
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --5
    local y = 14
    local x = 13
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --6
    local y = 14
    local x = 15
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4.2
    local y = 17
    local x = 53
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --5.2
    local y = 14
    local x = 54
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --6.2
    local y = 14
    local x = 55
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --7
    local y = 9
    local x = 60
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --8
    local y = 7
    local x = 60
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --9
    local y = 4
    local x = 58
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --10
    local y = 12
    local x = 59
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --11
    local y = 14
    local x = 59
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --12
    local y = 14
    local x = 65
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 

    -- Edge inner corners
    --1
    local y = 9
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 17
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 1
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 3
    local x = 13
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 9
    local x = 55
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 7
    local x = 55
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 2
    local x = 55
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 2
    local x = 58
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 4
    local x = 64
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 12
    local x = 64
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 4, 4 do
        for x = 1, 2 do
            local randomQuad = (gFrames['edgeTileSheet3'][math.random(#gFrames['edgeTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 5, 8 do
        for x = 3, 3 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 9, 9 do
        for x = 4, 7 do
            local randomQuad = (gFrames['edgeTileSheet3'][math.random(#gFrames['edgeTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 10, 16 do
        for x = 8, 8 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4.2
    for y = 18, 18 do
        for x = 19, 19 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 17, 17 do
        for x = 9, 18 do
            local randomQuad = (gFrames['edgeTileSheet3'][math.random(#gFrames['edgeTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 1, 1 do
        for x = 1, 6 do
            local randomQuad = (gFrames['edgeTileSheet3Down'][math.random(#gFrames['edgeTileSheet3Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 2, 2 do
        for x = 7, 7 do
            local randomQuad = (gFrames['edgeTileSheet3Left'][math.random(#gFrames['edgeTileSheet3Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 3, 3 do
        for x = 8, 12 do
            local randomQuad = (gFrames['edgeTileSheet3Down'][math.random(#gFrames['edgeTileSheet3Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 4, 13 do
        for x = 13, 13 do
            local randomQuad = (gFrames['edgeTileSheet3Left'][math.random(#gFrames['edgeTileSheet3Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 14, 14 do
        for x = 14, 14 do
            local randomQuad = (gFrames['edgeTileSheet3Down'][math.random(#gFrames['edgeTileSheet3Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 1, 13 do
        for x = 15, 15 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 18, 18 do
        for x = 53, 53 do
            local randomQuad = (gFrames['edgeTileSheet3Left'][math.random(#gFrames['edgeTileSheet3Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 17, 17 do
        for x = 54, 84 do
            local randomQuad = (gFrames['edgeTileSheet3'][math.random(#gFrames['edgeTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 1, 13 do
        for x = 54, 54 do
            local randomQuad = (gFrames['edgeTileSheet3Left'][math.random(#gFrames['edgeTileSheet3Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 10, 13 do
        for x = 55, 55 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 9, 9 do
        for x = 56, 59 do
            local randomQuad = (gFrames['edgeTileSheet3Down'][math.random(#gFrames['edgeTileSheet3Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --17
    for y = 8, 8 do
        for x = 60, 60 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --18
    for y = 7, 7 do
        for x = 56, 59 do
            local randomQuad = (gFrames['edgeTileSheet3'][math.random(#gFrames['edgeTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --19
    for y = 3, 6 do
        for x = 55, 55 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --20
    for y = 2, 2 do
        for x = 56, 57 do
            local randomQuad = (gFrames['edgeTileSheet3Down'][math.random(#gFrames['edgeTileSheet3Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --21
    for y = 3, 3 do
        for x = 58, 58 do
            local randomQuad = (gFrames['edgeTileSheet3Left'][math.random(#gFrames['edgeTileSheet3Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --22
    for y = 4, 4 do
        for x = 59, 63 do
            local randomQuad = (gFrames['edgeTileSheet3Down'][math.random(#gFrames['edgeTileSheet3Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --23
    for y = 5, 11 do
        for x = 64, 64 do
            local randomQuad = (gFrames['edgeTileSheet3Left'][math.random(#gFrames['edgeTileSheet3Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --24
    for y = 12, 12 do
        for x = 60, 63 do
            local randomQuad = (gFrames['edgeTileSheet3'][math.random(#gFrames['edgeTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --25
    for y = 13, 13 do
        for x = 59, 59 do
            local randomQuad = (gFrames['edgeTileSheet3Left'][math.random(#gFrames['edgeTileSheet3Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --26
    for y = 14, 14 do
        for x = 60, 64 do
            local randomQuad = (gFrames['edgeTileSheet3Down'][math.random(#gFrames['edgeTileSheet3Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --27
    for y = 1, 13 do
        for x = 65, 65 do
            local randomQuad = (gFrames['edgeTileSheet3Right'][math.random(#gFrames['edgeTileSheet3Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --1
    for y = 5, 5 do
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
    --1.1
    for y = 6, 9 do
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
    --2
    for y = 10, 10 do
        for x = 2, 7 do
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
    for y = 11, 17 do
        for x = 7, 7 do
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
    for y = 18, 18 do
        for x = 7, 18 do
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
    for y = 1, 1 do
        for x = 8, 8 do
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
    for y = 2, 2 do
        for x = 8, 13 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 1, 13 do
        for x = 14, 14 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 18, 18 do
        for x = 54, 84 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 1, 1 do
        for x = 55, 59 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9.1
    for y = 8, 8 do
        for x = 55, 59 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 2, 2 do
        for x = 59, 59 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 3, 3 do
        for x = 59, 64 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 1, 2 do
        for x = 64, 64 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 13, 13 do
        for x = 60, 64 do
            local randomQuad = (gFrames['infillTileSheet3'][math.random(#gFrames['infillTileSheet3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ---------Platforms
    -- 7
    local y = 13
    for y = y, y do
        for x = 20, 22 do
            local randomQuad = (gFrames['edgeTileThin3'][math.random(#gFrames['edgeTileThin3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    local x = 19
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local x = 23
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 8
    local y = 11
    for y = y, y do
        for x = 26, 27 do
            local randomQuad = (gFrames['edgeTileThin3'][math.random(#gFrames['edgeTileThin3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    local x = 25
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local x = 28
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 9
    local y = 8
    for y = y, y do
        for x = 30, 32 do
            local randomQuad = (gFrames['edgeTileThin3'][math.random(#gFrames['edgeTileThin3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    local x = 29
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local x = 33
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 10
    local y = 5
    for y = y, y do
        for x = 35, 38 do
            local randomQuad = (gFrames['edgeTileThin3'][math.random(#gFrames['edgeTileThin3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    local x = 34
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local x = 39
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 11
    local y = 3
    for y = y, y do
        for x = 42, 44 do
            local randomQuad = (gFrames['edgeTileThin3'][math.random(#gFrames['edgeTileThin3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    local x = 41
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][2]),
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
end

function Level8Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level8Map.renderBeforeCamera(self)
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

function Level8Map.render(self)
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

function Level8Map.renderAfterPlayer(self)
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