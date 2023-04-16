PlayerShotArrowState = Class { __includes = BaseState }

function PlayerShotArrowState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 8

    -- create hitbox based on where the player is and facing
    local direction = self.player.direction

    self.player:changeAnimation('idle-' .. self.player
    .direction)
end

function PlayerShotArrowState:enter(params)
    SOUNDS['bow']:stop()
    SOUNDS['bow']:play()

    -- restart bow shot animation
    self.player.currentAnimation:refresh()
end

function PlayerShotArrowState:update(dt)
    if love.keyboard.wasPressed('space') then
        self.player.bow:fire()
    end
end

function PlayerShotArrowState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(TEXTURES[anim.texture], FRAMES[anim.texture][anim:getCurrentFrame()], self.player.x, self.player.y)
    love.graphics.draw(TEXTURES['character-bow'], FRAMES['character-bow'][ENTITY_DEFS['player'].animations['shoot-bow-'..self.player.direction].frames[1]],
        math.floor(self.player.x + self.player.offsetX), math.floor(self.player.y + self.player.offsetY))

    -- debug for player and hurtbox collision rects
    -- love.graphics.setColor(love.math.colorFromBytes(255, 0, 255, 255))
    -- love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
    -- love.graphics.rectangle('line', self.hasBowHitbox.x, self.hasBowHitbox.y,
    -- self.hasBowHitbox.width, self.hasBowHitbox.height)
    -- love.graphics.setColor(love.math.colorFromBytes(255, 255, 255, 255))
end