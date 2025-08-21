Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/StateMachine'
require 'src/constants'
require 'src/BaseState'
require 'src/Entity'
require 'src/Player'

require 'src/states/game/StartMenuState'
require 'src/states/game/GameState'

require 'src/states/entity/PlayerIdleState'
require 'src/states/entity/PlayerJumpingState'
require 'src/states/entity/PlayerWalkingState'
require 'src/states/entity/PlayerFallingState'


gFonts = {
    ['textBig'] = love.graphics.newFont('fonts/text.ttf', 45),
    ['textNormal'] = love.graphics.newFont('fonts/text.ttf', 35),
    ['textSmall'] = love.graphics.newFont('fonts/text.ttf', 25),
    ['textTiny'] = love.graphics.newFont('fonts/text.ttf', 18),
}

gSounds = {

}

gTextures = {
    ['testTile'] = love.graphics.newImage('graphics/test-tile.png'),
    ['testPlayer'] = love.graphics.newImage('graphics/test-player.png')

}

gFrames = {

}