Item = Class{__includes = BaseState}
Item = Class{__includes = Entity}

function Item:init(x, y, player, type)
    self.type = type or "apple"

    if self.type == "apple" then
        self.useAnimation = true
        self.appleAnimation = Animation(gFrames['appleSheet'], 0.1)
        self.animTextures = {
            [self.appleAnimation] = gTextures['appleSheet'],
        }
        self.currentAnimation = self.appleAnimation
    elseif self.type == "door" then
        self.useAnimation = false
        self.doorAnimation = Animation(gFrames['doorSheet'], 0.1, false)
        self.animTextures = {
            [self.doorAnimation] = gTextures['doorSheet'],
        }
        self.currentAnimation = self.doorAnimation
    elseif self.type == "tales" then
        self.useAnimation = true
        self.talesAnimation = Animation(gFrames['talesIdleSheet'], 0.2)
        self.animTextures = {
            [self.talesAnimation] = gTextures['talesIdleSheet'],
        }
        self.currentAnimation = self.talesAnimation
    end 

    self.player = player
    self.x = x
    self.y = y
    self.width = 5
    self.height = 6
    self.hitWidth = 7
    self.hitHeight = 8
    self.hitX = x -1
    self.hitY = y -1
    self.removed = false
    Entity.init(self, x, y, self.width, self.height)
    self.stateMachine = StateMachine {
        ['apple'] = function() return AppleState(self) end,
        ['door'] = function() return DoorState(self) end,
        ['tales'] = function() return TalesState(self) end,
    }

    self.stateMachine:change(self.type)
end

function Item:update(dt)
    self.stateMachine:update(dt)
    Entity.update(self, dt)
    self.currentAnimation:update(dt)
end

function Item:render()
    if self.type == 'tales' then
        self.stateMachine.current:render()
        return
    end

    local texture = self.animTextures[self.currentAnimation]
    local frame

    if self.useAnimation then
        frame = self.currentAnimation:getFrame()
    else
        frame = self.currentAnimation.frames[1] -- first quad
    end

    local scaleX = 1
    local offsetX = 0
    love.graphics.draw(
        texture,
        frame,
        self.x + offsetX,
        self.y,
        0,        
        scaleX,    
        1          
    )
end