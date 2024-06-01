local result = get("result")
local button = get("button")
num = math.random(100)
local inp = get("delete-input-key")
button.on_click(function()
    if tonumber(inp.get_content()) > num then result.set_content("lower") end
    if tonumber(inp.get_content()) < num then result.set_content("higher") end
    if tonumber(inp.get_content()) == num then result.set_content("you win!!!") end
end)
