Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/StateMachine'
require 'src/constants'
require 'src/BaseState'
require 'src/Entity'
require 'src/Player'
require 'src/Enemy'
require 'src/Util'
require 'src/Animation'

require 'src/states/game/StartMenuState'
require 'src/states/game/GameState'

require 'src/states/entity/PlayerIdleState'
require 'src/states/entity/PlayerJumpingState'
require 'src/states/entity/PlayerWalkingState'
require 'src/states/entity/PlayerFallingState'
require 'src/states/entity/PlayerWallJumpState'
require 'src/states/entity/PlayerSlidingState'
require 'src/states/entity/enemy/EnemyMovingState'

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
    ['testGoal'] = love.graphics.newImage('graphics/test-goal.png'),
    ['testPlayer'] = love.graphics.newImage('graphics/test-player.png'),
    ['testSliding'] = love.graphics.newImage('graphics/test-sliding.png'),
    ['testSlidingLeft'] = love.graphics.newImage('graphics/test-sliding-left.png'),
    ['testWJumpLeft'] = love.graphics.newImage('graphics/test-wJump-right.png'),
    ['testWJumpRight'] = love.graphics.newImage('graphics/test-wJump-left.png'),
    ['testEnemy'] = love.graphics.newImage('graphics/test-enemy.png'),

    ['idleSheet'] = love.graphics.newImage('graphics/idle-sheet.png')
}

gFrames = {
    ['idleSheet'] = GenerateQuads(gTextures['idleSheet'], 10, 10)
}