Level4_0Map = {}

function Level4_0Map.generate(self)
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
    self.totalMapWidth = 64
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

    --pit
    for y = 20, 22 do
        for x = 1, 56 do
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
    for y = 4, 5 do
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
    --goal
    for y = 7, 10 do
        for x = 65, 65 do
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

    --Grayboxing
    --1
    for y = 1, 1 do
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
    --2
    for y = 2, 2 do
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
    --3
    for y = 3, 3 do
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
    --4
    for y = 6, 18 do
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
    --5
    for y = 6, 15 do
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
    --6
    for y = 6, 8 do
        for x = 3, 3 do
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
    for y = 6, 7 do
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
    --8
    for y = 8, 9 do
        for x = 35, 43 do
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
        for x = 36, 44 do
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
    for y = 11, 11 do
        for x = 37, 45 do
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
    for y = 12, 12 do
        for x = 38, 45 do
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
    for y = 13, 13 do
        for x = 39, 44 do
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
    for y = 14, 14 do
        for x = 39, 41 do
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
        for x = 64, 64 do
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
    for y = 2, 4 do
        for x = 63, 64 do
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
    for y = 5, 7 do
        for x = 62, 64 do
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
    for y = 10, 12 do
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
    --18
    for y = 13, 13 do
        for x = 57, 64 do
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
    for y = 14, 18 do
        for x = 56, 64 do
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

    --Grayboxing platforms
    --1
    for y = 16, 16 do
        for x = 7, 9 do
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
    for y = 17, 17 do
        for x = 16, 19 do
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
    for y = 14, 14 do
        for x = 21, 23 do
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
    for y = 12, 12 do
        for x = 25, 27 do
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
    for y = 9, 9 do
        for x = 29, 31 do
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
    for y = 17, 17 do
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
    --7
    for y = 16, 16 do
        for x = 50, 53 do
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

    --Decoration platforms
    -- 1
    for y = 16, 16 do
        for x = 8, 8 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --1
    local y = 16
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --1
    local y = 16
    local x = 9
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 2
    for y = 17, 17 do
        for x = 17, 18 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    local y = 17
    local x = 16
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 17
    local x = 19
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 3
    for y = 14, 14 do
        for x = 22, 22 do
            local randomQuad = (gFrames['edgeTileThin1'][math.random(#gFrames['edgeTileThin1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    local y = 14
    local x = 21
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 14
    local x = 23
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 4
    for y = 12, 12 do
        for x = 26, 26 do
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
    local y = 12
    local x = 25
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 12
    local x = 27
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 5
    for y = 9, 9 do
        for x = 30, 30 do
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
    local y = 9
    local x = 29
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 9
    local x = 31
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 6
    for y = 17, 17 do
        for x = 41, 44 do
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
    local y = 17
    local x = 40
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 17
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 7
    for y = 16, 16 do
        for x = 51, 52 do
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
    local y = 16
    local x = 50
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 16
    local x = 53
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin1'],
        quad = (gFrames['edgeCornerThin1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    --Edge outer corners
    --1
    local y = 1
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 2
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 3
    local x = 2
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
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 7
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 8
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 15
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 8
    local x = 35
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 8
    local x = 43
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 10
    local x = 44
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 11
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    local y = 12
    local x = 45
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --13
    local y = 13
    local x = 44
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --14
    local y = 14
    local x = 41
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --15
    local y = 14
    local x = 39
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --16
    local y = 12
    local x = 38
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --17
    local y = 11
    local x = 37
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --18
    local y = 10
    local x = 36
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --19
    local y = 9
    local x = 35
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --20
    local y = 2
    local x = 63
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --21
    local y = 5
    local x = 62
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --22
    local y = 7
    local x = 62
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --23
    local y = 10
    local x = 61
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --24
    local y = 13
    local x = 57
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --25
    local y = 14
    local x = 56
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- Edge inner corners
    --1
    local y = 1
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 2
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 7
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 8
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 15
    local x = 1
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 10
    local x = 43
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 11
    local x = 44
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 12
    local x = 44
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 13
    local x = 41
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 12
    local x = 39
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 11
    local x = 38
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    local y = 10
    local x = 37
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --13
    local y = 9
    local x = 36
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --14
    local y = 2
    local x = 64
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --15
    local y = 5
    local x = 63
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --16
    local y = 13
    local x = 61
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --17
    local y = 14
    local x = 57
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 2, 2 do
        for x = 3, 4 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 3, 3 do
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
    --3
    for y = 6, 6 do
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
    --4
    for y = 9, 14 do
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
    --6
    for y = 8, 8 do
        for x = 36, 42 do
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
    for y = 9, 9 do
        for x = 43, 43 do
            local randomQuad = (gFrames['edgeTileSheet1Right'][math.random(#gFrames['edgeTileSheet1Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 13, 13 do
        for x = 42, 43 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 14, 14 do
        for x = 40, 40 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9.1
    for y = 13, 13 do
        for x = 39, 39 do
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
    for y = 3, 4 do
        for x = 63, 63 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 6, 6 do
        for x = 62, 62 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 7, 7 do
        for x = 63, 64 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 10, 10 do
        for x = 62, 64 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 11, 12 do
        for x = 61, 61 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 13, 13 do
        for x = 58, 60 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 15, 18 do
        for x = 56, 56 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --17
    for y = 1, 1 do
        for x = 64, 64 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --1
    for y = 1, 1 do
        for x = 1, 4 do
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
    for y = 2, 2 do
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
    --3
    for y = 7, 7 do
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
    --4
    for y = 8, 14 do
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
    --5
    for y = 9, 9 do
        for x = 37, 42 do
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
    for y = 10, 10 do
        for x = 38, 39 do
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
    for y = 10, 10 do
        for x = 42, 42 do
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
    for y = 11, 11 do
        for x = 39, 39 do
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
    for y = 11, 11 do
        for x = 42, 43 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 12, 12 do
        for x = 40, 43 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 13, 13 do
        for x = 40, 40 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 3, 6 do
        for x = 64, 64 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 6, 6 do
        for x = 63, 63 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 11, 11 do
        for x = 62, 64 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 12, 13 do
        for x = 62, 62 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 14, 14 do
        for x = 58, 62 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --17
    for y = 15, 15 do
        for x = 57, 58 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --18
    for y = 16, 18 do
        for x = 57, 57 do
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

    --Grass platforms
    --1
    for y = 15, 15 do
        for x = 8, 9 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 13, 13 do
        for x = 21, 23 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 11, 11 do
        for x = 25, 27 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 8, 8 do
        for x = 29, 30 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 16, 16 do
        for x = 40, 45 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 15, 15 do
        for x = 52, 52 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --Rest of the grass
    --1
    for y = 5, 5 do
        for x = 2, 3 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 7, 7 do
        for x = 42, 43 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2.2
    for y = 7, 7 do
        for x = 42, 43 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 13, 13 do
        for x = 56, 56 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 9, 9 do
        for x = 61, 62 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 1, 1 do
        for x = 65, 65 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end



end

function Level4_0Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level4_0Map.renderBeforeCamera(self)
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

function Level4_0Map.render(self)
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

function Level4_0Map.renderAfterPlayer(self)
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