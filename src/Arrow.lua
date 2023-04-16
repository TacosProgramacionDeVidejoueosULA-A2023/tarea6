Arrow = Class{}

function Arrow:init(x, y)
    -- dimensions
    self.x = x
    self.y = y
    self.width = 16
    self.height = 16

    -- default empty collision callback
    self.onCollide = function() end
end

function Arrow:update(dt)

end

function Arrow:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(TEXTURES['arrow'], FRAMES['arrow'][1],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end
