local result = get("result")
local button = get("button")
num = 20
button.on_click(function()
    result.set_content("lower")
end)
