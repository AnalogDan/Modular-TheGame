Level4 = Class{__includes = BaseState}
local utf8 = require("utf8")

function Level4:init()
    self.currentLevel = 'level3'
    self.nextLevel = 'level1'
    self.triggerRemoved = false
    math.randomseed(0)

    ----To create and control dialogue
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    self.sequences = {
        sequence = {
            {
                text = "kk d va k",
                portrait = gTextures.tales,
                blip = "faceBlip"
            },
            {
                type = "question",
                text = "Cuanto es 2 + 2?",
                portrait = gTextures.tales,
                blip = "faceBlip",
                answer = "4",
                successSequence = "success",
                fail = "death",
            },
            {
                text = "Pinche puto",
                portrait = gTextures.talesEnd,
                blip = "faceBlip"
            }
        },
        success = {
            {
                text = "Correcto...",
                portrait = gTextures.tales,
                blip = "faceBlip"
            }
        }
    }
    self.activeSequence = nil
    self.sequenceIndex = 1
    self.showDialogue = false
    self.currentText = nil
    self.currentPortrait = nil
    self.currentBlip = nil
    self.textTimer = 0
    self.visibleChars = 0
    self.textSpeed = 0.03
    self.pendingPlayerHit = false
    --text processor shit
    self.isAnswering = false
    self.playerInput = ""
    self.cursorTimer = 0
    self.cursorVisible = true
    self.cursorBlinkSpeed = 0.5
    self.backspaceTimer = 0
    self.backspaceDelay = 0.3
    self.backspaceRepeat = 0.05
    self.backspaceHeld = false

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

    --goal
    for y = 3, 13 do
        for x = 33, 34 do
            self.tileMap[y][x] = {
                type = 'goal',
                solid = false,
                texture = gTextures['testGoal'],
                quad = nil,
                x = ((x - 1) * tileSize),
                y = (y - 1) * tileSize,
            }
        end
    end

    --trigger
    for y = 3, 11 do
        for x = 18,18 do
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

    --1 (Grayboxing)
    for y = 18, 18 do
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
    --2
    for y = 17, 17 do
        for x = 5, 32 do
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
    for y = 16, 16 do
        for x = 6, 32 do
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
    for y = 15, 15 do
        for x = 7, 32 do
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
    for y = 14, 14 do
        for x = 8, 32 do
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
    for y = 13, 13 do
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
    --7
    for y = 12, 12 do
        for x = 10, 32 do
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
    for y = 1, 1 do
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
    --9
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
    --10
    for y = 3, 3 do
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
    --11
    for y = 4, 6 do
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
    --12
    for y = 7, 10 do
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
    --13
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
    --14
    for y = 12, 15 do
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
    --entrance
    for y = 16, 17 do
        for x = 1, 1 do
            self.tileMap[y][x] = {
                type = 'entrance',
                solid = true,
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

    -- Edge inner corners
    --1
    local y = 18
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 17
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 16
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 15
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 14
    local x = 9
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 13
    local x = 10
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 11
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 10
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 7
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 3
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 2
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    local y = 1
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    --Edge outer corners
    --1
    local y = 17
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 16
    local x = 6
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 15
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 14
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 13
    local x = 9
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 12
    local x = 10
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][1]),
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
    local y = 11
    local x = 3
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --9
    local y = 10
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --10
    local y = 7
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --11
    local y = 3
    local x = 4
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --12
    local y = 2
    local x = 5
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --13
    local y = 1
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }

    ----Edge aristas
    --1
    for y = 18, 18 do
        for x = 1, 4 do
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
        for x = 11, 32 do
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
    for y = 15, 15 do
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
    --4
    for y = 12, 14 do
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
    for y = 8, 9 do
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
    --6
    for y = 4, 6 do
        for x = 3, 3 do
            local randomQuad = (gFrames['edgeTileSheet1Right'][math.random(#gFrames['edgeTileSheet1Right'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Right'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 1, 1 do
        for x = 6, 7 do
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
    for y = 18, 18 do
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
    --2
    for y = 17, 17 do
        for x = 7, 8 do
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
    for y = 16, 16 do
        for x = 8, 9 do
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
        for x = 9, 10 do
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
    for y = 14, 14 do
        for x = 10, 11 do
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
    for y = 13, 13 do
        for x = 11, 32 do
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
    for y = 11, 14 do
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
    --8
    for y = 10, 10 do
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
    --9
    for y = 9, 9 do
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
    --10
    for y = 3, 7 do
        for x = 2, 2 do
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
    for y = 2, 2 do
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
    --12
    for y = 1, 1 do
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
    for y = 6, 6 do
        for x = 4, 4 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --2
    for y = 17, 17 do
        for x = 2, 3 do
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
        for x = 10, 13 do
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
        for x = 15, 17 do
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
        for x = 22, 23 do
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
        for x = 24, 26 do
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
        for x = 29, 31 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end

    

    
    self.player = Player(-20, 126, self.tileMap, self.currentLevel, self.nextLevel, 'right')
    self.enemies = {
        --Enemy(24, 8, self.player, "vertical"),
    }
    self.items = {
        Item(144, 80, self.player, "tales"),
        Item(0, 120, self.player, "entrance"),
        -- Item(152, 88, self.player, "apple"),
    }
end

--Helper functions for dialogue
function Level4:startSequence(name)
    local sequence = self.sequences[name]
    if not sequence then return end
    self.activeSequence = sequence
    self.sequenceIndex = 1
    self.showDialogue = true
    self:loadCurrentLine()
    self.player.canControl = false
end
function Level4:loadCurrentLine()
    local entry = self.activeSequence[self.sequenceIndex]

    self.currentText = entry.text
    self.currentPortrait = entry.portrait
    self.currentBlip = entry.blip

    self.textTimer = 0
    self.visibleChars = 0

    self.isAnswering = false
end
local function playBlip(blipSetName)
    local blipSet = gSounds[blipSetName]
    if not blipSet or #blipSet == 0 then return end

    local blip = blipSet[math.random(#blipSet)]
    blip:setPitch(0.9 + math.random() * 0.2)
    blip:stop()
    blip:play()
end
function Level4:textinput(text)
    self.cursorVisible = true
    self.cursorTimer = 0
    if self.isAnswering then
        if utf8.len(self.playerInput) < 30 then
            self.playerInput = self.playerInput .. text
        end
    end
end
local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

function Level4:update(dt)
    --To test dialogue
    -- if love.keyboard.wasPressed("o") then
    --     self:startSequence("warning")
    -- end

    self.player:update(dt)

    --Update enemies and items unless they're removed
    for _, enemy in ipairs(self.enemies) do
        enemy:update(dt)
    end

    for _, item in ipairs(self.items) do
        item:update(dt)
        
    end
    for i = #self.items, 1, -1 do
        if self.items[i].removed then
            table.remove(self.items, i)
        end
    end

    --When touchedTrigger 
    if self.player.touchedTrigger and not self.triggerRemoved then
        self.triggerRemoved = true
        for y, row in pairs(self.tileMap) do
            for x, tile in pairs(row) do
                if tile.type == "trigger" then
                    tile.type = "empty"
                    tile.texture = nil
                end
            end
        end

        self:startSequence("sequence")
    end

    --Handle questions input. (Make sure this section and the 'show dialogue' one are at the end of update)
    if self.isAnswering then
        self.cursorTimer = self.cursorTimer + dt
        if self.cursorTimer >= self.cursorBlinkSpeed then
            self.cursorTimer = 0
            self.cursorVisible = not self.cursorVisible
        end

        if love.keyboard.wasPressed("backspace") then --holy shit, this is a lot of code to handle backspace deleting
            self.backspaceHeld = true
            self.backspaceTimer = 0
            local byteoffset = utf8.offset(self.playerInput, -1)
            if byteoffset then
                self.playerInput = string.sub(self.playerInput, 1, byteoffset - 1)
            end
        end
        if not love.keyboard.isDown("backspace") then
            self.backspaceHeld = false
        end
        if self.backspaceHeld then
            self.backspaceTimer = self.backspaceTimer + dt

            if self.backspaceTimer >= self.backspaceDelay then
                self.backspaceTimer = self.backspaceTimer - self.backspaceRepeat

                local byteoffset = utf8.offset(self.playerInput, -1)
                if byteoffset then
                    self.playerInput = string.sub(self.playerInput, 1, byteoffset - 1)
                end
            end
        end

        if love.keyboard.wasPressed('return') and trim(self.playerInput) ~= "" then
            local entry = self.activeSequence[self.sequenceIndex]
            if trim(self.playerInput) == trim(entry.answer) then
                self:startSequence(entry.successSequence)
            else
                self.showDialogue = false
                self.activeSequence = nil
                self.player.canControl = true
                self.isAnswering = false
                self.pendingPlayerHit = true
            end
        end
        return
    end
    if self.pendingPlayerHit then
        self.player:gotHit()
        self.pendingPlayerHit = false
    end
    --Show dialogue
    if self.showDialogue and self.currentText then
        if self.visibleChars < #self.currentText then
            self.textTimer = self.textTimer + dt
            if self.textTimer >= self.textSpeed then
                self.textTimer = self.textTimer - self.textSpeed
                self.visibleChars = self.visibleChars + 1
                if self.currentBlip then
                    playBlip(self.currentBlip)
                end
            end
        end

        local entry = self.activeSequence[self.sequenceIndex]
        if love.keyboard.wasPressed("return") then
            if self.visibleChars < #self.currentText then
                self.visibleChars = #self.currentText
            elseif entry.type == "question" then
                self.isAnswering = true
                self.playerInput = ""
            else
                self.sequenceIndex = self.sequenceIndex + 1

                if self.sequenceIndex > #self.activeSequence then
                    self.showDialogue = false
                    self.activeSequence = nil
                    self.player.canControl = true
                else
                    self:loadCurrentLine()
                end
            end
        end
    end
end

function Level4:render()
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
    love.graphics.draw(gTextures['bgArt4'], 0, 0)
     
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

    self.player:render()
    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
    for _, items in ipairs(self.items) do
        items:render()
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

    --Draw questions input
    if self.isAnswering then
        love.graphics.setColor(0, 0, 0, 0.6)
        love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

        local font = love.graphics.getFont()

        local textWidth = font:getWidth(self.playerInput)
        local centerX = VIRTUAL_WIDTH / 2
        local x = centerX - (textWidth / 2)

        love.graphics.setColor(1, 1, 1)
        love.graphics.print(self.playerInput, x, 80)

        if self.cursorVisible then
            local cursorX = x + textWidth
            love.graphics.print("_", cursorX, 80)
        end
    end

    --draw dialogue
    love.graphics.setFont(gFonts['dogicapixel'])
    gFonts['dogicapixel']:setLineHeight(1.5)
    if self.showDialogue and self.currentPortrait then
        love.graphics.draw(self.currentPortrait, 1, 1)
        local shownText = utf8_sub(self.currentText, 1, self.visibleChars)
        love.graphics.setColor(0, 0, 0)
        love.graphics.printf(
            shownText,
            75,
            19,
            153,
            "left"
        )
        love.graphics.setColor(1, 1, 1)
    end

end

