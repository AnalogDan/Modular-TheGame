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
require 'src/states/game/Level2Math'
require 'src/states/game/Level3'
require 'src/states/game/Level4_0'
require 'src/states/game/Level4'
require 'src/states/game/Level4Real'
require 'src/states/game/Level5'
require 'src/states/game/Level6'

require 'src/states/game/partsOfLevels/Camera'
require 'src/states/game/partsOfLevels/SystemLeaves'
require 'src/states/game/partsOfLevels/SystemSand'
require 'src/states/game/partsOfLevels/SystemDialogue'
require 'src/states/game/partsOfLevels/SystemTransition'
require 'src/states/game/partsOfLevels/Level0Map'
require 'src/states/game/partsOfLevels/Level1Dialogue'
require 'src/states/game/partsOfLevels/Level1Map'
require 'src/states/game/partsOfLevels/Level2Dialogue'
require 'src/states/game/partsOfLevels/Level2Map'
require 'src/states/game/partsOfLevels/Level2MathDialogue'
require 'src/states/game/partsOfLevels/Level2MathMap'
require 'src/states/game/partsOfLevels/Level3Dialogue'
require 'src/states/game/partsOfLevels/Level3Map'
require 'src/states/game/partsOfLevels/Level4Dialogue'
require 'src/states/game/partsOfLevels/Level4Map'
require 'src/states/game/partsOfLevels/Level4_0Dialogue'
require 'src/states/game/partsOfLevels/Level4_0Map'
require 'src/states/game/partsOfLevels/Level4RealDialogue'
require 'src/states/game/partsOfLevels/Level4RealMap'
require 'src/states/game/partsOfLevels/Level5Dialogue'
require 'src/states/game/partsOfLevels/Level5Map'
require 'src/states/game/partsOfLevels/Level6Dialogue'
require 'src/states/game/partsOfLevels/Level6Map'

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
require 'src/states/entity/items/npcs/TalesState'
require 'src/states/entity/items/npcs/PitagorasState'
require 'src/states/entity/items/npcs/ArquimedesState'
require 'src/states/entity/items/npcs/JuarismiState'
require 'src/states/entity/items/npcs/FibonacciState'
require 'src/states/entity/items/npcs/EinsteinState'
require 'src/states/entity/items/npcs/TuringState'


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
    ['jump'] = love.audio.newSource('sounds/jump.wav', 'static'),
    ['grab'] = love.audio.newSource('sounds/grab.ogg', 'static'),
    ['step'] = love.audio.newSource('sounds/step.ogg', 'static'),
    ['fall'] = love.audio.newSource('sounds/fall.ogg', 'static'),
    ['slide'] = love.audio.newSource('sounds/slide.ogg', 'static'),
    ['electric'] = love.audio.newSource('sounds/electric.ogg', 'static'),
    ['electricWind'] = love.audio.newSource('sounds/electricWind.wav', 'static'),
    ['apple'] = love.audio.newSource('sounds/apple.wav', 'static'),
    ['spikes'] = love.audio.newSource('sounds/spikes.wav', 'static'),

    --Music
    ['music1'] = love.audio.newSource('sounds/music1_1.ogg', 'static'),
    ['ambience1'] = love.audio.newSource('sounds/ambience1.ogg', 'static'),
    ['menuMusic'] = love.audio.newSource('sounds/music/menuMusic.wav', 'static'),
    ['forestMusic'] = love.audio.newSource('sounds/music/forestMusic.wav', 'static'),
    ['desertMusic'] = love.audio.newSource('sounds/music/desertMusic.wav', 'static'),
    ['cityMusic'] = love.audio.newSource('sounds/music/cityMusic.wav', 'static'),
    ['bossMusic'] = love.audio.newSource('sounds/music/bossMusic.wav', 'static'),

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
    ['talesBlip'] = {
        love.audio.newSource('sounds/voices/talesBlip1.wav', 'static'),
        love.audio.newSource('sounds/voices/talesBlip2.wav', 'static'),
        love.audio.newSource('sounds/voices/talesBlip3.wav', 'static'),
        love.audio.newSource('sounds/voices/talesBlip4.wav', 'static'),
        },
    ['pitagorasBlip'] = {
        love.audio.newSource('sounds/voices/pitagorasBlip1.wav', 'static'),
        love.audio.newSource('sounds/voices/pitagorasBlip2.wav', 'static'),
        love.audio.newSource('sounds/voices/pitagorasBlip3.wav', 'static'),
        love.audio.newSource('sounds/voices/pitagorasBlip4.wav', 'static'),
        },
    ['arquimedesBlip'] = {
        love.audio.newSource('sounds/voices/arquimedesBlip1.wav', 'static'),
        love.audio.newSource('sounds/voices/arquimedesBlip2.wav', 'static'),
        love.audio.newSource('sounds/voices/arquimedesBlip3.wav', 'static'),
        love.audio.newSource('sounds/voices/arquimedesBlip4.wav', 'static'),
        },
    ['juarismiBlip'] = {
        love.audio.newSource('sounds/voices/juarismiBlip1.wav', 'static'),
        love.audio.newSource('sounds/voices/juarismiBlip2.wav', 'static'),
        love.audio.newSource('sounds/voices/juarismiBlip3.wav', 'static'),
        love.audio.newSource('sounds/voices/juarismiBlip4.wav', 'static'),
        },
    ['fibonacciBlip'] = {
        love.audio.newSource('sounds/voices/fibonacciBlip1.wav', 'static'),
        love.audio.newSource('sounds/voices/fibonacciBlip2.wav', 'static'),
        love.audio.newSource('sounds/voices/fibonacciBlip3.wav', 'static'),
        love.audio.newSource('sounds/voices/fibonacciBlip4.wav', 'static'),
        },
    ['einsteinBlip'] = {
        love.audio.newSource('sounds/voices/einsteinBlip1.wav', 'static'),
        love.audio.newSource('sounds/voices/einsteinBlip2.wav', 'static'),
        love.audio.newSource('sounds/voices/einsteinBlip3.wav', 'static'),
        love.audio.newSource('sounds/voices/einsteinBlip4.wav', 'static'),
        },
    ['turingBlip'] = {
        love.audio.newSource('sounds/voices/turingBlip1.wav', 'static'),
        love.audio.newSource('sounds/voices/turingBlip2.wav', 'static'),
        love.audio.newSource('sounds/voices/turingBlip3.wav', 'static'),
        love.audio.newSource('sounds/voices/turingBlip4.wav', 'static'),
        },
    
    --Menus
    ['boardBlip'] = {
        love.audio.newSource('sounds/menus/boardBlip1.wav', 'static'),
        love.audio.newSource('sounds/menus/boardBlip2.wav', 'static'),
        love.audio.newSource('sounds/menus/boardBlip3.wav', 'static'),
        },
    ['menuClick'] = love.audio.newSource('sounds/menus/menuClick.wav', 'static'),
    ['paperFast'] = love.audio.newSource('sounds/menus/paperFast.wav', 'static'),
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
    ['sand'] = love.graphics.newImage('graphics/sand.png'),
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

    --items
    ['appleSheet'] = love.graphics.newImage('graphics/apple-sheet.png'),
    ['doorSheet'] = love.graphics.newImage('graphics/door-sheet.png'),
    --npcs
    ['talesIdleSheet'] = love.graphics.newImage('graphics/npcs/tales-idle-sheet.png'),
    ['pitagorasIdleSheet'] = love.graphics.newImage('graphics/npcs/pitagoras-idle-sheet.png'),
    ['arquimedesIdleSheet'] = love.graphics.newImage('graphics/npcs/arquimedes-idle-sheet.png'),
    ['juarismiIdleSheet'] = love.graphics.newImage('graphics/npcs/juarismi-idle-sheet.png'),
    ['fibonacciIdleSheet'] = love.graphics.newImage('graphics/npcs/fibonacci-idle-sheet.png'),
    ['einsteinIdleSheet'] = love.graphics.newImage('graphics/npcs/einstein-idle-sheet.png'),
    ['turingIdleSheet'] = love.graphics.newImage('graphics/npcs/turing-idle-sheet.png'),

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

    --tileSets 
    --Desert
    ['backgroundTile2'] = love.graphics.newImage('graphics/desertTiles/skyDesert.png'),
    ['fillTile2'] = love.graphics.newImage('graphics/desertTiles/fill-tile-2.png'),
    ['infillTileSheet2'] = love.graphics.newImage('graphics/desertTiles/infill-tilesheet-2.png'),
    ['edgeTileSheet2'] = love.graphics.newImage('graphics/desertTiles/edge-tilesheet-2.png'),
    ['edgeTileSheet2Down'] = love.graphics.newImage('graphics/desertTiles/edge-tilesheet-2-down.png'),
    ['edgeTileSheet2Left'] = love.graphics.newImage('graphics/desertTiles/edge-tilesheet-2-left.png'),
    ['edgeTileSheet2Right'] = love.graphics.newImage('graphics/desertTiles/edge-tilesheet-2-right.png'),
    ['edgeOuterCorner2'] = love.graphics.newImage('graphics/desertTiles/edge-outer-corner2.png'),
    ['edgeInnerCorner2'] = love.graphics.newImage('graphics/desertTiles/edge-inner-corner2.png'),
    ['edgeTileThin2'] = love.graphics.newImage('graphics/desertTiles/edge-tilesheet-thin-2.png'),
    ['edgeCornerThin2'] = love.graphics.newImage('graphics/desertTiles/edge-outer-corner-thin2.png'),
    ['foreProps2'] = love.graphics.newImage('graphics/desertTiles/fore-props-sheet2.png'),

    --City
    ['backgroundTile3'] = love.graphics.newImage('graphics/cityTiles/skyCity.png'),
    ['fillTile3'] = love.graphics.newImage('graphics/cityTiles/fill-tile-3.png'),
    ['infillTileSheet3'] = love.graphics.newImage('graphics/cityTiles/infill-tilesheet-3.png'),
    ['edgeTileSheet3'] = love.graphics.newImage('graphics/cityTiles/edge-tilesheet-3.png'),
    ['edgeTileSheet3Down'] = love.graphics.newImage('graphics/cityTiles/edge-tilesheet-3-down.png'),
    ['edgeTileSheet3Left'] = love.graphics.newImage('graphics/cityTiles/edge-tilesheet-3-left.png'),
    ['edgeTileSheet3Right'] = love.graphics.newImage('graphics/cityTiles/edge-tilesheet-3-right.png'),
    ['edgeOuterCorner3'] = love.graphics.newImage('graphics/cityTiles/edge-outer-corner3.png'),
    ['edgeInnerCorner3'] = love.graphics.newImage('graphics/cityTiles/edge-inner-corner3.png'),
    ['edgeTileThin3'] = love.graphics.newImage('graphics/cityTiles/edge-tilesheet-thin-3.png'),
    ['edgeCornerThin3'] = love.graphics.newImage('graphics/cityTiles/edge-outer-corner-thin3.png'),

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
    ['bgArt2Math'] = love.graphics.newImage('graphics/levels/level2/bg-art2Math.png'),

    --Level3
    ['bgArt3'] = love.graphics.newImage('graphics/levels/level3/bg-art3.png'),

    --Level4
    ['bgArt4'] = love.graphics.newImage('graphics/levels/level4/bg-art4.png'),
    ['bgArt4_0'] = love.graphics.newImage('graphics/levels/bg-art4_0.png'),
    ['bgArt4Real'] = love.graphics.newImage('graphics/levels/bg-art4Real.png'),
    ['bgArt5'] = love.graphics.newImage('graphics/levels/bg-art5.png'),
    ['bgArt6'] = love.graphics.newImage('graphics/levels/bg-art6.png'),

    --Transitions
    ['trans1'] = love.graphics.newImage('graphics/transitions/1-trans.png'),
    ['trans2'] = love.graphics.newImage('graphics/transitions/2-trans.png'),
    ['trans3'] = love.graphics.newImage('graphics/transitions/3-trans.png'),
    ['trans4'] = love.graphics.newImage('graphics/transitions/4-trans.png'),
    ['trans5'] = love.graphics.newImage('graphics/transitions/5-trans.png'),
    ['trans6'] = love.graphics.newImage('graphics/transitions/6-trans.png'),
    ['trans7'] = love.graphics.newImage('graphics/transitions/7-trans.png'),
    ['trans8'] = love.graphics.newImage('graphics/transitions/8-trans.png'),
    ['trans9'] = love.graphics.newImage('graphics/transitions/9-trans.png'),
    ['trans10'] = love.graphics.newImage('graphics/transitions/10-trans.png'),
    ['dot1'] = love.graphics.newImage('graphics/transitions/1-dot.png'),
    ['dot2'] = love.graphics.newImage('graphics/transitions/2-dot.png'),
    ['dot3'] = love.graphics.newImage('graphics/transitions/3-dot.png'),
    ['dot4'] = love.graphics.newImage('graphics/transitions/4-dot.png'),
    ['dot5'] = love.graphics.newImage('graphics/transitions/5-dot.png'),
    ['dot6'] = love.graphics.newImage('graphics/transitions/6-dot.png'),
    ['dot7'] = love.graphics.newImage('graphics/transitions/7-dot.png'),
    ['dot8'] = love.graphics.newImage('graphics/transitions/8-dot.png'),
    ['dot9'] = love.graphics.newImage('graphics/transitions/9-dot.png'),
    ['dot10'] = love.graphics.newImage('graphics/transitions/10-dot.png'),

    --portraits
    ['caraBig'] = love.graphics.newImage('graphics/portraits/caraBig.png'),
    ['caraBigEnd'] = love.graphics.newImage('graphics/portraits/caraBig-end.png'),
    ['profesorBig'] = love.graphics.newImage('graphics/portraits/profesorBig.png'),
    ['profesorBigEnd'] = love.graphics.newImage('graphics/portraits/profesorBig-end.png'),
    ['cara'] = love.graphics.newImage('graphics/portraits/cara.png'),
    ['caraEnd'] = love.graphics.newImage('graphics/portraits/cara-end.png'),
    ['tales'] = love.graphics.newImage('graphics/portraits/tales.png'),
    ['talesEnd'] = love.graphics.newImage('graphics/portraits/tales-end.png'),
    ['pitagoras'] = love.graphics.newImage('graphics/portraits/pitagoras.png'),
    ['pitagorasEnd'] = love.graphics.newImage('graphics/portraits/pitagoras-end.png'),
    ['arquimedes'] = love.graphics.newImage('graphics/portraits/arquimedes.png'),
    ['arquimedesEnd'] = love.graphics.newImage('graphics/portraits/arquimedes-end.png'),
    ['juarismi'] = love.graphics.newImage('graphics/portraits/al-juarismi.png'),
    ['juarismiEnd'] = love.graphics.newImage('graphics/portraits/al-juarismi-end.png'),
    ['fibonacci'] = love.graphics.newImage('graphics/portraits/fibonacci.png'),
    ['fibonacciEnd'] = love.graphics.newImage('graphics/portraits/fibonacci-end.png'),
    ['einstein'] = love.graphics.newImage('graphics/portraits/einstein.png'),
    ['einsteinEnd'] = love.graphics.newImage('graphics/portraits/einstein-end.png'),
    ['turing'] = love.graphics.newImage('graphics/portraits/turing.png'),
    ['turingEnd'] = love.graphics.newImage('graphics/portraits/turing-end.png'),
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
    ['sand'] = GenerateQuads(gTextures['sand'], 2, 2),
    ['coverSheet'] = GenerateQuadsMaxFrames(gTextures['coverSheet'], 256, 144, 22),
    ['uncoverSheet'] = GenerateQuadsMaxFrames(gTextures['uncoverSheet'], 256, 144, 25),

    --items
    ['appleSheet'] = GenerateQuadsMaxFrames(gTextures['appleSheet'], 5, 6, 10),
    ['doorSheet'] = GenerateQuadsMaxFrames(gTextures['doorSheet'], 8, 16, 16),
    --npcs
    ['talesIdleSheet'] = GenerateQuadsMaxFrames(gTextures['talesIdleSheet'], 10, 13, 24),
    ['pitagorasIdleSheet'] = GenerateQuadsMaxFrames(gTextures['pitagorasIdleSheet'], 10, 13, 25),
    ['arquimedesIdleSheet'] = GenerateQuadsMaxFrames(gTextures['arquimedesIdleSheet'], 10, 13, 25),
    ['juarismiIdleSheet'] = GenerateQuadsMaxFrames(gTextures['juarismiIdleSheet'], 10, 13, 25),
    ['fibonacciIdleSheet'] = GenerateQuadsMaxFrames(gTextures['fibonacciIdleSheet'], 10, 13, 23),
    ['einsteinIdleSheet'] = GenerateQuadsMaxFrames(gTextures['einsteinIdleSheet'], 10, 13, 24),
    ['turingIdleSheet'] = GenerateQuadsMaxFrames(gTextures['turingIdleSheet'], 10, 13, 22),
    
    

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

    --tileSets 
    --Desert
    ['infillTileSheet2'] = GenerateQuads(gTextures['infillTileSheet2'], 8, 8),
    ['edgeTileSheet2'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet2'], 8, 8, 5),
    ['edgeTileSheet2Down'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet2Down'], 8, 8, 5),
    ['edgeTileSheet2Left'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet2Left'], 8, 8, 5),
    ['edgeTileSheet2Right'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet2Right'], 8, 8, 5),
    ['edgeOuterCorner2'] = GenerateQuads(gTextures['edgeOuterCorner2'], 8, 8),
    ['edgeInnerCorner2'] = GenerateQuads(gTextures['edgeInnerCorner2'], 8, 8),
    ['edgeTileThin2'] = GenerateQuads(gTextures['edgeTileThin2'], 8, 8),
    ['edgeCornerThin2'] = GenerateQuads(gTextures['edgeCornerThin2'], 8, 8),
    ['foreProps2'] = GenerateQuadsMaxFrames(gTextures['foreProps1'], 8, 8, 5),
    --City
    ['infillTileSheet3'] = GenerateQuads(gTextures['infillTileSheet3'], 8, 8),
    ['edgeTileSheet3'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet3'], 8, 8, 1),
    ['edgeTileSheet3Down'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet3Down'], 8, 8, 1),
    ['edgeTileSheet3Left'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet3Left'], 8, 8, 1),
    ['edgeTileSheet3Right'] = GenerateQuadsMaxFrames(gTextures['edgeTileSheet3Right'], 8, 8, 1),
    ['edgeOuterCorner3'] = GenerateQuads(gTextures['edgeOuterCorner3'], 8, 8),
    ['edgeInnerCorner3'] = GenerateQuads(gTextures['edgeInnerCorner3'], 8, 8),
    ['edgeTileThin3'] = GenerateQuads(gTextures['edgeTileThin3'], 8, 8),
    ['edgeCornerThin3'] = GenerateQuads(gTextures['edgeCornerThin3'], 8, 8),

    --spikes
    ['spikeSheet1'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1'], 8, 8, 8),
    ['spikeSheet1Down'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1Down'], 8, 8, 8),
    ['spikeSheet1Right'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1Right'], 8, 8, 8),
    ['spikeSheet1Left'] = GenerateQuadsMaxFrames(gTextures['spikeSheet1Left'], 8, 8, 8),
}