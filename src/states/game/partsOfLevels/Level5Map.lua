Level5Map = {}

function Level5Map.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)
    self.bgArt = gTextures['bgArt5']

    ----Create background 
    self.backgroundTileMap = {}
    local bgWidth = 92
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
    self.totalMapWidth = 92
    local mapHeight = 22
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

    ----Create grayboxing 
    --goal
    for y = 12, 15 do
        for x = 93, 94 do
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
    --door
    for y = 13, 14 do
        for x = 92, 92 do
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
    for y = 3, 10 do
        for x = 4, 4 do
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
    for y = 11, 18 do
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
    for y = 2, 8 do
        for x = 1, 1 do
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
    for y = 3, 6 do
        for x = 2, 2 do
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
    for y = 11, 11 do
        for x = 8, 10 do
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
    for y = 11, 11 do
        for x = 15, 18 do
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
    for y = 9, 9 do
        for x = 21, 22 do
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
    for y = 13, 13 do
        for x = 27, 30 do
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
    for y = 13, 13 do
        for x = 40, 45 do
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
    for y = 10, 10 do
        for x = 47, 50 do
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
    for y = 10, 10 do
        for x = 61, 64 do
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
    for y = 8, 8 do
        for x = 70, 74 do
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
    for y = 15, 15 do
        for x = 80, 83 do
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
    for y = 15, 18 do
        for x = 89, 92 do
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
    for y = 1, 1 do
        for x = 83, 90 do
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
    for y = 2, 2 do
        for x = 84, 90 do
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
    for y = 1, 3 do
        for x = 91, 91 do
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
    for y = 8, 12 do
        for x = 91, 91 do
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
    for y = 1, 12 do
        for x = 92, 92 do
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

    --Platforms
    --4 -- Numbered the same as the grayobox
    for y = 11, 11 do
        for x = 8, 10 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    local y = 11
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 11
    local x = 10
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    for y = 11, 11 do
        for x = 15, 18 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    local y = 11
    local x = 15
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 11
    local x = 18
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    for y = 9, 9 do
        for x = 21, 22 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    local y = 9
    local x = 21
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 9
    local x = 22
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    for y = 13, 13 do
        for x = 27, 30 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    local y = 13
    local x = 27
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 13
    local x = 30
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    for y = 13, 13 do
        for x = 40, 45 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    local y = 13
    local x = 40
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 13
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    for y = 10, 10 do
        for x = 47, 50 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    local y = 10
    local x = 47
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 10
    local x = 50
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    for y = 10, 10 do
        for x = 61, 64 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    local y = 10
    local x = 61
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 10
    local x = 64
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    for y = 8, 8 do
        for x = 70, 74 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    local y = 8
    local x = 70
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 8
    local x = 74
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    for y = 15, 15 do
        for x = 80, 83 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    local y = 15
    local x = 80 
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    local y = 15
    local x = 83
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    --Edge outer corners
    
    --1
    local y = 11
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 8
    local x = 1
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 6
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 3
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 2
    local x = 1
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 15
    local x = 89
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 12
    local x = 91
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 8
    local x = 91
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 3 
    local x = 91
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 2
    local x = 84
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 1 
    local x = 83
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    
    -- Edge inner corners
    --1
    local y = 6
    local x = 1
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 3
    local x = 1
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 8
    local x = 92
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 3
    local x = 92
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 2
    local x = 91
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 1
    local x = 84
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 12, 18 do
        for x = 4, 4 do
            local randomQuad = (gFrames['edgeTileSheet1Right'][math.random(#gFrames['edgeTileSheet1Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 11, 11 do
        for x = 1, 3 do
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
    for y = 7, 7 do
        for x = 1, 1 do
            local randomQuad = (gFrames['edgeTileSheet1Right'][math.random(#gFrames['edgeTileSheet1Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 4, 5 do
        for x = 2, 2 do
            local randomQuad = (gFrames['edgeTileSheet1Right'][math.random(#gFrames['edgeTileSheet1Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 16, 18 do
        for x = 89, 89 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 15, 15 do
        for x = 90, 92 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 12, 12 do
        for x = 92, 92 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 9, 11 do
        for x = 91, 91 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 4, 7 do
        for x = 92 ,92  do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 2, 2 do
        for x = 85, 90 do
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
        for x = 1, 3 do
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
    for y = 13, 18 do
        for x = 3, 3 do
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
    for y = 4, 5 do
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
    for y = 16, 16 do
        for x = 90, 92 do
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
    for y = 17, 18 do
        for x = 90, 90 do
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
    for y = 9, 11 do
        for x = 92, 92 do
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
    for y = 1, 2 do
        for x = 92, 92 do
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
    for y = 1, 1 do
        for x = 85, 91 do
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
    local mapHeight = 19
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
    for y = 10, 10 do
        for x = 3, 4 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 10, 10 do
        for x = 16, 18 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 12, 12 do
        for x = 27, 27 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 12, 12 do
        for x = 41, 43 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 7, 7 do
        for x = 70, 74 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 7, 7 do
        for x = 91, 91 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 1, 1 do
        for x = 1, 1 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
end

function Level5Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level5Map.renderBeforeCamera(self)
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

function Level5Map.render(self)
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

function Level5Map.renderAfterPlayer(self)
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