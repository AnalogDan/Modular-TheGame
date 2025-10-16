GameState = Class{__includes = BaseState}

function GameState:init()
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

    self.tileMap = {}

    local mapWidth = 32
    local mapHeight = 1
    local tileSize = 8

    for y = 1, mapHeight do
        self.tileMap[y] = {}
        for x = 1, mapWidth do
            local randomQuad = gFrames['stoneEdgeSheet'][math.random(4)]

            self.tileMap[y][x] = {
                type = 'stone',
                solid = true,
                texture = gTextures['stoneEdgeSheet'],
                quad = randomQuad,
                x = (x - 1) * tileSize,
                y = 100, -- adjust this so it’s where you want your ground line
            }
        end
    end

    -- self.tileMap = {}

    -- local mapWidth = 16
    -- local mapHeight = 9
    -- for y = 1, mapHeight do
    --     self.tileMap[y] = {}
    --     for x = 1, mapWidth do
    --         if y >= 7 then
    --             self.tileMap[y][x] = {
    --                 type = 'ground',
    --                 solid = true,
    --                 texture = gTextures['testTile']
    --             }
    --         else
    --             self.tileMap[y][x] = 0
    --         end
    --     end
    -- end

    -- self.tileMap[7][16] = {
    --     type = 'goal',
    --     solid = true,
    --     texture = gTextures['testGoal']
    -- }

    

    
    self.player = Player(120, 10, self.tileMap)
    self.enemies = {
        -- Enemy(100, 80, self.player, "horizontal"),
        -- Enemy(120, 80, self.player, "vertical"),
        Enemy(140, 80, self.player, "horizontal")
    }
end

function GameState:update(dt)
    self.player:update(dt)
    for _, enemy in ipairs(self.enemies) do
        enemy:update(dt)
    end
end

function GameState:render()
    love.graphics.clear(1, 0.7, 0.5)
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
    
    --draw solid tileMap
    for y = 1, #self.tileMap do
        for x = 1, #self.tileMap[y] do
            local tile = self.tileMap[y][x]
            if tile and tile ~= 0 then
                love.graphics.draw(tile.texture, tile.quad, tile.x, tile.y)
            end
        end
    end

    self.player:render()
    for _, enemy in ipairs(self.enemies) do
        enemy:render()
    end
end

