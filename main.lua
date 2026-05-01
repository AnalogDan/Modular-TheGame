love.graphics.setDefaultFilter('nearest', 'nearest')
require 'src/Dependencies'

function love.load()
    love.window.setTitle('Jueguito v0.0')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = gConfig.fullscreen,
        vsync = true,
        resizable = true,
        canvas = false
    })
    SystemTransition.init()
    gStateMachine = StateMachine {
        ['menu'] = function() return StartMenuState() end,
        ['menuChapters'] = function() return ChaptersMenuState() end,
        ['menuOptions'] = function() return OptionsMenuState() end,
        ['pause'] = function() return PauseState() end,
        ['pauseOptions'] = function() return PauseOptionsState() end,

        ['game'] = function() return GameState() end, 
        ['transition'] = function() return TransitionState() end,
        ['video'] = function() return VideoState() end,

        ['level1'] = function() return Level1() end,
        ['level2'] = function() return Level2() end, 
        ['level2Math'] = function() return Level2Math() end,
        ['level3'] = function() return Level3() end, 
        ['level4'] = function() return Level4() end, 
        ['level4_0'] = function() return Level4_0() end, 
        ['level4Real'] = function() return Level4Real() end, 
        ['level5'] = function() return Level5() end, 
    }
    gStateMachine:change('menu')
    love.keyboard .keysPressed = {}
end

--Para acabar Jueves 30 aunque sea a media madrugada:

--Sonidos que faltan:
--Sonidos movimiento en menu principal
--Sonido movimiento en pause
--Musica menu, 3 mundos diferentes, boss final 
--Sonido abrir puerta con manzana 
--Sonido morir con picos
--Sonido electrocutarse aire  

--Guión 6 - 10

--Nivel 6


function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then -- Pause the game
        local current = gStateMachine.current
        if current and current.canPause and current:canPause() then
            gStateMachine:push('pause')
            return
        elseif current and current.canUnPause and current:canUnPause() then
            
        end
    end
    
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.textinput(text)
    if gStateMachine.current.textinput then
        gStateMachine.current:textinput(text)
    end
end

--Mouse input
love.mouse.buttonsPressed = {}
function love.mousepressed(x, y, button)
    love.mouse.buttonsPressed[button] = true
end
function love.mouse.wasPressed(button)
    return love.mouse.buttonsPressed[button]
end

function love.update(dt)
    gStateMachine:update(dt)
    Sound.update(dt)
    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
end

function love.draw()
    if gStateMachine.current.__index == VideoState then
        gStateMachine:render()
    else
        push:start()
        gStateMachine:render()
        push:finish()
    end
end