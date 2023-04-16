PlayerShotArrowState = Class { __includes = BaseState }

function PlayerShotArrowState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 8

    self.player:changeAnimation('bow-' .. self.player
    .direction)
end

function PlayerShotArrowState:enter(params)
    SOUNDS['bow']:stop()
    SOUNDS['bow']:play()

    -- restart bow shot animation
    self.player.currentAnimation:refresh()
end

function PlayerShotArrowState:update(dt)
    self.player.bow:fire()

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end

    if love.keyboard.wasPressed('space') then
        self.player:changeState('shoot-arrow')
    end

end

function PlayerShotArrowState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(TEXTURES[anim.texture], FRAMES[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end