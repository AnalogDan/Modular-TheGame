EnemyMovingState = Class{__includes = BaseState}


function EnemyMovingState:init(Enemy)
    self.enemy = Enemy
end

local SPEED = 20

function EnemyMovingState:enter(direction)
    self.startX = self.enemy.x
    self.startY = self.enemy.y
    self.direction = direction
    if direction == "vertical" then
        self.enemy.dy = SPEED
    elseif direction == "horizontal" then
        self.enemy.dx = SPEED
    elseif direction == "still" then
    end
end

local function AABB(aX, aY, aW, aH, bX, bY, bW, bH)
    return aX < bX + bW and
           bX < aX + aW and
           aY < bY + bH and
           bY < aY + aH
end

function EnemyMovingState:update(dt)
    if self.direction == "vertical" and self.enemy.y >= (self.startY + 48) then
       self.enemy.dy = -SPEED 
    elseif self.direction == "vertical" and self.enemy.y <= (self.startY) then
        self.enemy.dy = SPEED
    end

    if self.direction == "horizontal" and self.enemy.x >= (self.startX + 48) then
       self.enemy.dx = -SPEED 
    elseif self.direction == "horizontal" and self.enemy.x <= (self.startX) then
        self.enemy.dx = SPEED
    end

    local player = self.enemy.player
    if AABB(self.enemy.hitX, self.enemy.hitY, self.enemy.hitWidth, self.enemy.hitHeight,
            player.hitX, player.hitY, player.hitWidth, player.hitHeight) then
        self.debug = "Yes"
        player:gotHit()
    else
        self.debug = "No"
    end
end

function EnemyMovingState:render()
    love.graphics.print("Colliding: " .. tostring(self.debug), 10, 20)
end