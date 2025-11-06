Level1 = Class{__includes = BaseState}

function Level1:init()
    love.audio.setVolume(3)
    gSounds['music1']:setVolume(0.2)
    gSounds['music1']:setLooping(true)  
    gSounds['music1']:play()

    -- replace ambience1 with pure birds and wind
    -- gSounds['ambience1']:setVolume(0.7)
    -- gSounds['ambience1']:setLooping(true)   
    -- gSounds['ambience1']:play()

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
    local mapWidth = 32
    local mapHeight = 19
    local tileSize = 8
    for y = -10, mapHeight + 4 do
        self.tileMap[y] = {}
        for x = 1, mapWidth do
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
    for y = -1, -1 do
        for x = 28,32 do
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
        for x = 4,9 do
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
    --0
    for y = 1, 3 do
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
    for y = 4, 4 do
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
    for y = 5, 5 do
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

    for y = 14, 19 do
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
    for y = 1, 10 do
        for x = 13, 16 do
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
    for y = 14, 19 do
        for x = 9, 32 do
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
    for y = 9, 13 do
        for x = 20, 32 do
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
    for y = 7, 8 do
        for x = 28, 32 do
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
    for y = 1, 4 do
        for x = 24, 28 do
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
    for y = 1, 4 do
        for x = 32, 32 do
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
    for y = 1, 1 do
        for x = 1, 28 do
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
    for y = 1, 19 do
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
    for y = 1, 19 do
        for x = 32, 32 do
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
    local mapWidth = 32
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
    ----Edge arista 
    --1
    for y = 14, 14 do
        for x = 10, 19 do
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
    for y = 10, 13 do
        for x = 20, 20 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y = 9, 9 do
        for x = 21, 27 do
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
    for y = 8, 8 do
        for x = 28, 28 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 7, 7 do
        for x = 29, 31 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 1, 6 do
        for x = 32, 32 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 1, 3 do
        for x = 28, 28 do
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
    for y = 4, 4 do
        for x = 25, 27 do
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
    for y = 2, 3 do
        for x = 24, 24 do
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
    for y = 1, 1 do
        for x = 17, 23 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --11
    for y = 2, 9 do
        for x = 16, 16 do
            local randomQuad = (gFrames['edgeTileSheet1Right'][math.random(#gFrames['edgeTileSheet1Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --12
    for y = 10, 10 do
        for x = 14, 15 do
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
    for y = 2, 9 do
        for x = 13, 13 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --14
    for y = 1, 1 do
        for x = 7, 12 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --15
    for y = 2, 2 do
        for x = 6, 6 do
            local randomQuad = (gFrames['edgeTileSheet1Right'][math.random(#gFrames['edgeTileSheet1Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --16
    for y = 4, 4 do
        for x = 4, 4 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --17
    for y = 5, 5 do
        for x = 2, 2 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --18
    for y = 6, 13 do
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
    --19
    for y = 14, 14 do
        for x = 2, 3 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --20
    for y = 15, 19 do
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
    --21
    for y = 15, 19 do
        for x = 9, 9 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    ------Edge Corners
    --1
    local y = 14
    local x = 1
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 14
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 14
    local x = 9
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 14
    local x = 20
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 9
    local x = 20
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 9
    local x = 28
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 7
    local x = 28
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 7
    local x = 32
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 4
    local x = 28
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 4
    local x = 24
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 1
    local x = 24
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    local y = 1
    local x = 16
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --13
    local y = 10
    local x = 16
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --14
    local y = 10
    local x = 13
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --15
    local y = 1
    local x = 13
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --16
    local y = 1
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --17
    local y = 3
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --18
    local y = 3
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --19
    local y = 4
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --20
    local y = 4
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --21
    local y = 5
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --22
    local y = 5
    local x = 1
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    ------Infill tiles
    --1
    for y = 15, 15 do
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
    for y = 16, 19 do
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
    for y = 16, 19 do
        for x = 10, 10 do
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
    for y = 15, 15 do
        for x = 10, 21 do
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
    for y = 11, 14 do
        for x = 21, 21 do
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
        for x = 21, 29 do
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
    for y = 9, 9 do
        for x = 29, 29 do
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
    for y = 8, 8 do
        for x = 29, 32 do
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
    for y = 1, 2 do
        for x = 27, 27 do
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
    for y = 3, 3 do
        for x = 25, 27 do
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
    for y = 1, 2 do
        for x = 25, 25 do
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
    for y = 1, 9 do
        for x = 14, 15 do
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
    for y = 1, 1 do
        for x = 5, 5 do
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
    for y = 2, 2 do
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
    --15
    for y = 3, 3 do
        for x = 2, 4 do
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
    for y = 4, 4 do
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

    --Foreground decoration
    ------Create empty fore-decorative canvas
    self.foreDecorativeTiles = {}
    local mapWidth = 32
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
    for y =13, 13 do
        for x = 11, 15 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y =8, 8 do
        for x = 25, 26 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --3
    for y =6, 6 do
        for x = 29, 29 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    local y = 13
    local x = 2
    self.foreDecorativeTiles[y][x] = {
        texture = gTextures['foreProps1'],
        quad = (gFrames['foreProps1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local y = 13
    local x = 3
    self.foreDecorativeTiles[y][x] = {
        texture = gTextures['foreProps1'],
        quad = (gFrames['foreProps1'][5]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local y = 13
    local x = 4
    self.foreDecorativeTiles[y][x] = {
        texture = gTextures['foreProps1'],
        quad = (gFrames['foreProps1'][6]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 13
    local x = 18
    self.foreDecorativeTiles[y][x] = {
        texture = gTextures['foreProps1'],
        quad = (gFrames['foreProps1'][5]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    local y = 8
    local x = 21
    self.foreDecorativeTiles[y][x] = {
        texture = gTextures['foreProps1'],
        quad = (gFrames['foreProps1'][6]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    
    

    
    self.player = Player(10, 80, self.tileMap)
    self.enemies = {
        --Enemy(140, 80, self.player, "still")
    }
end

function Level1:update(dt)
    self.player:update(dt)
    for _, enemy in ipairs(self.enemies) do
        enemy:update(dt)
    end
end

function Level1:render()
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
    --draw bg Art
    love.graphics.draw(gTextures['bgArt1'], 1, 1)
    
    --draw solid tileMap
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

    self.player:render()
    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end

    ----draw fore-decorative tiles
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

-- love.graphics.setFont(gFonts['dogicapixel'])
-- love.graphics.print('Hello world in DogicaPixel!', 50, 50)


end

