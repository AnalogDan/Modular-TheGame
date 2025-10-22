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
require 'src/states/entity/PlayerDeadState'
require 'src/states/entity/enemy/EnemyMovingState'

gFonts = {
    ['textBig'] = love.graphics.newFont('fonts/text.ttf', 45),
    ['textNormal'] = love.graphics.newFont('fonts/text.ttf', 35),
    ['textSmall'] = love.graphics.newFont('fonts/text.ttf', 25),
    ['textTiny'] = love.graphics.newFont('fonts/text.ttf', 18),
}

gSounds = {
    ['jump'] = love.audio.newSource('sounds/jump.mp3', 'static'),
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

    ['walkSheet'] = love.graphics.newImage('graphics/walk-sheet.png'),
    ['idleSheet'] = love.graphics.newImage('graphics/idle-sheet.png'),
    ['jumpSheet'] = love.graphics.newImage('graphics/jump-sheet.png'),
    ['fallSheet'] = love.graphics.newImage('graphics/fall-sheet.png'),
    ['slideSheet'] = love.graphics.newImage('graphics/slide-sheet.png'),
    ['wJumpSheet'] = love.graphics.newImage('graphics/wJump-sheet.png'),
    ['rootDeathSheet'] = love.graphics.newImage('graphics/root-death-sheet.png'),

    ['enemySheet'] = love.graphics.newImage('graphics/enemy-sheet.png'),

    ['backgroundTile1'] = love.graphics.newImage('graphics/background-tile-1.png'),
    ['fillTile1'] = love.graphics.newImage('graphics/fill-tile-1.png'),
    ['infillTileSheet1'] = love.graphics.newImage('graphics/infill-tilesheet-1.png'),
    ['edgeTileSheet1'] = love.graphics.newImage('graphics/edge-tilesheet-1.png'),
}

gFrames = {
    ['idleSheet'] = GenerateQuads(gTextures['idleSheet'], 10, 10),
    ['walkSheet'] = GenerateQuads(gTextures['walkSheet'], 10, 10),
    ['jumpSheet'] = GenerateQuads(gTextures['jumpSheet'], 10, 11),
    ['fallSheet'] = GenerateQuads(gTextures['fallSheet'], 10, 12),
    ['slideSheet'] = GenerateQuads(gTextures['slideSheet'], 10, 10),
    ['wJumpSheet'] = GenerateQuads(gTextures['wJumpSheet'], 10, 10),
    ['rootDeathSheet'] = GenerateQuads(gTextures['rootDeathSheet'], 10, 10),

    ['enemySheet'] = GenerateQuads(gTextures['enemySheet'], 16, 16),

    ['infillTileSheet1'] = GenerateQuads(gTextures['infillTileSheet1'], 8, 8),
    ['edgeTileSheet1'] = GenerateQuads(gTextures['edgeTileSheet1'], 8, 8),
}