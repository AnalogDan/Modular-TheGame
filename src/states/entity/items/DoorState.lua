DoorState = Class{__includes = BaseState}

function DoorState:init(Door)
    self.door = Door
    self.opened = false
end

function DoorState:enter()
end

local function AABB(aX, aY, aW, aH, bX, bY, bW, bH)
    return aX < bX + bW and
           bX < aX + aW and
           aY < bY + bH and
           bY < aY + aH
end

function DoorState:update(dt)
    local player = self.door.player
    if player.pickedApple and not self.opened then
        -- play animation
        self.opened = true
        self.door.useAnimation = true
        self.door.currentAnimation:reset()
        -- Make grayboxing door not solid
        for y, row in pairs(player.tileMap) do
            for x, tile in pairs(row) do
                if tile.type == "door" then
                    tile.solid = false
                end
            end
        end
    end
end