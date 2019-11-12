function love.load()
    print("HI")
    font_size=30
    lineup_font_size=16
    font = love.graphics.newFont("Consolas.ttf", font_size)
    lineup_font = love.graphics.newFont("Consolas.ttf", lineup_font_size)

    r=0
    g=0
    b=0
    love.graphics.setFont(font)
    total_time=0
    width=800
    horizon=400
    text_x=-150
    color_cycle=0
end
function love.update(dt)
    total_time=total_time+dt
    r=math.sin(total_time)
    g=math.sin(total_time+90)
    b=math.sin(total_time+180)
    color_cycle=color_cycle+dt*2
end
function love.draw()
    love.graphics.setFont(font)

    l=0

    speed=100
    local i=0
    love.graphics.setColor(0, 0, 0.5)

    while i<80 do
        x1=(width/2)-(i*10)+width-((total_time*speed))
        x1=x1%width
        x2=(x1*2)-(width/2)
        love.graphics.line(x1,horizon,x2,horizon+300)
        i=i+1
    end
    love.graphics.line(0,horizon,width,horizon)
    i=0
    while i<80 do
        love.graphics.line(0,horizon+(i*10),width,horizon+(i*10))

        i=i+1
    end


    i=0
    love.graphics.setFont(lineup_font)

    for line in love.filesystem.lines("presents.txt") do
        b=b+0.01
        g=g+0.1

        love.graphics.setColor(r, g, b)
        love.graphics.print(line, 0, l)
        l=l+font_size
        i=i+1
    end

    i=0
    for line in love.filesystem.lines("htp.txt") do
        b=b+0.01
        g=g+0.1

        love.graphics.setColor(r, g, b)
        x=text_x+math.sin(color_cycle+(i/2))*20
        love.graphics.print(line, x, l)
        l=l+font_size-15
        i=i+1
    end
    love.graphics.setColor(1, 1, 1)
    l=0
    love.graphics.setFont(lineup_font)
    love.graphics.setColor(0.4, 0.4, 0.4)

    for line in love.filesystem.lines("sphere.txt") do
  

        love.graphics.print(line, 0, l)
        l=l+lineup_font_size
    end
    l=0
    love.graphics.setColor(1, 0, 1)

    love.graphics.setFont(lineup_font)

    for line in love.filesystem.lines("lineup.txt") do
  

        love.graphics.print(line, 0, l)
        l=l+lineup_font_size
    end
end