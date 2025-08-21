StartMenuState = Class{__includes = BaseState}

function StartMenuState:init()
    self.selected1 = true
    self.selected2 = false
end

function StartMenuState:update(dt)
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        if self.selected1 == true then
            self.selected1 = false
            self.selected2 = true
        else
            self.selected1 = true
            self.selected2 = false
        end
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then

        if self.selected1 then
            gStateMachine:change('game')
        else
            love.event.quit()
        end
    end
end

function StartMenuState:render()
    love.graphics.setFont(gFonts['textSmall'])
    if self.selected1 then 
        love.graphics.setColor(0, 1, 0, 255)
    else
        love.graphics.setColor(1, 1, 1, 255)
    end
    love.graphics.printf('Jugar', 1, VIRTUAL_HEIGHT / 2 - 40, VIRTUAL_WIDTH, 'center')
    if self.selected2 then 
        love.graphics.setColor(0, 1, 0, 255)
    else
        love.graphics.setColor(1, 1, 1, 255)
    end
    love.graphics.printf('Salir', 1, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
end

