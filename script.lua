local result = get("result")
local text = get("text")
local button = get("done-3")
local num = 20

button.on_click(function()
    result.set_content("lower")
end)
