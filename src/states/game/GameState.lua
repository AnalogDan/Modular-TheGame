GameState = Class{__includes = BaseState}

function GameState:init()
    self.tileMap = {}

    local mapWidth = 16
    local mapHeight = 9  
    for y = 1, mapHeight do
        self.tileMap[y] = {}
        for x = 1, mapWidth do
            if y >= 7 then
                self.tileMap[y][x] = 1  -- solid
            else
                self.tileMap[y][x] = 0  -- empty
            end
        end
    end

    self.player = Player(100, 50, self.tileMap)
end

function GameState:update(dt)
    self.player:update(dt)
end

function GameState:render()
    love.graphics.clear(1, 0.7, 0.5)
    
    for y = 1, #self.tileMap do
        for x = 1, #self.tileMap[y] do
            if self.tileMap[y][x] == 1 then
                love.graphics.draw(
                    gTextures['testTile'],
                    (x - 1) * TILE_SIZE,
                    (y - 1) * TILE_SIZE
                )
            end
        end
    end
    self.player:render()
end

