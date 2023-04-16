Bow = Class{}

function Bow:init(dungeon, player)
    -- dimensions
    self.dungeon = dungeon
    self.player = player

    -- default empty collision callback
    self.onCollide = function() end
end

function Bow:fire()
    local arrow = Arrow(self.player.x, self.player.y)
    table.insert(self.dungeon.currentRoom.projectiles, Projectile(arrow, self.player.direction))
    self.player:changeState('idle')
end
