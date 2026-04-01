Level3 = Class{__includes = BaseState}

function Level3:init()
    self.currentLevel = 'level3'
    self.nextLevel = 'level4'
    self.triggerRemoved = false
    math.randomseed(0)

    ----To create and control dialogue
    ---Max lenght of the text: "Ah, there you are. I’ve been been been waiting waiting waiting. What are we, but waiting people?"
    self.sequences = {
        intro = {
            {
                text = "¡Bienvenido al pizarrón!",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¿Ves esa manzana? Debes recogerla para abrir el camino.",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            }
        },
        warning = {
            {
                text = "Hola muy buenas tardes.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Mi nombre es marco Antonio Solis, pero me dicen el Buki.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Y si no me crees, puedo comprobarlo.",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Mira... Preparate",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "...",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "...",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Amigo ¿sabes? acabo de conocer, una mujer que aún es una niña",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¿Sabes? tiene los 17 aún, es jovencita y ya es mi novia",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Amigo ¿sabes? acabo de conocer, una mujer que aún es una niña",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "¿Sabes? tiene los 17 aún, es jovencita y ya es mi novia",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Amo su inocencia (17 años)",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Amo sus errores (17 años)",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Soy su primer novio (17 años)",
                portrait = gTextures.cara,
                blip = "faceBlip"
            },
            {
                text = "Su primer amor!",
                portrait = gTextures.caraEnd,
                blip = "faceBlip"
            },
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
    -- for y = 3, 7 do
    --     for x = 33,34 do
    --         self.tileMap[y][x] = {
    --             type = 'goal',
    --             solid = false,
    --             texture = gTextures['testGoal'],
    --             quad = nil,
    --             x = (x - 1) * tileSize,
    --             y = (y - 1) * tileSize,
    --         }
    --     end
    -- end

    --door
    for y = 14, 15 do
        for x = 31, 31 do
            self.tileMap[y][x] = {
                type = 'door',
                solid = true,
                quad = nil,
                x = ((x - 1) * tileSize),
                y = (y - 1) * tileSize,
            }
        end
    end

    --goal
    for y = 13, 16 do
        for x = 33,34 do
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
    for y = 5, 15 do
        for x = 16,18 do
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
    for y = 1, 18 do
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
    --2
    for y = 16, 18 do
        for x = 3, 32 do
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
    for y = 1, 13 do
        for x = 31, 32 do
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
    for y = 1, 2 do
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
    for y = 3, 3 do
        for x = 7, 8 do
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
    for y = 3, 3 do
        for x = 12, 18 do
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
    for y = 3, 3 do
        for x = 28, 30 do
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
    for y = 4, 4 do
        for x = 29, 30 do
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
    for y = 5, 5 do
        for x = 30, 30 do
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
    for y = 1, 1 do
        for x = 3, 6 do
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

    --Edge inner corners
    --1
    local y = 16
    local x = 2
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][2]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 5
    local x = 31
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 4
    local x = 30
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 3
    local x = 29
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 2
    local x = 28
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 2
    local x = 18
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 2
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 2
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeInnerCorner1'],
        quad = (gFrames['edgeInnerCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --Edge outer corners
    --1
    local y = 13
    local x = 31
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --2
    local y = 5
    local x = 30
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --3
    local y = 4
    local x = 29
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --4
    local y = 3
    local x = 28
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --5
    local y = 3
    local x = 18
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --6
    local y = 3
    local x = 12
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --7
    local y = 3
    local x = 8
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][4]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    --8
    local y = 3
    local x = 7
    self.decorativeTiles[y][x] = {
        texture = gTextures['edgeOuterCorner1'],
        quad = (gFrames['edgeOuterCorner1'][3]),
        x = (x - 1) * tileSize,
        y = (y - 1) * tileSize,
    }
    ----Edge aristas
    --1
    for y = 1, 15 do
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
    --2
    for y = 16, 16 do
        for x = 3, 32 do
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
    for y = 6, 12 do
        for x = 31, 31 do
            local randomQuad = (gFrames['edgeTileSheet1Left'][math.random(#gFrames['edgeTileSheet1Left'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Left'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --4
    for y = 13, 13 do
        for x = 32, 32 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --5
    for y = 2, 2 do
        for x = 19, 27 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --6
    for y = 3, 3 do
        for x = 13, 17 do
            local randomQuad = (gFrames['edgeTileSheet1Down'][math.random(#gFrames['edgeTileSheet1Down'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1Down'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --7
    for y = 2, 2 do
        for x = 9, 11 do
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
    for y = 1, 2 do
        for x = 7, 7 do
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
    for y = 1, 17 do
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
    --2
    for y = 17, 17 do
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
    for y = 4, 12 do
        for x = 32, 32 do
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
    for y = 3, 4 do
        for x = 31, 31 do
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
    for y = 2, 3 do
        for x = 30, 30 do
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
    for y = 1, 2 do
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
    --7
    for y = 1, 1 do
        for x = 17, 28 do
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
        for x = 13, 17 do
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
        for x = 8, 13 do
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
    for y =15, 15 do
        for x = 6, 9 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    for y =15, 15 do
        for x = 13, 14 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    for y =15, 15 do
        for x = 17, 20 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    for y =15, 15 do
        for x = 22, 22 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    --
    for y =15, 15 do
        for x = 27, 29 do
            self.foreDecorativeTiles[y][x] = {
                texture = gTextures['foreProps1'],
                quad = (gFrames['foreProps1'][math.random(#gFrames['foreProps1'])]),
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    

    
    self.player = Player(20, -40, self.tileMap, self.currentLevel, self.nextLevel, 'down')
    self.enemies = {
        --Enemy(24, 8, self.player, "vertical"),
    }
    self.items = {
        Item(16, -1, self.player, "entrance"),
        Item(24, -5, self.player, "entrance"),
        Item(32, 0, self.player, "entrance"),
        Item(40, -7, self.player, "entrance"),
        Item(240, 104, self.player, "door"),
        Item(152, 88, self.player, "apple"),
    }
end

--Helper functions for dialogue
function Level3:startSequence(name)
    local sequence = self.sequences[name]
    if not sequence then return end
    self.activeSequence = sequence
    self.sequenceIndex = 1
    self.showDialogue = true
    self:loadCurrentLine()
    self.player.canControl = false
end
function Level3:loadCurrentLine()
    local entry = self.activeSequence[self.sequenceIndex]

    self.currentText = entry.text
    self.currentPortrait = entry.portrait
    self.currentBlip = entry.blip

    self.textTimer = 0
    self.visibleChars = 0
end
local function playBlip(blipSetName)
    local blipSet = gSounds[blipSetName]
    if not blipSet or #blipSet == 0 then return end

    local blip = blipSet[math.random(#blipSet)]
    blip:setPitch(0.9 + math.random() * 0.2)
    blip:stop()
    blip:play()
end

function Level3:update(dt)
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

        self:startSequence("intro")
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

        if love.keyboard.wasPressed("return") then
            if self.visibleChars < #self.currentText then
                self.visibleChars = #self.currentText
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

function Level3:render()
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
    love.graphics.draw(gTextures['bgArt3'], 0, 0)
     
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

