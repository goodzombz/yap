local result = get("result")
local text = get("text")
local button = get("button")
local num = 20

button.on_click(function()
    result.set_content("lower")
end)
