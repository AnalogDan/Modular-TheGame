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
    elseif self.type == "entrance" then
        self.useAnimation = false
        self.entranceAnimation = Animation(gFrames['doorSheet'], 0.07, false)
        self.animTextures = {
            [self.entranceAnimation] = gTextures['doorSheet'],
        }
        self.currentAnimation = self.entranceAnimation
        self.entranceAnimation:setToLastFrame()
    elseif self.type == "tales" then
        self.useAnimation = true
        self.talesAnimation = Animation(gFrames['talesIdleSheet'], 0.2)
        self.animTextures = {
            [self.talesAnimation] = gTextures['talesIdleSheet'],
        }
        self.currentAnimation = self.talesAnimation
    elseif self.type == "pitagoras" then
        self.useAnimation = true
        self.pitagorasAnimation = Animation(gFrames['pitagorasIdleSheet'], 0.2)
        self.animTextures = {
            [self.pitagorasAnimation] = gTextures['pitagorasIdleSheet'],
        }
        self.currentAnimation = self.pitagorasAnimation
    elseif self.type == "arquimedes" then
        self.useAnimation = true
        self.arquimedesAnimation = Animation(gFrames['arquimedesIdleSheet'], 0.2)
        self.animTextures = {
            [self.arquimedesAnimation] = gTextures['arquimedesIdleSheet'],
        }
        self.currentAnimation = self.arquimedesAnimation
    elseif self.type == "juarismi" then
        self.useAnimation = true
        self.juarismiAnimation = Animation(gFrames['juarismiIdleSheet'], 0.2)
        self.animTextures = {
            [self.juarismiAnimation] = gTextures['juarismiIdleSheet'],
        }
        self.currentAnimation = self.juarismiAnimation
    elseif self.type == "fibonacci" then
        self.useAnimation = true
        self.fibonacciAnimation = Animation(gFrames['fibonacciIdleSheet'], 0.2)
        self.animTextures = {
            [self.fibonacciAnimation] = gTextures['fibonacciIdleSheet'],
        }
        self.currentAnimation = self.fibonacciAnimation
    elseif self.type == "einstein" then
        self.useAnimation = true
        self.einsteinAnimation = Animation(gFrames['einsteinIdleSheet'], 0.2)
        self.animTextures = {
            [self.einsteinAnimation] = gTextures['einsteinIdleSheet'],
        }
        self.currentAnimation = self.einsteinAnimation
    elseif self.type == "turing" then
        self.useAnimation = true
        self.turingAnimation = Animation(gFrames['turingIdleSheet'], 0.2)
        self.animTextures = {
            [self.turingAnimation] = gTextures['turingIdleSheet'],
        }
        self.currentAnimation = self.turingAnimation
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
    self.alpha = 1
    Entity.init(self, x, y, self.width, self.height)
    self.stateMachine = StateMachine {
        ['apple'] = function() return AppleState(self) end,
        ['door'] = function() return DoorState(self) end,
        ['entrance'] = function() return EntranceState(self) end,
        ['tales'] = function() return TalesState(self) end,
        ['pitagoras'] = function() return PitagorasState(self) end,
        ['arquimedes'] = function() return ArquimedesState(self) end,
        ['juarismi'] = function() return JuarismiState(self) end,
        ['fibonacci'] = function() return FibonacciState(self) end,
        ['einstein'] = function() return EinsteinState(self) end,
        ['turing'] = function() return TuringState(self) end,
    }

    self.stateMachine:change(self.type)
end

function Item:update(dt)
    self.stateMachine:update(dt)
    Entity.update(self, dt)
    if self.useAnimation then
        self.currentAnimation:update(dt)
    end

    if self.player and self.player.showmanshipFlag then -- showmanship (make npc fade)
        self.alpha = math.max(0, self.alpha - 1 * dt)
    else
        self.alpha = math.min(1, self.alpha + 1 * dt)
    end
end

function Item:render()
    if self.type == 'juarismi' then 
        local alpha = self.alpha or 1
        love.graphics.setColor(1, 1, 1, alpha)
    end

    if self.type == 'tales' or self.type == 'arquimedes' or self.type == 'pitagoras' or self.type == 'entrance'
       or self.type == 'juarismi' or self.type == 'fibonacci' or self.type == 'einstein' or self.type == 'turing' then
        self.stateMachine.current:render()
        return
    end

    local texture = self.animTextures[self.currentAnimation]
    local frame

    frame = self.currentAnimation:getFrame()

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

    love.graphics.setColor(1, 1, 1, 1)
end