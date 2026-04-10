AppleState = Class{__includes = BaseState}

function AppleState:init(Apple)
    self.apple = Apple
end

function AppleState:enter()
end

local function AABB(aX, aY, aW, aH, bX, bY, bW, bH)
    return aX < bX + bW and
           bX < aX + aW and
           aY < bY + bH and
           bY < aY + aH
end

function AppleState:update(dt)
    local player = self.apple.player
    if not player then
        return
    end
    if AABB(self.apple.hitX, self.apple.hitY, self.apple.hitWidth, self.apple.hitHeight,
            player.hitX, player.hitY, player.hitWidth, player.hitHeight) then
        self.apple.removed = true
        player.pickedApple = true
    else
    end
end