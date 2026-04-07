SystemTransition = {}

function SystemTransition.init()
    SystemTransition.drawAt1080p = false
    SystemTransition.active = false

    SystemTransition.coverAnimation = Animation(gFrames['coverSheet'], 0.02, false)
    SystemTransition.uncoverAnimation = Animation(gFrames['uncoverSheet'], 0.02, false)
    SystemTransition.coverTexture = gTextures['coverSheet']
    SystemTransition.uncoverTexture = gTextures['uncoverSheet']
    SystemTransition.currentAnimation = nil
    SystemTransition.currentTexture = nil

    SystemTransition.onFinish = nil
    SystemTransition.mode = nil
end

function SystemTransition.start(mode, onFinish)
    SystemTransition.active = true
    SystemTransition.mode = mode
    SystemTransition.onFinish = onFinish
    if mode == 'cover' then
        SystemTransition.currentAnimation = SystemTransition.coverAnimation
        SystemTransition.currentTexture = SystemTransition.coverTexture
    else
        SystemTransition.currentAnimation = SystemTransition.uncoverAnimation
        SystemTransition.currentTexture = SystemTransition.uncoverTexture
    end
    SystemTransition.currentAnimation:reset()
end

function SystemTransition.update(dt)
    if not SystemTransition.active then return end
    SystemTransition.currentAnimation:update(dt)

    if SystemTransition.currentAnimation.finished then
        SystemTransition.active = false

        if SystemTransition.onFinish then
            local callback = SystemTransition.onFinish
            SystemTransition.onFinish = nil
            callback()
        end
    end
end

function SystemTransition.render()
    if not SystemTransition.active then return end
    local frame = SystemTransition.currentAnimation:getFrame()

    if not SystemTransition.drawAt1080p then
        love.graphics.draw(
            SystemTransition.currentTexture,
            frame,
            0,
            0
        )
    end

    if SystemTransition.drawAt1080p then
        love.graphics.draw(
            SystemTransition.currentTexture,
            frame,
            0,
            0,
            0,
            7.5,
            7.5
        )
    end
end