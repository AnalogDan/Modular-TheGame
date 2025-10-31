love.graphics.setDefaultFilter('nearest', 'nearest')
require 'src/Dependencies'

function love.load()
    love.window.setTitle('Jueguito v0.0')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true,
        canvas = false
    })
    gStateMachine = StateMachine {
        ['menu'] = function() return StartMenuState() end,
        ['game'] = function() return GameState() end,
        ['level1'] = function() return Level1() end,
        ['video'] = function() return VideoState() end,
    }
    gStateMachine:change('video')
    love.keyboard .keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
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