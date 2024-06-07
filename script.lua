local result = get("result")

local width = 40
local height = 20
local snake = {{10, 10}, {10, 9}, {10, 8}}
local direction = {0, 1}
local food = {5, 5}

local function clear_screen()
    result.set_content("")
end


function sleep (a) 
    local sec = tonumber(os.clock() + a); 
    while (os.clock() < sec) do 
    end 
end

local function print_board()
    clear_screen()
    for y = 0, height - 1 do
        for x = 0, width - 1 do
            local is_snake = false
            for _, segment in ipairs(snake) do
                if segment[1] == y and segment[2] == x then
                    is_snake = true
                    break
                end
            end
            if is_snake then
                result.set_content(result.get_content() .. "#")
            elseif y == food[1] and x == food[2] then
                result.set_content(result.get_content() .. "*")
            else
                result.set_content(result.get_content() .. " ")
            end
        end
        result.set_content(result.get_content() .. "\n")
    end
end

local function update_snake()
    local new_head = {snake[1][1] + direction[1], snake[1][2] + direction[2]}
    if new_head[1] < 0 or new_head[1] >= height or new_head[2] < 0 or new_head[2] >= width then
        result.set_content(result.get_content() .. "Game Over!\n")
        os.exit()
    end
    for _, segment in ipairs(snake) do
        if segment[1] == new_head[1] and segment[2] == new_head[2] then
            result.set_content(result.get_content() .. "Game Over!\n")
            os.exit()
        end
    end
    table.insert(snake, 1, new_head)
    if new_head[1] == food[1] and new_head[2] == food[2] then
        food = {math.random(height) - 1, math.random(width) - 1}
    else
        table.remove(snake)
    end
end

local function change_direction(new_direction)
    if new_direction[1] == -direction[1] and new_direction[2] == -direction[2] then
        return
    end
    direction = new_direction
end



local key_to_direction = {
    w = {-1, 0},
    s = {1, 0},
    a = {0, -1},
    d = {0, 1}
}

clear_screen()

function snake1()
    print_board()
    update_snake()
    set_timeout(snake1, 5)
end

get("input-key").on_input(function(content)
    local key = content:sub(-1, -1):lower()
    if key == 'w' then
        direction = {-1,0}
    end
    if key == 's' then
        direction = {1,0}
    end
    if key =='a' then
        direction = {0,-1}
    end
    if key == 'd' then
        direction = {0,1}
    end


end)

snake1()
