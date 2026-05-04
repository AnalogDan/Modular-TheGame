Level9Map = {}

function Level9Map.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)
    self.bgArt = gTextures['bgArt9']

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
    self.totalMapWidth = 106
    local mapHeight = 22
    local tileSize = 8
    for y = -4, mapHeight do
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
    for y = 13, 14 do
        for x = 107, 107 do
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
    for y = 10, 11 do
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
    for y = 13, 14 do
        for x = 99, 99 do
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
    for y = 1, 9 do
        for x = 1, 12 do
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
    --1Delete corner
    for y = 9, 9 do
        for x = 12, 12 do
            self.tileMap[y][x] = {
                type = 'false',
                solid = false,
                --texture = gTextures['fillTile3'],
                quad = nil,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 12, 19 do
        for x = 1, 12 do
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
    for y = 1, 15 do
        for x = 21, 27 do
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
    for y = 18, 19 do
        for x = 21, 27 do
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
    for y = 17, 18 do
        for x = 36, 53 do
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
    for y = 1, 12 do
        for x = 92, 106 do
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
    for y = 15, 18 do
        for x = 92, 106 do
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
    for y = 12, 12 do
        for x = 43, 46 do
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
    local y = 14
    local x = 49
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 10
    local x = 49
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 10
    local x = 55
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    -- local y = 14
    -- local x = 61
    -- self.tileMap[y][x] = {
    --     type = 'stone',
    --     solid = true,
    --     texture = gTextures['fillTile3'],
    --     quad = nil,
    --     x = (x - 1) * tileSize,
    --     y = (y - 1) * tileSize,
    -- }
    --13
    local y = 12
    local x = 64
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --14
    local y = 9
    local x = 67
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --15
    local y = 7
    local x = 70
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --16
    local y = 5
    local x = 73
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --17
    local y = 1
    local x = 74
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --17.1
    local y = 0
    local x = 74
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --17.2
    local y = -1
    local x = 74
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --17.3
    local y = -2
    local x = 74
    self.tileMap[y][x] = {
        type = 'stone',
        solid = true,
        texture = gTextures['fillTile3'],
        quad = nil,
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

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

    ---------Platforms
    -- 8
    local y = 12
    for y = y, y do
        for x = 44, 45 do
            local randomQuad = (gFrames['edgeTileThin3'][math.random(#gFrames['edgeTileThin3'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileThin3'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    local x = 43
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local x = 46
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeCornerThin3'],
        quad = (gFrames['edgeCornerThin3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    -- 9
    local y = 14
    local x = 49
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    -- 10 
    local y = 10
    local x = 49
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    -- 11
    local y = 10
    local x = 55
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    -- 13
    local y = 12
    local x = 64
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    -- 14
    local y = 9
    local x = 67
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --15
    local y = 7
    local x = 70
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    -- 16
    local y = 5
    local x = 73
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    -- 17
    local y = 1
    local x = 74
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeTileThin3'],
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    --Edge outer corners           
    --1
    local y = 12
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --2
    local y = 18
    local x = 21
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --3
    local y = 18
    local x = 27
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --4
    local y = 17
    local x = 36
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --5
    local y = 17
    local x = 53
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --6
    local y = 15
    local x = 92
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --7
    local y = 9
    local x = 11
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --8
    local y = 8
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --9
    local y = 15
    local x = 21
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --10
    local y = 15
    local x = 27
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 
    --11
    local y = 12
    local x = 92
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner3'],
        quad = (gFrames['edgeOuterCorner3'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    } 

    -- Edge inner corners
    --1
    local y = 8
    local x = 11
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner3'],
        quad = (gFrames['edgeInnerCorner3'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 12, 12 do
        for x = 1, 11 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 13, 18 do
        for x = 12, 12 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 18, 18 do
        for x = 22, 26 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 18, 18 do
        for x = 36, 36 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 17, 17 do
        for x = 37, 52 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 18, 18 do
        for x = 53, 53 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 16, 18 do
        for x = 92, 92 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --8
    for y = 15, 15 do
        for x = 93, 106 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --9
    for y = 9, 9 do
        for x = 1, 10 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --10
    for y = 1, 7 do
        for x = 12, 12 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 1, 14 do
        for x = 21, 21 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 15, 15 do
        for x = 22, 26 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --13
    for y = 1, 14 do
        for x = 27, 27 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Right'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 1, 11 do
        for x = 92, 92 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Left'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 12, 12 do
        for x = 93, 106 do
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet3Down'],
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    ------Infill tiles
    --1
    for y = 13, 13 do
        for x = 1, 11 do
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
    for y = 14, 18 do
        for x = 11, 11 do
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
    for y = 18, 18 do
        for x = 37, 52 do
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
    for y = 16, 18 do
        for x = 93, 93 do
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
        for x = 94, 106 do
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
    for y = 1, 6 do
        for x = 11, 11 do
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
    for y = 7, 7 do
        for x = 10, 11 do
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
    for y = 8, 8 do
        for x = 1, 10 do
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
    for y = 1, 14 do
        for x = 22, 22 do
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
    for y = 1, 14 do
        for x = 26, 26 do
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
    for y = 14, 14 do
        for x = 23, 25 do
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
    for y = 1, 10 do
        for x = 93, 93 do
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
    for y = 11, 11 do
        for x = 93, 106 do
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

function Level9Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level9Map.renderBeforeCamera(self)
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

function Level9Map.render(self)
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

function Level9Map.renderAfterPlayer(self)
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