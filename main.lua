function love.load()
end

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()
local font = love.graphics.newFont(35)

local face_nums = {
    '4', '5', '6', '7', '8', '9', '10', '11', '12', '1', '2', '3',
}
love.graphics.setFont(font)
local function circle()
    local x, y, r = width / 2, height / 2, 200
    for i = 1, 12 do
        local angle = i * math.pi / 6
        local ptx, pty = x + r * math.cos(angle), y + r * math.sin(angle)
        love.graphics.print(face_nums[i], ptx - 18, pty - 18)
    end
end

local h = love.graphics.newCanvas(1200, 800)
local function hour_hand()
    local cx, cy = width / 2, height / 2
    love.graphics.setCanvas(h)
    love.graphics.setLineWidth(8)
    love.graphics.line(cx, cy, cx, cy - 150)
    love.graphics.setCanvas()
end

local m = love.graphics.newCanvas(1200, 800)
local function minute_hand()
    local cx, cy = width / 2, height / 2
    love.graphics.setCanvas(m)
    love.graphics.setLineWidth(4)
    love.graphics.line(cx, cy, cx, cy - 200)
    love.graphics.setCanvas()
end

local s = love.graphics.newCanvas(1200, 800)
local function second_hand()
    local cx, cy = width / 2, height / 2
    love.graphics.setCanvas(s)
    love.graphics.setLineWidth(1)
    love.graphics.line(cx, cy, cx, cy - 200)
    love.graphics.setCanvas()
end

local time
function love.update()
    time = os.date('%H : %M : %S')
    hour_hand()
    minute_hand()
    second_hand()
end

function love.draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(time)
    love.graphics.circle('fill', width / 2, height / 2, 225)
    love.graphics.setColor(1, 0, 0, 1)
    circle()
    love.graphics.translate(600, 400)
    love.graphics.draw(s, 0, 0, math.rad(os.date('%S') * 6), 1, 1, 600, 400)
    love.graphics.draw(m, 0, 0, math.rad(os.date('%M') * 6), 1, 1, 600, 400)
    love.graphics.draw(h, 0, 0, math.rad(os.date('%H') * 12), 1, 1, 600, 400)
end