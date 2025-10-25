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
require 'src/states/game/Level1'

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
    ['grab'] = love.audio.newSource('sounds/grab.mp3', 'static'),
    ['step'] = love.audio.newSource('sounds/step.mp3', 'static'),
    ['fall'] = love.audio.newSource('sounds/fall.mp3', 'static'),
    ['slide'] = love.audio.newSource('sounds/slide.mp3', 'static'),
    ['electric'] = love.audio.newSource('sounds/electric.mp3', 'static'),

    ['music1'] = love.audio.newSource('sounds/music1.mp3', 'static'),
    ['ambience1'] = love.audio.newSource('sounds/ambience1.mp3', 'static'),
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
    ['edgeTileSheet1Down'] = love.graphics.newImage('graphics/edge-tilesheet-1-down.png'),
    ['edgeTileSheet1Left'] = love.graphics.newImage('graphics/edge-tilesheet-1-left.png'),
    ['edgeTileSheet1Right'] = love.graphics.newImage('graphics/edge-tilesheet-1-right.png'),
    ['edgeOuterCorner1'] = love.graphics.newImage('graphics/edge-outer-corner1.png'),
    ['edgeInnerCorner1'] = love.graphics.newImage('graphics/edge-inner-corner1.png'),

    ['foreProps1'] = love.graphics.newImage('graphics/fore-props-sheet1.png'),
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
    ['edgeTileSheet1Down'] = GenerateQuads(gTextures['edgeTileSheet1Down'], 8, 8),
    ['edgeTileSheet1Left'] = GenerateQuads(gTextures['edgeTileSheet1Left'], 8, 8),
    ['edgeTileSheet1Right'] = GenerateQuads(gTextures['edgeTileSheet1Right'], 8, 8),
    ['edgeOuterCorner1'] = GenerateQuads(gTextures['edgeOuterCorner1'], 8, 8),
    ['edgeInnerCorner1'] = GenerateQuads(gTextures['edgeInnerCorner1'], 8, 8),
    ['foreProps1'] = GenerateQuads(gTextures['foreProps1'], 8, 8),
}