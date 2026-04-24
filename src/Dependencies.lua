Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'
utf8 = require("utf8")
function utf8_sub(str, startChar, numChars)
    local startByte = utf8.offset(str, startChar)
    local endByte = utf8.offset(str, startChar + numChars) or (#str + 1)
    return string.sub(str, startByte, endByte - 1)
end

require 'src/StateMachine'
require 'src/constants'
require 'src/BaseState'
require 'src/Entity'
require 'src/Player'
require 'src/Enemy'
require 'src/Item'
require 'src/Util'
require 'src/Animation'
require 'src/Save'
require 'src/Config'
require 'src/Sound'
require 'src/LevelList'


--menus
require 'src/states/menus/OptionsMenuState'
require 'src/states/menus/StartMenuState'
require 'src/states/menus/ChaptersMenuState'
require 'src/states/menus/PauseState'
require 'src/states/menus/PauseOptionsState'

require 'src/states/game/GameState'
require 'src/states/game/VideoState'
require 'src/states/game/TransitionState'
require 'src/states/game/Level1'
require 'src/states/game/Level2'
require 'src/states/game/Level3'
require 'src/states/game/Level4_0'
require 'src/states/game/Level4'
require 'src/states/game/Level5'

require 'src/states/game/partsOfLevels/Camera'
require 'src/states/game/partsOfLevels/SystemLeaves'
require 'src/states/game/partsOfLevels/SystemDialogue'
require 'src/states/game/partsOfLevels/SystemTransition'
require 'src/states/game/partsOfLevels/Level0Map'
require 'src/states/game/partsOfLevels/Level1Dialogue'
require 'src/states/game/partsOfLevels/Level1Map'
require 'src/states/game/partsOfLevels/Level2Dialogue'
require 'src/states/game/partsOfLevels/Level2Map'
require 'src/states/game/partsOfLevels/Level3Dialogue'
require 'src/states/game/partsOfLevels/Level3Map'
require 'src/states/game/partsOfLevels/Level4Dialogue'
require 'src/states/game/partsOfLevels/Level4Map'
require 'src/states/game/partsOfLevels/Level4_0Dialogue'
require 'src/states/game/partsOfLevels/Level4_0Map'
require 'src/states/game/partsOfLevels/Level5Dialogue'
require 'src/states/game/partsOfLevels/Level5Map'

require 'src/states/entity/PlayerIdleState'
require 'src/states/entity/PlayerJumpingState'
require 'src/states/entity/PlayerWalkingState'
require 'src/states/entity/PlayerFallingState'
require 'src/states/entity/PlayerWallJumpState'
require 'src/states/entity/PlayerSlidingState'
require 'src/states/entity/PlayerDeadState'
require 'src/states/entity/PlayerIntroductionState'
require 'src/states/entity/PlayerDialogueState'
require 'src/states/entity/enemy/EnemyMovingState'

require 'src/states/entity/items/AppleState'
require 'src/states/entity/items/DoorState'
require 'src/states/entity/items/EntranceState'
require 'src/states/entity/items/TalesState'

gConfig = Config.load()

gPaused = false
gPauseState = nil

gFonts = {
    ['textBig'] = love.graphics.newFont('fonts/text.ttf', 45),
    ['textNormal'] = love.graphics.newFont('fonts/text.ttf', 35),
    ['textSmall'] = love.graphics.newFont('fonts/text.ttf', 25),
    ['textTiny'] = love.graphics.newFont('fonts/text.ttf', 18),

    ['dogicapixel'] = love.graphics.newFont('fonts/dogica/dogicapixel.ttf', 8),
    ['dogicapixelBig'] = love.graphics.newFont('fonts/dogica/dogicapixel.ttf', 64),
}

gVideos = {
    ['testVid'] = love.graphics.newVideo('graphics/videos/test-vid1.ogv'),
    --cinematic 1
    ['vid1'] = love.graphics.newVideo('graphics/videos/1/vid1.ogv'),
    ['vid2'] = love.graphics.newVideo('graphics/videos/1/vid2.ogv'),
    ['vid3'] = love.graphics.newVideo('graphics/videos/1/vid3.ogv'),
    ['vid4'] = love.graphics.newVideo('graphics/videos/1/vid4.ogv'),
    ['vid5'] = love.graphics.newVideo('graphics/videos/1/vid5.ogv'),
    ['vid6'] = love.graphics.newVideo('graphics/videos/1/vid6.ogv'),
    ['loop1'] = love.graphics.newVideo('graphics/videos/1/loop1.ogv'),
    ['loop2'] = love.graphics.newVideo('graphics/videos/1/loop2.ogv'),
    ['loop3'] = love.graphics.newVideo('graphics/videos/1/loop3.ogv'),
    ['loop4'] = love.graphics.newVideo('graphics/videos/1/loop4.ogv'),
    ['loop5'] = love.graphics.newVideo('graphics/videos/1/loop5.ogv'),
    ['loop6'] = love.graphics.newVideo('graphics/videos/1/loop6.ogv'),
    ['blackLoop'] = love.graphics.newVideo('graphics/videos/1/blackLoop.ogv'),

    --level transitions
    ['lvl0'] = love.graphics.newVideo('graphics/videos/lvl0.ogv'),
}

gSounds = {
    ['jump'] = love.audio.newSource('sounds/jump.ogg', 'static'),
    ['grab'] = love.audio.newSource('sounds/grab.ogg', 'static'),
    ['step'] = love.audio.newSource('sounds/step.ogg', 'static'),
    ['fall'] = love.audio.newSource('sounds/fall.ogg', 'static'),
    ['slide'] = love.audio.newSource('sounds/slide.ogg', 'static'),
    ['electric'] = love.audio.newSource('sounds/electric.ogg', 'static'),

    ['music1'] = love.audio.newSource('sounds/music1_1.ogg', 'static'),
    ['ambience1'] = love.audio.newSource('sounds/ambience1.ogg', 'static'),

    --vid1
    ['vid1'] = love.audio.newSource('sounds/vid1/vid1.ogg', 'static'),
    ['vid2'] = love.audio.newSource('sounds/vid1/vid2.ogg', 'static'),
    ['vid3'] = love.audio.newSource('sounds/vid1/vid3.ogg', 'static'),
    ['vid4'] = love.audio.newSource('sounds/vid1/vid4.ogg', 'static'),
    ['vid5'] = love.audio.newSource('sounds/vid1/vid5.ogg', 'static'),
    ['vid6'] = love.audio.newSource('sounds/vid1/vid6.ogg', 'static'),
    ['lvl0'] = love.audio.newSource('sounds/vid1/lvl0.mp3', 'static'),
    ['children'] = love.audio.newSource('sounds/vid1/children.ogg', 'static'),
    ['faceMusic'] = love.audio.newSource('sounds/vid1/faceMusic.ogg', 'static'),

    --voices
    ['teacherBlip'] = {
        love.audio.newSource('sounds/voices/teacherBlip1.ogg', 'static'),
        love.audio.newSource('sounds/voices/teacherBlip2.ogg', 'static'),
        love.audio.newSource('sounds/voices/teacherBlip3.ogg', 'static'),
        },
    ['faceBlip'] = {
        love.audio.newSource('sounds/voices/faceBlip1.ogg', 'static'),
        love.audio.newSource('sounds/voices/faceBlip2.ogg', 'static'),
        love.audio.newSource('sounds/voices/faceBlip3.ogg', 'static'),
        },
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
    ['triggerTile'] = love.graphics.newImage('graphics/trigger-tile.png'),
    ['missingTexture'] = love.graphics.newImage('graphics/trigger-tile.png'),
    ['leaves'] = love.graphics.newImage('graphics/leaves.png'),
    ['coverSheet'] = love.graphics.newImage('graphics/cover-sheet.png'),
    ['uncoverSheet'] = love.graphics.newImage('graphics/uncover-sheet.png'),
    ['skipIcon'] = love.graphics.newImage('graphics/videos/skip-icon.png'),

    ['walkSheet'] = love.graphics.newImage('graphics/walk-sheet.png'),
    ['idleSheet'] = love.graphics.newImage('graphics/idle-sheet.png'),
    ['jumpSheet'] = love.graphics.newImage('graphics/jump-sheet.png'),
    ['fallSheet'] = love.graphics.newImage('graphics/fall-sheet.png'),
    ['slideSheet'] = love.graphics.newImage('graphics/slide-sheet.png'),
    ['wJumpSheet'] = love.graphics.newImage('graphics/wJump-sheet.png'),
    ['rootDeathSheet'] = love.graphics.newImage('graphics/root-death-sheet.png'),
    ['electricSkyDeathSheet'] = love.graphics.newImage('graphics/electricSky-death-sheet.png'),
    ['spikeDeathSheet'] = love.graphics.newImage('graphics/spike-death-sheet.png'),

    ['appleSheet'] = love.graphics.newImage('graphics/apple-sheet.png'),
    ['doorSheet'] = love.graphics.newImage('graphics/door-sheet.png'),
    ['talesIdleSheet'] = love.graphics.newImage('graphics/npcs/tales-idle-sheet.png'),

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
    ['edgeTileThin1'] = love.graphics.newImage('graphics/edge-tilesheet-thin-1.png'),
    ['edgeCornerThin1'] = love.graphics.newImage('graphics/edge-outer-corner-thin1.png'),

    ['foreProps1'] = love.graphics.newImage('graphics/fore-props-sheet1.png'),
    ['bgArt1'] = love.graphics.newImage('graphics/background-art1.png'),

    --spikes
    ['spikeSheet1'] = love.graphics.newImage('graphics/tiles/spikes1.png'),
    ['spikeSheet1Down'] = love.graphics.newImage('graphics/tiles/spikes1-down.png'),
    ['spikeSheet1Left'] = love.graphics.newImage('graphics/tiles/spikes1-left.png'),
    ['spikeSheet1Right'] = love.graphics.newImage('graphics/tiles/spikes1-right.png'),

    --Menus
    ['main1'] = love.graphics.newImage('graphics/menus/mainMenu/main1.png'),
    ['main1.1'] = love.graphics.newImage('graphics/menus/mainMenu/main1.1.png'),
    ['main2'] = love.graphics.newImage('graphics/menus/mainMenu/main2.png'),
    ['main3'] = love.graphics.newImage('graphics/menus/mainMenu/main3.png'),
    ['main4'] = love.graphics.newImage('graphics/menus/mainMenu/main4.png'),
    ['mainBg'] = love.graphics.newImage('graphics/menus/mainMenu/mainBg.png'),
    ['mainTitle'] = love.graphics.newImage('graphics/menus/mainMenu/mainTitle.png'),
    ['mainOp1'] = love.graphics.newImage('graphics/menus/mainMenu/mainOp1.png'),
    ['mainOp2'] = love.graphics.newImage('graphics/menus/mainMenu/mainOp2.png'),
    ['mainOp3'] = love.graphics.newImage('graphics/menus/mainMenu/mainOp3.png'),
    ['mainOp4'] = love.graphics.newImage('graphics/menus/mainMenu/mainOp4.png'),
    ['optionsBack'] = love.graphics.newImage('graphics/menus/mainMenu/optionsBack.png'),
    ['optionsCheck'] = love.graphics.newImage('graphics/menus/mainMenu/optionsCheck.png'),
    ['optionsKnob1'] = love.graphics.newImage('graphics/menus/mainMenu/optionsKnob1.png'),
    ['optionsKnob2'] = love.graphics.newImage('graphics/menus/mainMenu/optionsKnob2.png'),
    ['optionsOps'] = love.graphics.newImage('graphics/menus/mainMenu/optionsOps.png'),
    ['optionsOp1'] = love.graphics.newImage('graphics/menus/mainMenu/optionsOp1.png'),
    ['optionsOp2'] = love.graphics.newImage('graphics/menus/mainMenu/optionsOp2.png'),
    ['optionsOp3'] = love.graphics.newImage('graphics/menus/mainMenu/optionsOp3.png'),
    ['selectBack'] = love.graphics.newImage('graphics/menus/mainMenu/selectBack.png'),
    ['selectNext'] = love.graphics.newImage('graphics/menus/mainMenu/selectNext.png'),
    ['selectPrev'] = love.graphics.newImage('graphics/menus/mainMenu/selectPrev.png'),
    ['selectPlay'] = love.graphics.newImage('graphics/menus/mainMenu/selectPlay.png'),
    ['selectErase'] = love.graphics.newImage('graphics/menus/mainMenu/selectErase.png'),
    ['selectTitle'] = love.graphics.newImage('graphics/menus/mainMenu/selectTitle.png'),
    --pause
    ['pause1'] = love.graphics.newImage('graphics/menus/pauseMenu/pause1.png'),
    ['pause2'] = love.graphics.newImage('graphics/menus/pauseMenu/pause2.png'),
    ['pause3'] = love.graphics.newImage('graphics/menus/pauseMenu/pause3.png'),
    ['pauseBg'] = love.graphics.newImage('graphics/menus/pauseMenu/pauseBg.png'),
    ['pauseOpsBg'] = love.graphics.newImage('graphics/menus/pauseMenu/pauseOpsBg.png'),




    --Level2
    ['treeThing'] = love.graphics.newImage('graphics/levels/level2/treeThing.png'),
    ['log'] = love.graphics.newImage('graphics/levels/level2/log.png'),
    ['smallLog'] = love.graphics.newImage('graphics/levels/level2/smallLog.png'),
    ['bgArt2'] = love.graphics.newImage('graphics/levels/level2/bg-art2.png'),

    --Level3
    ['bgArt3'] = love.graphics.newImage('graphics/levels/level3/bg-art3.png'),

    --Level4
    ['bgArt4'] = love.graphics.newImage('graphics/levels/level4/bg-art4.png'),

    --Transitions
    ['trans1'] = love.graphics.newImage('graphics/transitions/1-trans.png'),
    ['trans2'] = love.graphics.newImage('graphics/transitions/2-trans.png'),
    ['trans3'] = love.graphics.newImage('graphics/transitions/3-trans.png'),
    ['trans4'] = love.graphics.newImage('graphics/transitions/4-trans.png'),
    ['trans5'] = love.graphics.newImage('graphics/transitions/5-trans.png'),
    ['trans6'] = love.graphics.newImage('graphics/transitions/6-trans.png'),
    ['dot1'] = love.graphics.newImage('graphics/transitions/1-dot.png'),
    ['dot2'] = love.graphics.newImage('graphics/transitions/2-dot.png'),
    ['dot3'] = love.graphics.newImage('graphics/transitions/3-dot.png'),
    ['dot4'] = love.graphics.newImage('graphics/transitions/4-dot.png'),
    ['dot5'] = love.graphics.newImage('graphics/transitions/5-dot.png'),
    ['dot6'] = love.graphics.newImage('graphics/transitions/6-dot.png'),

    --portraits
    ['caraBig'] = love.graphics.newImage('graphics/portraits/caraBig.png'),
    ['caraBigEnd'] = love.graphics.newImage('graphics/portraits/caraBig-end.png'),
    ['profesorBig'] = love.graphics.newImage('graphics/portraits/profesorBig.png'),
    ['profesorBigEnd'] = love.graphics.newImage('graphics/portraits/profesorBig-end.png'),
    ['cara'] = love.graphics.newImage('graphics/portraits/cara.png'),
    ['caraEnd'] = love.graphics.newImage('graphics/portraits/cara-end.png'),
    ['tales'] = love.graphics.newImage('graphics/portraits/tales.png'),
    ['talesEnd'] = love.graphics.newImage('graphics/portraits/tales-end.png'),
}

gFrames = {
    ['idleSheet'] = GenerateQuads(gTextures['idleSheet'], 10, 10),
    ['walkSheet'] = GenerateQuads(gTextures['walkSheet'], 10, 10),
    ['jumpSheet'] = GenerateQuads(gTextures['jumpSheet'], 10, 11),
    ['fallSheet'] = GenerateQuads(gTextures['fallSheet'], 10, 12),
    ['slideSheet'] = GenerateQuads(gTextures['slideSheet'], 10, 10),
    ['wJumpSheet'] = GenerateQuads(gTextures['wJumpSheet'], 10, 10),
    ['rootDeathSheet'] = GenerateQuads(gTextures['rootDeathSheet'], 10, 10),
    ['electricSkyDeathSheet'] = GenerateQuadsMaxFrames(gTextures['electricSkyDeathSheet'], 10, 10, 27),
    ['spikeDeathSheet'] = GenerateQuadsMaxFrames(gTextures['spikeDeathSheet'], 10, 10, 22),
    ['leaves'] = GenerateQuads(gTextures['leaves'], 7, 7),
    ['coverSheet'] = GenerateQuadsMaxFrames(gTextures['coverSheet'], 256, 144, 22),
    ['uncoverSheet'] = GenerateQuadsMaxFrames(gTextures['uncoverSheet'], 256, 144, 25),

    ['appleSheet'] = GenerateQuadsMaxFrames(gTextures['appleSheet'], 5, 6, 10),
    ['doorSheet'] = GenerateQuadsMaxFrames(gTextures['doorSheet'], 8, 16, 16),
    ['talesIdleSheet'] = GenerateQuadsMaxFrames(gTextures['talesIdleSheet'], 10, 13, 24),

    ['enemySheet'] = GenerateQuads(gTextures['enemySheet'], 16, 16),

    ['infillTileSheet1'] = GenerateQuads(gTextures['infillTileSheet1'], 8, 8),

    ['edgeTileSheet1'] = GenerateQuads(gTextures['edgeTileSheet1'], 8, 8),
    ['edgeTileSheet1Down'] = GenerateQuads(gTextures['edgeTileSheet1Down'], 8, 8),
    ['edgeTileSheet1Left'] = GenerateQuads(gTextures['edgeTileSheet1Left'], 8, 8),
    ['edgeTileSheet1Right'] = GenerateQuads(gTextures['edgeTileSheet1Right'], 8, 8),
    ['edgeOuterCorner1'] = GenerateQuads(gTextures['edgeOuterCorner1'], 8, 8),
    ['edgeInnerCorner1'] = GenerateQuads(gTextures['edgeInnerCorner1'], 8, 8),
    ['edgeTileThin1'] = GenerateQuads(gTextures['edgeTileThin1'], 8, 8),
    ['edgeCornerThin1'] = GenerateQuads(gTextures['edgeCornerThin1'], 8, 8),
    ['foreProps1'] = GenerateQuads(gTextures['foreProps1'], 8, 8),
    --spikes
    ['spikeSheet1'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1'], 8, 8, 8),
    ['spikeSheet1Down'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1Down'], 8, 8, 8),
    ['spikeSheet1Right'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1Right'], 8, 8, 8),
    ['spikeSheet1Left'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1Left'], 8, 8, 8),
}