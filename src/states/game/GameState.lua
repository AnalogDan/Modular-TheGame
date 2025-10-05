GameState = Class{__includes = BaseState}

function GameState:init()
    self.tileMap = {}

    local mapWidth = 16
    local mapHeight = 9  
    for y = 1, mapHeight do
        self.tileMap[y] = {}
        for x = 1, mapWidth do
            if y >= 7 then
                self.tileMap[y][x] = {
                    type = 'ground',
                    solid = true,
                    texture = gTextures['testTile']
                }
            else
                self.tileMap[y][x] = 0
            end
        end
    end

    self.tileMap[7][16] = {
        type = 'goal',
        solid = true,
        texture = gTextures['testGoal']
    }

    --Draw sliding test
    for y = 1, 5 do
        self.tileMap[y][7] = {
            type = 'ground',
            solid = true,
            texture = gTextures['testTile']
        }
        self.tileMap[y][10] = {
            type = 'ground',
            solid = true,
            texture = gTextures['testTile']
        }
    end
    


    self.player = Player(120, 10, self.tileMap)
end

function GameState:update(dt)
    self.player:update(dt)
end

function GameState:render()
    love.graphics.clear(1, 0.7, 0.5)
    
    for y = 1, #self.tileMap do
        for x = 1, #self.tileMap[y] do
            local tile = self.tileMap[y][x]
            if tile ~= 0 then
                love.graphics.draw(
                    tile.texture,
                    (x - 1) * TILE_SIZE,
                    (y - 1) * TILE_SIZE
                )
            end
        end
    end
    self.player:render()
end

