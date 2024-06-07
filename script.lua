local result = get("result")
local button = get("button")
num = math.random(100)
local inp = get("delete-input-key")
local button2 = get("button2")
local fjs = get("fjavascript")
button.on_click(function()
    --fjs.set_content(fjs.get_content() .. "\nfuck javascript")
    if tonumber(inp.get_content()) > num then result.set_content("lower") end
    if tonumber(inp.get_content()) < num then result.set_content("higher") end
    if tonumber(inp.get_content()) == num then result.set_content("you win!!!") end
end)

button2.on_click(function()
    num = math.random(100)
