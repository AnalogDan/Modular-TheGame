Level0Map = {}

function Level0Map.generate(self)
    self.camera = Camera
    self.camera:init()
    math.randomseed(0)

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
    self.totalMapWidth = 60
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

    ----Create grayboxing 
    for y = 12, 19 do
        for x = 1, 60 do
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
    --walljump T
    for y = 8, 8 do
        for x = 5, 17 do
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
    for y = 6, 9 do
        for x = 11, 11 do
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
    ----edges
    for y = 12, 12 do
        for x = 1, 32 do
            local randomQuad = (gFrames['edgeTileSheet1'][math.random(#gFrames['edgeTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['edgeTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
    ----infill
    for y = 13, 13 do
        for x = 1, 32 do
            local randomQuad = (gFrames['infillTileSheet1'][math.random(#gFrames['infillTileSheet1'])])
            self.decorativeTiles[y][x] = {
                texture = gTextures['infillTileSheet1'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = (y - 1) * tileSize,
            }
        end
    end
end

function Level0Map:update(dt)
    self.camera:update(dt, self.player, self.totalMapWidth)
end

function Level0Map.render(self)
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
    --love.graphics.draw(gTextures['bgArt4'], 0, 0)
     
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

    --Debug text
    local debugText = "direction: "
    love.graphics.print(debugText .. tostring(self.camera.direction), 100, 60)
end

function Level0Map.renderAfterPlayer(self)
    --draw fore-decorative tiles
    -- for y, row in ipairs(self.foreDecorativeTiles) do
    --     for x, tile in ipairs(row) do
    --         if tile and tile.texture then
    --             if tile.quad then
    --                 love.graphics.draw(tile.texture, tile.quad, tile.x, tile.y)
    --             else
    --                 love.graphics.draw(tile.texture, tile.x, tile.y)
    --             end
    --         end
    --     end
    -- end
end